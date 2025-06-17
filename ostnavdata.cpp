#include "ostnavdata.h"
QString nazev = "";
QString navestidlo = "";
QString vzhled = "";
QString popis = "";
QString ico = "";
QString den = "";
QString noc = "";
QString vyh = "";
QString vyhplan = "";
QString samovratnav = "";
QString blikx = "";
ostnavdata::ostnavdata(QObject *parent)
    : QObject{parent}
{}

void ostnavdata::vypisdata(QString id)
{
    //qDebug() << "Value: " << newValue;
    QSqlDatabase dbs = QSqlDatabase::addDatabase("QSQLITE");
    dbs.setDatabaseName(QCoreApplication::applicationDirPath().append("/ostatni.db"));
    if (!dbs.open()) {
        qDebug() << "Failed to open database!";
    } else {
        qDebug() << "Database opened successfully!";
        QSqlQuery query;
        query.prepare("SELECT * FROM navestinepr WHERE id = :id");
        query.bindValue(":id", id);
        if (!query.exec()) {
            qDebug() << "Error fetching data:" << query.lastError().text();
        } else {
            while (query.next()) {
                //QString zkrt = query.value(1).toString();
                nazev = query.value(1).toString();
                navestidlo = query.value(2).toString();
                popis = query.value(4).toString();
                ico = query.value(5).toString();
                den = query.value(6).toString();
                noc = query.value(7).toString();
                vyh = query.value(8).toString();
                vyhplan = query.value(9).toString();
                samovratnav = query.value(10).toString();
                blikx = query.value(11).toString();
                //blikxxt = query.value(5).toString();
                //blikxxb = query.value(6).toString();
                //qDebug() << "ID:" << id << ", Zkrt:" << nn << ", Název:" << pp;
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

QString ostnavdata::xnazev()
{
    return nazev;
}

QString ostnavdata::xnavestidlo()
{
    return navestidlo;
}

QString ostnavdata::xvzhled()
{
    return vzhled;
}

QString ostnavdata::xpopis()
{
    return popis;
}

QString ostnavdata::xico()
{
    return ico;
}

QString ostnavdata::xden()
{
    return den;
}

QString ostnavdata::xnoc()
{
    return noc;
}

QString ostnavdata::xvyh()
{
    return vyh;
}

QString ostnavdata::xvyhplan()
{
    return vyhplan;
}

QString ostnavdata::xsamovratnav()
{
    return samovratnav;
}

QString ostnavdata::xblik()
{
    return blikx;
}
