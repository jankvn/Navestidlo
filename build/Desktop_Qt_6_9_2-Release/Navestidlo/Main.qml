import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import Qt.labs.settings 1.0
import "."
import AndroidBridge 1.0
import App 1.0
import "components"

ApplicationWindow {
    id: appWindow
    visible: true
    width: 1024
    height: 900
    title: "Návěstidlo"
    flags: Qt.Window | Qt.MaximizeUsingFullscreenGeometryHint

    property bool isMobile: width < 1000
    property int currentIndex: 0
    background: Rectangle {
        color: vzhledAplikace.menubg
    }

    ListModel { id: menuModel }
    ListModel { id: ostatnilist }
    ListModel { id: mobilemenuModel }

    Component.onCompleted: {
        xsettings.vytahninastaveni()
        vzhledAplikace.theme()

        menuModel.append({ text: "Domů", icon: "home", page: "mainp" })
        menuModel.append({ text: "Základní návěsti", icon: "zaklnavic", page: "zaknav" })
        menuModel.append({ text: "Rychlostní soustava", icon: "rychsoustaic", page: "rychs" })
        menuModel.append({ text: "Označovací pásy", icon: "oznpicn", page: "oznp" })
        menuModel.append({ text: "Ostatní návěsti", icon: "neprnavic", page: "ostnav" })
        menuModel.append({ text: "O aplikaci", icon: "set", page: "aboutapp" })

        ostatnilist.append({ text: "Nastavení", icon: vzhledAplikace.set, page: "nastaveni" })
        ostatnilist.append({ text: "O aplikaci", icon: vzhledAplikace.set, page: "aboutapp" })
        ostatnilist.append({ text: "Nahlásit chybu", icon: vzhledAplikace.repbug, page: "nahlasitchybu" })



        mobilemenuModel.append({ text: "Domů", icon: "home", page: "mainp" })
        mobilemenuModel.append({ text: "Teorie", icon: "zaklnavic", page: "teorie" })
        mobilemenuModel.append({ text: "Testy", icon: "rychsoustaic", page: "testy" })
        mobilemenuModel.append({ text: "Ostatní",icon: "menu", page: "ostatni" })
        hidebug()


        Qt.callLater(() => {
            if (Qt.platform.os === "android") {
                AndroidBridge.setStatusBarLightIcons(vzhledAplikace.lightTheme)
            }
        })
    }
    function hidebug()
    {
        if (stackView.currentItem.pageName === "Nahlásit chybu")
        {
            repbugbtn.visible = false
        }
    }

    VzhledAplikace { id: vzhledAplikace }
    FontLoader { id: localFont; source: "qrc:/NotoSansSymbols2-Regular.ttf" }
    RoundedBackground { id:rdbg }

    // --- Safe area overlay ---
        Rectangle {
            anchors.fill: parent
            color: vzhledAplikace.menubg
            z: -100
        }

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: appWindow.safeArea ? appWindow.safeArea.topMargin : 0
            color: vzhledAplikace.menubg
            z: 50
        }

 /*       Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: appWindow.safeArea ? appWindow.safeArea.bottomMargin : 0
            color: vzhledAplikace.menubg
            z: 50
        }*/

        Rectangle {
            id: topBar
            height: 50 + (appWindow.safeArea ? appWindow.safeArea.topMargin : 0)
            width: parent.width
            color: vzhledAplikace.menubg
            z: 100
            anchors.top: parent.top
            anchors.topMargin: appWindow.safeArea ? appWindow.safeArea.topMargin : 0

            // logo + text vlevo
            Row {
                id: logoRow
                spacing: 5

                // Vertikální zarovnání
                anchors.verticalCenter: parent.verticalCenter

                // Levé zarovnání s respektem na safeArea
                anchors.left: parent.left
                anchors.leftMargin: (appWindow.safeArea && appWindow.safeArea.leftMargin > 0)
                                     ? appWindow.safeArea.leftMargin + 10
                                     : 10

                Image {
                    source: "qrc:/images/logo.png"
                    width: 30
                    height: 30
                    fillMode: Image.PreserveAspectFit
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    text: "Návěstidlo"
                    font.bold: true
                    font.pixelSize: 16
                    color: vzhledAplikace.textc
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            // tlačítko vpravo
            Button {
                id: repbugbtn
                width: 30
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: (appWindow.safeArea && appWindow.safeArea.rightMargin > 0)
                                     ? appWindow.safeArea.rightMargin
                                     : 10

                Image {
                    source: vzhledAplikace.repbug
                    width: 30
                    height: 30
                    fillMode: Image.PreserveAspectFit
                    anchors.verticalCenter: parent.verticalCenter
                }

                background: Rectangle {
                    anchors.fill: parent
                    color: repbugbtn.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.menubg
                    radius: 2
                }

                MouseArea {
                    anchors.fill: repbugbtn
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                            // posíláme aktuální stránku jako argument
                            //console.log(stackView.currentItem.pageName)
                            stackView.push("qrc:/pages/nahlasitchybu.qml", { fromPage: stackView.currentItem.pageName, fromPagepath: stackView.currentItem.pageNamepath })
                        }
                }
            }
        }





    // --- Hlavní obsah ---
    Rectangle {
        id: content
        anchors.top: topBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: isMobile ? bottomNav.top : parent.bottom
        color: vzhledAplikace.bg

        RowLayout {
            anchors.fill: parent
            spacing: 0

            // Postranní panel pro desktop
            Rectangle {
                width: appWindow.isMobile ? 0 : 200
                visible: !appWindow.isMobile
                color: vzhledAplikace.menubg
                Layout.fillHeight: true

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 8
                    spacing: 0
                    Item {
                            Layout.preferredHeight: 15
                        }

                    Text {
                        id: name
                        text: qsTr("Hlavní nabídka")
                        leftPadding: 5
                        font.pixelSize: 14
                        font.bold: true
                        color: vzhledAplikace.textc
                    }
                    Item {
                            Layout.preferredHeight: 5
                        }

                    Repeater {
                        model: menuModel.count - 1
                        delegate: Button {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 50
                            flat: true
                            leftPadding: 8
                            topPadding: 7
                            contentItem: Row {
                                spacing: 5
                                Image {  source: vzhledAplikace[menuModel.get(index).icon]; width: 18; height: 18; anchors.verticalCenter: parent.verticalCenter }
                                Text { text: menuModel.get(index).text; anchors.verticalCenter: parent.verticalCenter; color: vzhledAplikace.textc; font.pixelSize: 14 }
                            }
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.OpenHandCursor
                                onClicked:  stackView.push("pages/"+ menuModel.get(index).page + ".qml")
                            }
                            background: Rectangle {
                                anchors.fill: parent
                                border.width: 1
                                border.color: hovered ? vzhledAplikace.buttonhover : vzhledAplikace.menubg
                                color: hovered ? vzhledAplikace.buttonhover : vzhledAplikace.menubg
                                radius: 10
                            }
                        }
                    }

                    Item { Layout.fillHeight: true }

                    Text {
                        id: namex
                        text: qsTr("Ostatní")
                        leftPadding: 5
                        font.pixelSize: 14
                        color: vzhledAplikace.textc
                        font.bold: true
                    }
                    Item {
                            Layout.preferredHeight: 5
                        }
                    Repeater {
                        model: ostatnilist.count
                        delegate: Button {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 50
                            flat: true
                            leftPadding: 8
                            topPadding: 7
                            contentItem: Row {
                                spacing: 5
                                Image {  source: ostatnilist.get(index).icon; width: 18; height: 18; anchors.verticalCenter: parent.verticalCenter }
                                Text { text: ostatnilist.get(index).text; anchors.verticalCenter: parent.verticalCenter; color: vzhledAplikace.textc; font.pixelSize: 15 }
                            }
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.OpenHandCursor
                                onClicked:  stackView.push("pages/"+ ostatnilist.get(index).page + ".qml")
                            }
                            background: Rectangle {
                                anchors.fill: parent
                                border.width: 1
                                border.color: hovered ? vzhledAplikace.buttonhover : vzhledAplikace.menubg
                                color: hovered ? vzhledAplikace.buttonhover : vzhledAplikace.menubg
                                radius: 10
                            }
                        }
                    }
                }
            }

            StackView {
                id: stackView
                Layout.fillWidth: true
                Layout.fillHeight: true
                initialItem: "pages/mainp.qml"
                pushEnter: Transition {}
                pushExit: Transition {}
                popEnter: Transition {}
                popExit: Transition {}
                replaceEnter: Transition {}
                replaceExit: Transition {}
                onCurrentItemChanged: {
                        if (stackView.currentItem.pageName === "Nahlásit chybu") {
                            repbugbtn.visible = false
                        } else {
                            repbugbtn.visible = true
                        }
                    }
            }
        }
    }

    RowLayout {
        id: bottomNav
        width: parent.width
        visible: isMobile
            height: 65
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: appWindow.safeArea ? appWindow.safeArea.bottomMargin : 0
            spacing: 0

        Repeater {
            model: mobilemenuModel
            delegate: Rectangle {
                Layout.fillWidth: true
                        Layout.fillHeight: true
                height: parent.height
                implicitHeight: 80
                color: appWindow.currentIndex === index
                       ? vzhledAplikace.buttonhover
                       : vzhledAplikace.menubg

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        stackView.replace("pages/"+ mobilemenuModel.get(index).page + ".qml")
                        appWindow.currentIndex = index
                    }
                }

Item {
                    anchors.fill: parent
                    Column {
                        anchors.centerIn: parent
                        spacing: 6
                        Image { source: vzhledAplikace[model.icon]; width: 18; height: 18; fillMode: Image.PreserveAspectFit; anchors.horizontalCenter: parent.horizontalCenter }
                        Text { text: model.text; font.pixelSize: 13; color: vzhledAplikace.textc; horizontalAlignment: Text.AlignHCenter }
                    }
                }

            }
        }
    }
    onWidthChanged: {
        console.log("Nová šířka okna:", width)
        // breakpoint pro desktop
        if (width >= 1000) {
            // pokud je aktuální stránka mobilní, přepnout na hlavní
            const mobilePages = ["Teorie", "Ostatní"];
            if (mobilePages.includes(stackView.currentItem.pageName)) {
                stackView.replace("pages/mainp.qml");
            }
        }
    }


    // --- Connections ---
    Connections {
        target: appWindow
        function onWidthChanged() {
            appWindow.isMobile = appWindow.width < 1000
        }
    }
    Connections {
        target: vzhledAplikace
        function onThemeChanged() {
            if (Qt.platform.os === "android") {
                androidBridge = Qt.createQmlObject(
                    'import AndroidBridge 1.0; AndroidBridge {}',
                    appWindow
                )
                AndroidBridge.setStatusBarLightIcons(vzhledAplikace.lightTheme)
            }
        }
    }
    Connections {
        target: SystemTheme
        onThemeChanged: {
            if (xsettings.theme() === "dleSystemu") {
                vzhledAplikace.theme()
            }
        }
    }
}
