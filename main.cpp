#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QObject>
#include <QSettings>
#include <QList>
#include "ostnavdata.h"
#include <QSqlDatabase>
#include "zaknavdata.h"
#include "rychnavdata.h"
#include <QSqlRecord>
#include "comboboxhandler.h"
#include "splitstr.h"
#include "settings.h"
#include <stdio.h>
#include "sqlite3.h"
#include "sqlmodel.h"
#include <QQuickItem>
#include <QIcon>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QVariantList>
#include <QString>
#include "ostnavdata.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    zaknavdata znd;
    rychnavdata rnd;
    splitstr splitstrc;
    settings set;
    ostnavdata ond;
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(QCoreApplication::applicationDirPath().append("/main.db"));
    if (!db.open()) {
        qFatal("Failed to connect to database.");
    }

    // Setup model
    SqlModel ostnav;
    SqlModel oznp;
    ostnav.setQueryString("SELECT id, nazev, ico FROM navestinepr");
    oznp.setQueryString("SELECT id, nazev, ico FROM oznp");




    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("xostnav", &ostnav);
    engine.rootContext()->setContextProperty("ond", &ond);
    engine.rootContext()->setContextProperty("xoznp", &oznp);
    engine.rootContext()->setContextProperty("znd", &znd);
    engine.rootContext()->setContextProperty("rnd", &rnd);
    engine.rootContext()->setContextProperty("stringProcessor", &splitstrc);
    engine.rootContext()->setContextProperty("xsettings", &set);
    //engine.rootContext()->setContextProperty("data", oznpx);

    app.setWindowIcon(QIcon(":/images/logo.png"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    QString osVersion = QSysInfo::prettyProductName(); // např. "Windows 10 (10.0)"
    engine.rootContext()->setContextProperty("osVersion", osVersion);
    engine.load(QUrl(QStringLiteral("qrc:/Main.qml")));
    qmlRegisterType<ComboBoxHandler>("ComboBoxHandler", 1, 0, "ComboBoxHandler");

    return app.exec();
}
