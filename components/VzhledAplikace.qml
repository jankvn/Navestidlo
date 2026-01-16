import QtQuick
import App 1.0

QtObject{
    signal themeChanged()
    property bool lightTheme: true
   //#000000
    property color bg: "#FFFFFF"
    property color textc: "#212121"
    property color menubg: "#f5f5f5"
    property color cntxtmn: "#e6e6e6"
    property color menuheadline: "#424242"
    property color headbg: "#d4d4d4"
    property color buttonbg: "#ffffff"
    property color buttonhover: "#dddddd"
    property color errsel: "#e8e8e8"
    property url home: ""
    property url set: ""
    property url zaklnavic: "qrc:/images/zaklnavic.png"
    property url rychsoustaic: "qrc:/images/rychsoustaic.png"
    property url oznpicn: "qrc:/images/oznpicn.png"
    property url neprnavic: "qrc:/images/neprnavic.png"
    property url logo: "qrc:/images/logo.png"
    property url menu: "qrc:/images/menu-light.png"
    property url repbug: "qrc:/images/repabug-light.png"
/*    function theme() {
        if (xsettings.theme() === "tmavy") {
            lightTheme = false
            bg = "#1A1A1A"
            textc = "#ededed"
            menubg = "#242424"
            cntxtmn = "#535353"
            menuheadline = "#cccbca"
            headbg = "#474747"
            buttonbg = "#000"
            buttonhover = "#6b6b6b"
            home = "qrc:/images/home-dark.png"
            set = "qrc:/images/settings-dark.png"
            menu = "qrc:/images/menu-dark.png"
            repbug = "qrc:/images/repabug-dark.png"
        } else {
            lightTheme = true
            bg = "#FFFFFF"
            textc = "#212121"
            menubg = "#f5f5f5"
            cntxtmn = "#e6e6e6"
            menuheadline = "#424242"
            headbg = "#d4d4d4"
            buttonbg = "#ffffff"
            buttonhover = "#dddddd"
            home = "qrc:/images/home-light.png"
            set = "qrc:/images/settings-light.png"
            menu = "qrc:/images/menu-light.png"
            repbug = "qrc:/images/repabug-light.png"
        }
        themeChanged() // ← vyvolání signálu
    }*/
   /* if (xsettings.vytahninastaveni() == "tmavy")
        {
            bg = "#1A1A1A"
            textc = "#ededed"
            menubg = "#242424"
            menuheadline = "#cccbca"
            headbg = "#474747"
            buttonbg = "#000"
            buttonhover = "#6b6b6b"
        }
    }*/

    // někde ve vzhledAplikace.qml
    property bool followSystem: true

    function theme() {
        var mode = xsettings.theme()

        if (followSystem && mode === "dleSystemu") {
            // bere se přímo ze SystemTheme
            if (SystemTheme.dark) {
                applyDark()
            } else {
                applyLight()
            }
        } else if (mode === "tmavy") {
            applyDark()
        } else {
            applyLight()
        }
        themeChanged()
    }

    function applyDark() {
        lightTheme = false
        bg = "#1A1A1A"
        textc = "#ededed"
        menubg = "#242424"
        cntxtmn = "#535353"
        menuheadline = "#cccbca"
        headbg = "#474747"
        errsel = "#262626"
        buttonbg = "#000"
        buttonhover = "#6b6b6b"
        home = "qrc:/images/home-dark.png"
        set = "qrc:/images/settings-dark.png"
        menu = "qrc:/images/menu-dark.png"
        repbug = "qrc:/images/repabug-dark.png"
    }

    function applyLight() {
        lightTheme = true
        bg = "#FFFFFF"
        textc = "#212121"
        menubg = "#f5f5f5"
        cntxtmn = "#e6e6e6"
        menuheadline = "#424242"
        headbg = "#d4d4d4"
        errsel = "#e8e8e8"
        buttonbg = "#ffffff"
        buttonhover = "#dddddd"
        home = "qrc:/images/home-light.png"
        set = "qrc:/images/settings-light.png"
        menu = "qrc:/images/menu-light.png"
        repbug = "qrc:/images/repabug-light.png"
    }


}
