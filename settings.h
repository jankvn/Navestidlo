#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QSettings>
#include <QString>

class settings : public QObject
{
    Q_OBJECT
public:
    explicit settings(QObject *parent = nullptr);

signals:
public slots:
    void vytahninastaveni();
    void nastaveni(QString rezim);
};

#endif // SETTINGS_H
