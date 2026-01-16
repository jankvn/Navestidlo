#ifndef COMBOBOXHANDLER_H
#define COMBOBOXHANDLER_H

#include <QObject>
#include <QDebug>
#include <stdio.h>
#include "sqlite3.h"
class ComboBoxHandler : public QObject
{
    Q_OBJECT
public:
    explicit ComboBoxHandler(QObject *parent = nullptr);

signals:
public slots:
    void onItemChanged(int newValue);
    void vybratrychnav(int a, int b);
};

#endif // COMBOBOXHANDLER_H
