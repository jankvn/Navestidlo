#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QSettings>
#include <QStandardPaths>
#include <QDir>

class settings : public QObject
{
    Q_OBJECT
public:
    explicit settings(QObject *parent = nullptr);

    Q_INVOKABLE void nastaveni(QString rezim);
    Q_INVOKABLE void vytahninastaveni();
    Q_INVOKABLE QString theme() const;

private:
    QSettings *settings_;
    QString thm_;
};

#endif // SETTINGS_H
