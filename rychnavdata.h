#ifndef RYCHNAVDATA_H
#define RYCHNAVDATA_H

#include <QObject>
#include <QString>
#include <QDebug>
#include <QQuickItem>
#include <QQmlContext>
#include <QStringList>

class rychnavdata : public QObject
{
    Q_OBJECT
public:
    explicit rychnavdata(QObject *parent = nullptr);

signals:
public slots:
    void xdata(QString sxnazev, QString sxbarva, QString sxhindct,QString sxblikr,QString sxblik1, QString sxblik2, QString sxdolindc, QString sxlinka1, QString sxlinka2, QString sxvyznam);
    QString nazev();
    QString barva();
    QString hindct();
    QString blikr();
    QString blik1();
    QString blik2();
    QString dolindc();
    QString linka1();
    QString linka2();
    QString vyznam();
};

#endif // RYCHNAVDATA_H
