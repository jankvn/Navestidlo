#include "ostnavdata.h"
/*QString nazev = "";
QString navestidlo = "";
QString vzhled = "";
QString popis = "";
QString ico = "";
QString den = "";
QString noc = "";
QString vyh = "";
QString vyhplan = "";
QString samovratnav = "";
QString blikx = "";*/

ostnavdata::ostnavdata(QObject *parent)
    : QObject{parent}
{}
void ostnavdata::vypisdata(const QString &id)
{
    QSqlDatabase dbs;
    if (QSqlDatabase::contains("mainconn")) {
        dbs = QSqlDatabase::database("mainconn");
    } else {
        dbs = QSqlDatabase::addDatabase("QSQLITE", "mainconn");
        dbs.setDatabaseName(QCoreApplication::applicationDirPath() + "/main.db");
    }

    if (!dbs.open()) {
        qDebug() << "Failed to open database!";
        return;
    }

    QSqlQuery query(dbs);
    query.prepare("SELECT * FROM navestinepr WHERE id = :id");
    query.bindValue(":id", id);

    if (!query.exec()) {
        qDebug() << "Error fetching data:" << query.lastError().text();
        return;
    }

    if (query.next()) {
        nazev       = query.value(1).toString();
        navestidlo  = query.value(2).toString();
        popis       = query.value(4).toString();
        ico         = query.value(5).toString();
        den         = query.value(6).toString();
        noc         = query.value(7).toString();
        vyh         = query.value(8).toString();
        vyhplan     = query.value(9).toString();
        samovratnav = query.value(10).toString();
        blikx       = query.value(11).toString();
    }
}
QVariantList convertToList(const QString &popis) {
    QStringList lines = popis.split("<br>", Qt::SkipEmptyParts);
    QVariantList result;

    for (QString line : lines) {
        line = line.trimmed();
        QVariantMap item;
        if (line.startsWith("•")) {
            item["bullet"] = true;
            item["text"] = line.mid(1).trimmed();
        } else {
            item["bullet"] = false;
            item["text"] = line;
        }
        result << item;
    }
    return result;
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
QVariantList ostnavdata::xpopisModel()
{
    return convertToList(popis);
}
