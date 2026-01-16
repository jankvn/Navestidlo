// androidbridge.cpp
#include "androidbridge.h"
#ifdef Q_OS_ANDROID
#include <QtCore/private/qnativeinterface_p.h>

AndroidBridge::AndroidBridge(QObject *parent) : QObject(parent) {}

void AndroidBridge::setStatusBarLightIcons(bool lightIcons)
{
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
}

#endif

