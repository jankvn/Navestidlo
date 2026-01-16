// androidbridge.h
#pragma once
#include <QObject>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QObject>
#include <QSettings>
#include <QList>
#include <QSqlDatabase>
#include <QSqlRecord>
#include <stdio.h>
#include "sqlite3.h"
#include <QQuickItem>
#include <QIcon>
#include <QQmlApplicationEngine>
//#include <QAndroidJniObject>
//#include <QtAndroid>
#include <QStandardPaths>
#include <QFile>
#include <QDir>
#include <QDebug>
#ifdef Q_OS_ANDROID
#include <QJniObject>

//#include <QNativeInterface>


class AndroidBridge : public QObject {
    Q_OBJECT
public:
    explicit AndroidBridge(QObject *parent = nullptr);

    Q_INVOKABLE void setStatusBarLightIcons(bool lightIcons);
};
#else
class DummyBridge : public QObject {
    Q_OBJECT
public:
    Q_INVOKABLE void setStatusBarLightIcons(bool) {
        // nedělá nic na desktopu
    }
};
#endif
