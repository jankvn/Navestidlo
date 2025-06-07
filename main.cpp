#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QObject>
#include <QSettings>
#include <QList>
#include <iostream>

#include "zaknavdata.h"
#include "rychnavdata.h"
#include "comboboxhandler.h"
#include "splitstr.h"
#include "settings.h"
#include <stdio.h>
#include "sqlite3.h"
#include <QQuickItem>
#include <QIcon>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    zaknavdata znd;
    rychnavdata rnd;
    splitstr splitstrc;
    settings set;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("znd", &znd);
    engine.rootContext()->setContextProperty("rnd", &rnd);
    engine.rootContext()->setContextProperty("stringProcessor", &splitstrc);
    engine.rootContext()->setContextProperty("xsettings", &set);
    app.setWindowIcon(QIcon(":/images/logo.png"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(QUrl(QStringLiteral("qrc:/Main.qml")));
    qmlRegisterType<ComboBoxHandler>("ComboBoxHandler", 1, 0, "ComboBoxHandler");

    return app.exec();
}
