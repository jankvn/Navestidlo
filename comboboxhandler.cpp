#include "comboboxhandler.h"
#include "zaknavdata.h"
#include "rychnavdata.h"
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>
#include <QCoreApplication>
#include <QStandardPaths>
#include <QFile>
#include <QDir>
#include <QDebug>
ComboBoxHandler::ComboBoxHandler(QObject *parent)
    : QObject{parent}
{}
void ComboBoxHandler::onItemChanged(int newValue)
{
    //qDebug() << "Value: " << newValue;
    QSqlDatabase xdb = QSqlDatabase::addDatabase("QSQLITE");
    QString xdbPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/main.db";
    qDebug() << xdbPath;
    xdb.setDatabaseName(xdbPath);
    if (!xdb.open()) {
        qFatal("Failed to connect to database.");
    } else {
        QString nazev = "";
        QString barva = "";
        QString hindct = "";
        QString blikr = "";
        QString blik1 = "";
        QString blik2 = "";
        QString dolindc = "";
        QString linka1 = "";
        QString linka2 = "";
        QString vyznam = "";
        qDebug() << "Database opened successfully!";
        QSqlQuery xquery;
        xquery.prepare("SELECT * FROM navesti WHERE id = :id");
        xquery.bindValue(":id", newValue);
        if (!xquery.exec()) {
            qDebug() << "Error fetching data:" << xquery.lastError().text();
        } else {
            while (xquery.next()) {
                //QString zkrt = query.value(1).toString();
                nazev = xquery.value(2).toString();
                barva = xquery.value(3).toString();
                hindct = xquery.value(4).toString();
                blikr = xquery.value(5).toString();
                blik1 = xquery.value(6).toString();
                blik2 = xquery.value(7).toString();
                dolindc = xquery.value(8).toString();
                linka1 = xquery.value(9).toString();
                linka2 = xquery.value(10).toString();
                vyznam = xquery.value(12).toString();
                zaknavdata().xdata(nazev,barva,hindct,blikr,blik1,blik2,dolindc,linka1,linka2,vyznam);
                //zaknavdata().popis(query.value(12).toString());
                //QString snazev = query.value(2).toString();
                //int id = query.value(0).toInt();
            }
        }

        //std::string s = std::to_string(newValue);
        /*query.exec("SELECT * FROM navesti WHERE id = 0");
        if (query.next()) {
        int id = query.value(0).toInt();
        QString nazev = query.value(1).toString();
        qDebug() << "ID:" << id << ", Nazev:" << nazev;
        }*/
    }}
void ComboBoxHandler::vybratrychnav(int a, int b)
{
    QSqlDatabase ydb = QSqlDatabase::addDatabase("QSQLITE");
    QString ydbPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/main.db";
    qDebug() << ydbPath;
    ydb.setDatabaseName(ydbPath);
    if (!ydb.open()) {
        qDebug() << "Failed to open database!";
    } else {
        if (a == 0){
            a = 8;
        }
        QString nazev = "";
        QString barva = "";
        QString hindct = "";
        QString blikr = "";
        QString blik1 = "";
        QString blik2 = "";
        QString dolindc = "";
        QString linka1 = "";
        QString linka2 = "";
        QString vyznam = "";


        qDebug() << "ID:" << a << ", Nazev:" << b;
        int s = a << b;
        QString xa = QString::number(a);
        QString xb = QString::number(b);
        QString xs = xa + xb;
        qDebug() << "Database opened successfully!";
        QSqlQuery query;
        query.prepare("SELECT * FROM rychs WHERE idx = '"+xs+"';");
        //query.bindValue(":id", xs);

        if (!query.exec()) {
            qDebug() << "Error fetching data:" << query.lastError().text();
        } else {
            while (query.next()) {
                //QString zkrt = query.value(1).toString();
                nazev = query.value(3).toString();
                barva = query.value(4).toString();
                hindct = query.value(5).toString();
                blikr = query.value(6).toString();
                blik1 = query.value(7).toString();
                blik2 = query.value(8).toString();
                dolindc = query.value(9).toString();
                linka1 = query.value(10).toString();
                linka2 = query.value(11).toString();
                vyznam = query.value(12).toString();
                rychnavdata().xdata(nazev,barva,hindct,blikr,blik1,blik2,dolindc,linka1,linka2,vyznam);
                //zaknavdata().popis(query.value(12).toString());
                //QString snazev = query.value(2).toString();
                //int id = query.value(0).toInt();
            }
        }

        //std::string s = std::to_string(newValue);
        /*query.exec("SELECT * FROM navesti WHERE id = 0");
        if (query.next()) {
        int id = query.value(0).toInt();
        QString nazev = query.value(1).toString();
        qDebug() << "ID:" << id << ", Nazev:" << nazev;
        }*/
    }}

