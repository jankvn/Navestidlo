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
#include "sqlite3.h"
#include "sqlmodel.h"
#include <QQuickItem>
#include <QIcon>
#include <QQmlApplicationEngine>
#include "dbinfo.h"
//#include <QAndroidJniObject>
//#include <QtAndroid>
#include <QStandardPaths>
#include <QFile>
#include <QDir>
#include <QDebug>
#include "androidbridge.h"
#include "version.h"
#include <QStyleHints>
#include <QProcess>
#include <QFile>
#include <QSettings>
#include "systemtheme.h"
//#include <QNativeInterface>
bool copyDatabaseAlways(const QString &fileName, const QString &resourcePath) {
    QString dataPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QDir().mkpath(dataPath);

    QString targetPath = dataPath + "/" + fileName;

    // Pokud existuje, smaž
    if (QFile::exists(targetPath)) {
        if (!QFile::remove(targetPath)) {
            qWarning() << "Failed to remove old database:" << targetPath;
            return false;
        }
        qDebug() << "Old database removed:" << targetPath;
    }

    // Zkopíruj novou z resource
    QFile assetDB(resourcePath);
    if (!assetDB.exists()) {
        qWarning() << "Resource database not found:" << resourcePath;
        return false;
    }
    if (!assetDB.copy(targetPath)) {
        qWarning() << "Failed to copy database from" << resourcePath << "to" << targetPath;
        return false;
    }

    QFile targetDB(targetPath);
    targetDB.setPermissions(QFileDevice::ReadUser | QFileDevice::WriteUser);
    qDebug() << "Database replaced with new copy:" << targetPath;

    return true;
}
void setStatusBarLightIcons(bool lightIcons)
{
#ifdef Q_OS_ANDROID
    QJniObject activity = QNativeInterface::QAndroidApplication::context();
    QJniObject window = activity.callObjectMethod("getWindow", "()Landroid/view/Window;");
    window.callMethod<void>("addFlags", "(I)V", 0x80000000); // FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS

    // Nastav barvu statusbaru (volitelně)
    jint color = lightIcons ? 0xFFEEEEEE : 0xFF000000;
    window.callMethod<void>("setStatusBarColor", "(I)V", color);

    QJniObject decorView = window.callObjectMethod("getDecorView", "()Landroid/view/View;");
    QJniObject insetsController = decorView.callObjectMethod("getWindowInsetsController", "()Landroid/view/WindowInsetsController;");

    const jint APPEARANCE_LIGHT_STATUS_BARS = 0x08;
    if (insetsController.isValid()) {
        if (lightIcons) {
            insetsController.callMethod<void>("setSystemBarsAppearance", "(II)V",
                                              APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        } else {
            insetsController.callMethod<void>("setSystemBarsAppearance", "(II)V",
                                              0, APPEARANCE_LIGHT_STATUS_BARS);
        }
    } else {
        // Fallback pro starší Android
        jint flags = decorView.callMethod<jint>("getSystemUiVisibility");
        const jint LIGHT_STATUS_BAR = 0x00002000;
        if (lightIcons)
            flags |= LIGHT_STATUS_BAR;
        else
            flags &= ~LIGHT_STATUS_BAR;

        decorView.callMethod<void>("setSystemUiVisibility", "(I)V", flags);
    }
#endif
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qDebug() << "=== App started ===";

    // Databáze – zkopíruj, pokud chybí
    if (!copyDatabaseAlways("main.db", ":/db/main.db"))
        return -1;
    // Připojení k SQLite
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    QString dbPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/main.db";
    app.setApplicationName("Návěstidlo");
    app.setApplicationVersion(APP_VERSION_STRING); // <── verze přímo z CMake
    db.setDatabaseName(dbPath);

    if (!db.open()) {
        qCritical() << "DB open error:" << db.lastError().text() << "path:" << dbPath;
        return -1;
    }

    // Setup model
    zaknavdata znd;
    rychnavdata rnd;
    splitstr splitstrc;
    settings set;
    ostnavdata ond;
    SqlModel ostnav;
    SqlModel oznp;
    dbinfo dbinfo;
#ifdef Q_OS_ANDROID
    AndroidBridge androidBridge;
    qmlRegisterSingletonInstance("AndroidBridge", 1, 0, "AndroidBridge", &androidBridge);
#else
    DummyBridge dummyBridge;
    qmlRegisterSingletonInstance("AndroidBridge", 1, 0, "AndroidBridge", &dummyBridge);
#endif
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
    engine.rootContext()->setContextProperty("xdbinfo", &dbinfo);
#ifdef Q_OS_WIN
    // Windows: použij png nebo ico soubor
    app.setWindowIcon(QIcon(":/images/logo.png"));
#elif defined(Q_OS_MAC)
    // macOS: použij icns soubor
    app.setWindowIcon(QIcon(":/AppIcon.icns"));
#else
    // jiná platforma: můžeš použít default
    app.setWindowIcon(QIcon(":/images/logo.png"));
#endif
    SystemTheme systemTheme;

    qDebug() << "Aktuální schéma:" << (systemTheme.isDark() ? "Dark" : "Light");
    QObject::connect(qApp->styleHints(), &QStyleHints::colorSchemeChanged,
                     [](Qt::ColorScheme scheme){
                         qDebug() << "Změna schématu:" << (scheme == Qt::ColorScheme::Dark ? "Dark" : "Light");
                     });
    qmlRegisterSingletonType<SystemTheme>("App", 1, 0, "SystemTheme",
                                          [](QQmlEngine *, QJSEngine *) -> QObject* {
                                              return new SystemTheme();
                                          });
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    QString osVersion = QSysInfo::prettyProductName(); // např. "Windows 10 (10.0)"
    engine.rootContext()->setContextProperty("osVersion", osVersion);
    engine.rootContext()->setContextProperty("BuildDate", QStringLiteral(BUILD_DATE));
    engine.load(QUrl(QStringLiteral("qrc:/Main.qml")));
    qDebug() << "QML offline storage path:" << engine.offlineStoragePath();

    qmlRegisterType<ComboBoxHandler>("ComboBoxHandler", 1, 0, "ComboBoxHandler");

    return app.exec();
}
