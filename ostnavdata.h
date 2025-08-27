#ifndef OSTNAVDATA_H
#define OSTNAVDATA_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>
#include <QCoreApplication>
#include <QVariant>

// ostnavdata.h
class ostnavdata : public QObject {
    Q_OBJECT
public:
    explicit ostnavdata(QObject *parent = nullptr);
    Q_INVOKABLE void vypisdata(const QString &id);   // 🔹 tady chybělo

    Q_INVOKABLE QString xnazev();
    Q_INVOKABLE QString xnavestidlo();
    Q_INVOKABLE QString xvzhled();
    Q_INVOKABLE QString xpopis();
    Q_INVOKABLE QVariantList xpopisModel();   // 🔹 nový getter
    Q_INVOKABLE QString xico();
    Q_INVOKABLE QString xden();
    Q_INVOKABLE QString xnoc();
    Q_INVOKABLE QString xvyh();
    Q_INVOKABLE QString xvyhplan();
    Q_INVOKABLE QString xsamovratnav();
    Q_INVOKABLE QString xblik();
private:
    QString nazev;
    QString navestidlo;
    QString vzhled;
    QString popis;
    QString ico;
    QString den;
    QString noc;
    QString vyh;
    QString vyhplan;
    QString samovratnav;
    QString blikx;
};
#endif // OSTNAVDATA_H
