#include "settings.h"
#include <QDebug>

settings::settings(QObject *parent) : QObject(parent)
{
    // Zajistí, aby adresář existoval
    QString dataPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QDir().mkpath(dataPath);

    // Bezpečný QSettings soubor
    QString settingsFile = dataPath + "/settings.ini";
    settings_ = new QSettings(settingsFile, QSettings::IniFormat, this);

    // Načti výchozí theme
    thm_ = settings_->value("vzhled", "svetly").toString();
}

void settings::nastaveni(QString rezim)
{
    settings_->setValue("vzhled", rezim);
    settings_->sync();  // okamžitě uloží
    thm_ = rezim;
}

void settings::vytahninastaveni()
{
    thm_ = settings_->value("vzhled", "svetly").toString();
    qDebug() << "SET:" << thm_;
}

QString settings::theme() const
{
    return thm_;
}
