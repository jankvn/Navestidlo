#pragma once

#include <QObject>
#include <QGuiApplication>
#include <QStyleHints>
#include <QFile>
#include <QDir>
#include <QSettings>

#ifdef Q_OS_LINUX
#include <QProcess>
#endif

class SystemTheme : public QObject {
    Q_OBJECT
    Q_PROPERTY(bool dark READ isDark NOTIFY themeChanged)

public:
    explicit SystemTheme(QObject *parent = nullptr) : QObject(parent) {
        connect(qApp->styleHints(), &QStyleHints::colorSchemeChanged,
                this, &SystemTheme::themeChanged);
    }

    bool isDark() const {
        if (qApp->styleHints()->colorScheme() == Qt::ColorScheme::Dark)
            return true;
        if (qApp->styleHints()->colorScheme() == Qt::ColorScheme::Light)
            return false;

#ifdef Q_OS_LINUX
        return isDarkThemeLinuxFallback();
#else
        return false; // iOS, macOS, Windows fallback: světlý
#endif
    }

signals:
    void themeChanged();

private:
#ifdef Q_OS_LINUX
   static bool isDarkThemeLinuxFallback() {
        // --- GNOME ---
        {
            QProcess proc;
            proc.start("gsettings", {"get", "org.gnome.desktop.interface", "color-scheme"});
            proc.waitForFinished(200);
            QString output = proc.readAllStandardOutput().trimmed();
            if (output.contains("dark", Qt::CaseInsensitive)) return true;
            if (output.contains("light", Qt::CaseInsensitive)) return false;
        }

        // --- KDE ---
        {
            QString kdeFile = QDir::homePath() + "/.config/kdeglobals";
            if (QFile::exists(kdeFile)) {
                QSettings kdeSettings(kdeFile, QSettings::IniFormat);
                kdeSettings.beginGroup("General");
                QString scheme = kdeSettings.value("ColorScheme").toString().toLower();
                kdeSettings.endGroup();

                if (scheme.contains("dark")) return true;
                if (scheme.contains("light") || scheme.contains("breeze")) return false;
            }
        }

        return false; // default světlý
    }
#endif
};
