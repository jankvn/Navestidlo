#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QObject>
#include <QSettings>
#include <QList>
#include <iostream>
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
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    zaknavdata znd;
    rychnavdata rnd;
    splitstr splitstrc;
    settings set;
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(QCoreApplication::applicationDirPath().append("/ostatni.db"));
    if (!db.open()) {
        qFatal("Failed to connect to database.");
    }

    // Setup model
    SqlModel model;
    model.setQueryString("SELECT id, nazev, ico FROM navestinepr");




    QQmlApplicationEngine engine;
    /*QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(QCoreApplication::applicationDirPath().append("/ostatni.db"));
    db.open();*/
    //QSqlQueryModel *model = new SqlQueryModel();
    //QSqlQueryModel *model = new SqlQueryModel(this);
    //model->setQuery("SELECT id, nazev, ico FROM navestinepr");
    /*if (!db.open()) {
        qDebug() << "Failed to open database!";
    } else {
        qDebug() << "OK!";
       //model->setQuery("SELECT id, nazev, ico FROM navestinepr");
        for (int i = 0; i < model->rowCount(); ++i) {
            int id = model->record(i).value("id").toInt();
            QString name = model->record(i).value("nazev").toString();
            QString ico = model->record(i).value("ico").toString();
            qDebug() << "id:" << id << ", name:" << name << "ico:" << ico;
        }
    }
    while (model->canFetchMore()) {
        model->fetchMore();
    }*/

    //model->setQuery("SELECT id, nazev, ico FROM navestinepr");

    //QSqlQueryModel *oznpx = new oznp();
    //oznpx->setQuery("SELECT someRoleName, otherRoleName FROM some_table");
    engine.rootContext()->setContextProperty("sqlModel", &model);
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
    engine.load(QUrl(QStringLiteral("qrc:/Main.qml")));
    qmlRegisterType<ComboBoxHandler>("ComboBoxHandler", 1, 0, "ComboBoxHandler");

    return app.exec();
}
