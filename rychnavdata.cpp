#include "rychnavdata.h"

QString xnazev = "";
QString xbarva = "";
QString xhindct = "";
QString xblikr = "";
QString xblik1 = "";
QString xblik2 = "";
QString xdolindc = "";
QString xlinka1 = "";
QString xlinka2 = "";
QString xvyznam = "";
rychnavdata::rychnavdata(QObject *parent)
    : QObject{parent}
{}

void rychnavdata::xdata(QString sxnazev, QString sxbarva, QString sxhindct,QString sxblikr,QString sxblik1, QString sxblik2, QString sxdolindc, QString sxlinka1, QString sxlinka2, QString sxvyznam)
{
    xnazev = sxnazev;
    xbarva = sxbarva;
    xhindct = sxhindct;
    xblikr = sxblikr;
    xblik1 = sxblik1;
    xblik2 = sxblik2;
    xdolindc = sxdolindc;
    xlinka1 = sxlinka1;
    xlinka2 = sxlinka2;
    xvyznam = sxvyznam;
    qDebug() << "Nazev: " << sxbarva;
}

QString rychnavdata::nazev()
{
    return xnazev;
}
QString rychnavdata::barva()
{
    return xbarva;
}
QString rychnavdata::hindct()
{
    return xhindct;
}
QString rychnavdata::blikr()
{
    return xblikr;
}
QString rychnavdata::blik1()
{
    return xblik1;
}
QString rychnavdata::blik2()
{
    return xblik2;
}
QString rychnavdata::dolindc()
{
    return xdolindc;
}
QString rychnavdata::linka1()
{
    return xlinka1;
}
QString rychnavdata::linka2()
{
    return xlinka2;
}
QString rychnavdata::vyznam()
{
    return xvyznam;
}
