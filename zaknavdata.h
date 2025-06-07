
#ifndef ZAKNAVDATA_H
#define ZAKNAVDATA_H

#include <QObject>
#include <QString>
#include <QDebug>
#include <QQuickItem>
#include <QQmlContext>
#include <QStringList>
class zaknavdata : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(QString text READ text WRITE nazev NOTIFY valueChanged)
    //QString m_text;
public:
    explicit zaknavdata(QObject *parent = nullptr);
    using QObject::QObject;
    QString text() const{
        //return m_text;
    }
    /*Q_INVOKABLE QStringList splitString(const QString &input, const QString &delimiter) {
        return input.split(delimiter);*/

signals:
    void vypsatdata(QString yxnazev, QString yxpopis);
public slots:
    void nazev(QString sxnazev, QString sxpopis);
    void barva(QString sxbarva, QString sxblikt, QString sxblikb);
    QString xnazev();
    QString xpopis();
    QString xbarva();
    QString xblikt();
    QString xblikb();

};

#endif // ZAKNAVDATA_H
