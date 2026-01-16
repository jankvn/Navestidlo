#ifndef DBINFO_H
#define DBINFO_H

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

class dbinfo: public QObject
{
    Q_OBJECT
public:
    explicit dbinfo(QObject *parent = nullptr);
signals:
public slots:
    void vypisdata();
    QString xlu();
};

#endif // DBINFO_H
