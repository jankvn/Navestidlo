#ifndef SPLITSTR_H
#define SPLITSTR_H

#include <QObject>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QStringList>

class splitstr : public QObject
{
    Q_OBJECT
public:
    explicit splitstr(QObject *parent = nullptr);
    Q_INVOKABLE QStringList splitString(const QString &input, const QString &delimiter) {
        return input.split(delimiter);
    }

signals:
};

#endif // SPLITSTR_H
