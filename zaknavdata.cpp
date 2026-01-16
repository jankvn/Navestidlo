#include "zaknavdata.h"
#include "comboboxhandler.h"
#include <stdio.h>
#include "sqlite3.h"
#include <QCoreApplication>

QString zxnazev = "";
QString zxbarva = "";
QString zxhindct = "";
QString zxblikr = "";
QString zxblik1 = "";
QString zxblik2 = "";
QString zxdolindc = "";
QString zxlinka1 = "";
QString zxlinka2 = "";
QString zxvyznam = "";
zaknavdata::zaknavdata(QObject *parent)
    : QObject{parent}
{}

void zaknavdata::xdata(QString sxnazev, QString sxbarva, QString sxhindct,QString sxblikr,QString sxblik1, QString sxblik2, QString sxdolindc, QString sxlinka1, QString sxlinka2, QString sxvyznam)
{
    zxnazev = sxnazev;
    zxbarva = sxbarva;
    zxhindct = sxhindct;
    zxblikr = sxblikr;
    zxblik1 = sxblik1;
    zxblik2 = sxblik2;
    zxdolindc = sxdolindc;
    zxlinka1 = sxlinka1;
    zxlinka2 = sxlinka2;
    zxvyznam = sxvyznam;
    qDebug() << "Nazev: " << sxbarva;
}

QString zaknavdata::nazev()
{
    return zxnazev;
}
QString zaknavdata::barva()
{
    return zxbarva;
}
QString zaknavdata::hindct()
{
    return zxhindct;
}
QString zaknavdata::blikr()
{
    return zxblikr;
}
QString zaknavdata::blik1()
{
    return zxblik1;
}
QString zaknavdata::blik2()
{
    return zxblik2;
}
QString zaknavdata::dolindc()
{
    return zxdolindc;
}
QString zaknavdata::linka1()
{
    return zxlinka1;
}
QString zaknavdata::linka2()
{
    return zxlinka2;
}
QString zaknavdata::vyznam()
{
    return zxvyznam;
}
