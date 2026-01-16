#ifndef OSTNAVDATA_H
#define OSTNAVDATA_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>
#include <QCoreApplication>
#include <QStandardPaths>
#include <QFile>
#include <QDir>
#include <QDebug>

class ostnavdata : public QObject
{
    Q_OBJECT
public:
    explicit ostnavdata(QObject *parent = nullptr);

signals:
public slots:
    void vypisdata(QString id);
    QString xnazev();
    QString xnavestidlo();
    QString xvzhled();
    QString xpopis();
    QString xico();
    QString xden();
    QString xnoc();
    QString xvyh();
    QString xvyhplan();
    QString xsamovratnav();
    QString xblik();
};

#endif // OSTNAVDATA_H
