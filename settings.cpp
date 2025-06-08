#include "settings.h"
QString thm = "";
settings::settings(QObject *parent)
    : QObject{parent}
{}
QSettings ysettings("Johan5140", "Navestidlo");
void settings::nastaveni(QString rezim)
{
    ysettings.setValue("vzhled", rezim);
}

void settings::vytahninastaveni()
{
    QString xtheme = ysettings.value("vzhled", "svetly").toString();
    qDebug() << "SET:" << xtheme;
    /*if (settings.contains("theme")) {
        QString theme = settings.value("vzhled", "").toString();
        nastaveni = theme;
        qDebug() << "SET:" << theme;
    }*/
    thm = xtheme;

}
QString settings::theme()
{
    return thm;
}
