#include "zaknavdata.h"
#include "comboboxhandler.h"
#include <stdio.h>
#include "sqlite3.h"
#include <QCoreApplication>

QString xtext = "";
QString xpp = "";
QString abarva = "";
QString blikxt = "";
QString blikxb = "";
//QQmlApplicationEngine engine;
zaknavdata::zaknavdata(QObject *parent): QObject{parent}
{}
void zaknavdata::nazev(QString sxnazev, QString sxpopis)
{
    //QString m_text;
    /*if (m_text == sxnazev)
        return;
    m_text = sxnazev;*/
    //xtext = sxnazev;
    //emit axnazev(sxnazev);
    //axnazev(sxnazev);
    xtext = sxnazev;
    xpp = sxpopis;
    //emit valueChanged(xtext, xpp);
}
void zaknavdata::barva(QString sxbarva, QString sxblikt, QString sxblikb)
{
    //QString m_text;
    /*if (m_text == sxnazev)
        return;
    m_text = sxnazev;*/
    //xtext = sxnazev;
    //emit axnazev(sxnazev);
    //axnazev(sxnazev);
    abarva = sxbarva;
    blikxt = sxblikt;
    blikxb = sxblikb;
    qDebug() << "Nazev: " << abarva;
    qDebug() << "Nazev: " << blikxt;
    qDebug() << "Nazev: " << blikxb;
    //emit valueChanged(xtext, xpp);
}
QString zaknavdata::xnazev()
{
    return xtext;
}
QString zaknavdata::xpopis()
{
    return xpp;
}
QString zaknavdata::xbarva()
{
    return abarva;
}
QString zaknavdata::xblikt()
{
    return blikxt;
}
QString zaknavdata::xblikb()
{
    return blikxb;
}
/*void zaknavdata::popis(QString xpopis)
{
    qDebug() << "AHOJ!";
}*/
