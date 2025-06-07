#include "settings.h"

settings::settings(QObject *parent)
    : QObject{parent}
{}

void settings::nastaveni(QString rezim)
{
    QSettings ysettings("Johan5140", "Navestidlo");
    ysettings.setValue("vzhled", rezim);
}

void settings::vytahninastaveni()
{
    QSettings ysettings("Johan5140", "Navestidlo");
    QString theme = ysettings.value("vzhled", "").toString();
    qDebug() << "SET:" << theme;
    /*if (settings.contains("theme")) {
        QString theme = settings.value("vzhled", "").toString();
        nastaveni = theme;
        qDebug() << "SET:" << theme;
    }*/
}
