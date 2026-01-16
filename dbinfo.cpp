#include "dbinfo.h"
QString lastupdate = "";

dbinfo::dbinfo(QObject *parent): QObject{parent} {}

void dbinfo::vypisdata()
{
    //qDebug() << "Value: " << newValue;
    QSqlDatabase dbs = QSqlDatabase::addDatabase("QSQLITE");
    QString odbPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/main.db";
    qDebug() << odbPath;
    dbs.setDatabaseName(odbPath);
    if (!dbs.open()) {
        qFatal("Failed to connect to database.");
    } else {
        qDebug() << "Database opened successfully!";
        QSqlQuery query;
        query.prepare("SELECT * FROM dbinfo");
        if (!query.exec()) {
            qDebug() << "Error fetching data:" << query.lastError().text();
        } else {
            while (query.next()) {
                //QString zkrt = query.value(1).toString();
                lastupdate = query.value(1).toString();
            }
        }
        //std::string s = std::to_string(newValue);
        /*query.exec("SELECT * FROM navesti WHERE id = 0");
        if (query.next()) {
        int id = query.value(0).toInt();
        QString nazev = query.value(1).toString();
        qDebug() << "ID:" << id << ", Nazev:" << nazev;
        }*/
    }
}

QString dbinfo::xlu()
{
    return lastupdate;
}
