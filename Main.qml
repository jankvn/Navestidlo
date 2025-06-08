import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.settings 1.0
import "."

Window {
    id: main
    minimumWidth: 1024
    minimumHeight: 768
    visible: true
    title: "Návěstidlo na QT/QML"
    Component.onCompleted:
    {
    xsettings.vytahninastaveni()
    //switchtheme()
    vzhledAplikace.theme()
    }
    Settings {
            id: userSettings
            property string theme: "light"
            property int volume: 50
        }
    /*function switchtheme() {
        if (xsettings.theme() == "tmavy")
        {
            vzhledAplikace.tmavy()
            console.log("xxx")
        }
        else{
            vzhledAplikace.svetly()
            console.log("yyy")
        }
        console.log(xsettings.theme())
    }*/
    VzhledAplikace
    {
        id: vzhledAplikace
    }
    GridLayout {
        id: rectangle
        anchors.fill: parent
        columnSpacing: 0

            GridView {
                id: gridView1
                x: 0
                y: 0
                width: 200
                Layout.fillHeight: true
                //highlightFollowsCurrentItem: true
                //flickDeceleration: 1500
                //flickableDirection: Flickable.VerticalFlick
                //interactive: true
                //transformOrigin: Item.TopLeft
                    Rectangle {
                        id: rectangle1
                        color: vzhledAplikace.menubg
                        anchors.fill: parent
                        Text {
                            id: text1
                            x: 45
                            y: 15
                            color: vzhledAplikace.textc
                            text: qsTr("Návěstidlo")
                            font.pixelSize: 18
                        }

                        Text {
                            id: text2
                            x: 15
                            y: 60
                            color: vzhledAplikace.menuheadline
                            text: qsTr("Hlavní nabídka")
                            font.pixelSize: 13
                            font.bold: true
                        }
                        Text {
                            id: text3
                            x: 15
                            //y: 1020
                            color: vzhledAplikace.menuheadline
                            text: qsTr("Nástroje")
                            font.pixelSize: 13
                            font.bold: true
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 55
                        }

                        Image {
                            id: image
                            x: 10
                            y: 10
                            width: 35
                            height: 35
                            source: "qrc:/images/logo.png"
                            fillMode: Image.PreserveAspectFit
                        }
                        Button {
                            id: button
                            x: 5
                            y: 85
                            width: 190
                            height: 30
                            visible: true
                            display: AbstractButton.TextBesideIcon
                            leftPadding: 8
                            topPadding: 0
                            highlighted: false
                            checkable: false
                            flat: true
                            MouseArea {
                                   width: 190
                                   height: 30
                                   hoverEnabled: true
                                   cursorShape: Qt.OpenHandCursor
                                   onClicked: stackView.push("mainp.qml")
                               }
                            contentItem: Item {
                                Row {
                                    Image {
                                        id: domubtnicon
                                        source: vzhledAplikace.home
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: 18
                                        height: 18
                                    }
                                    Text {
                                        text: "Domů"
                                        anchors.verticalCenter: parent.verticalCenter
                                        color: vzhledAplikace.textc
                                        padding: 5
                                        font.pixelSize: 15
                                    }
                                }
                            }
                            background: Rectangle {
                                implicitWidth: 100
                                implicitHeight: 40
                                opacity: enabled ? 1 : 0.3
                                border.color: button.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.menubg
                                border.width: 1
                                color: button.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.menubg
                                radius: 2
                            }
                        }

                        Button {
                            id: button1
                            x: 5
                            y: 120
                            width: 190
                            visible: true
                            display: AbstractButton.TextBesideIcon
                            height: 30
                            leftPadding: 8
                            topPadding: 0
                            flat: true
                            contentItem: Item {
                                Row {
                                    Image {
                                        id: zaknavbtnicon
                                        source: "qrc:/images/zaklnavic.png"
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: 18
                                        height: 18
                                    }
                                    Text {
                                        text: "Základní návěsti"
                                        anchors.verticalCenter: parent.verticalCenter
                                        color: vzhledAplikace.textc
                                        padding: 5
                                        font.pixelSize: 15
                                    }
                                }
                            }
                            MouseArea {
                                   width: 190
                                   height: 30
                                   hoverEnabled: true
                                   cursorShape: Qt.OpenHandCursor
                                   onClicked: stackView.push("zaknav.qml")
                               }
                            background: Rectangle {
                                implicitWidth: 100
                                implicitHeight: 40
                                opacity: enabled ? 1 : 0.3
                                border.color: button1.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.menubg
                                border.width: 1
                                color: button1.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.menubg
                                radius: 2
                            }
                        }

                        Button {
                            id: button2
                            x: 5
                            y: 155
                            width: 190
                            height: 30
                            flat: true
                            leftPadding: 8
                            topPadding: 0
                            contentItem: Item {
                                Row {
                                    Image {
                                        id: rychnavbtnicon
                                        source: "qrc:/images/rychsoustaic.png"
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: 18
                                        height: 18
                                    }
                                    Text {
                                        text: "Rychlostní soustava"
                                        anchors.verticalCenter: parent.verticalCenter
                                        color: vzhledAplikace.textc
                                        padding: 5
                                        font.pixelSize: 15
                                    }
                                }
                            }
                            MouseArea {
                                   width: 190
                                   height: 30
                                   hoverEnabled: true
                                   cursorShape: Qt.OpenHandCursor
                                   onClicked: stackView.push("rychs.qml")
                               }
                            background: Rectangle {
                                implicitWidth: 100
                                implicitHeight: 40
                                opacity: enabled ? 1 : 0.3
                                border.color: button2.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.menubg
                                border.width: 1
                                color: button2.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.menubg
                                radius: 2
                            }
                        }

                        Button {
                            id: button3
                            x: 5
                            y: 190
                            width: 190
                            height: 30
                            flat: true
                            leftPadding: 8
                            topPadding: 0
                            contentItem: Item {
                                Row {
                                    Image {
                                        id: oznnavbtnicon
                                        source: "qrc:/images/oznpicn.png"
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: 18
                                        height: 18
                                    }
                                    Text {
                                        text: "Označovací pásy"
                                        anchors.verticalCenter: parent.verticalCenter
                                        color: vzhledAplikace.textc
                                        padding: 5
                                        font.pixelSize: 15
                                    }
                                }
                            }
                            MouseArea {
                                   width: 190
                                   height: 30
                                   hoverEnabled: true
                                   cursorShape: Qt.OpenHandCursor
                                   onClicked: stackView.push("oznp.qml")
                               }
                            background: Rectangle {
                                implicitWidth: 100
                                implicitHeight: 40
                                opacity: enabled ? 1 : 0.3
                                border.color: button3.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.menubg
                                border.width: 1
                                color: button3.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.menubg
                                radius: 2
                            }
                        }

                        Button {
                            id: button4
                            x: 5
                            y: 225
                            width: 190
                            leftPadding: 8
                            topPadding: 0
                            height: 30
                            flat: true
                            contentItem: Item {
                                Row {
                                    Image {
                                        id: ostnavbtnicon
                                        source: "qrc:/images/neprnavic.png"
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: 18
                                        height: 18
                                    }
                                    Text {
                                        text: "Ostatní návěsti"
                                        anchors.verticalCenter: parent.verticalCenter
                                        color: vzhledAplikace.textc
                                        padding: 5
                                        font.pixelSize: 15
                                    }
                                }
                            }
                            MouseArea {
                                   width: 190
                                   height: 30
                                   hoverEnabled: true
                                   cursorShape: Qt.OpenHandCursor
                                   onClicked: stackView.push("ostnav.qml")
                               }
                            background: Rectangle {
                                implicitWidth: 100
                                implicitHeight: 40
                                opacity: enabled ? 1 : 0.3
                                border.color: button4.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.menubg
                                border.width: 1
                                color: button4.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.menubg
                                radius: 2
                            }
                        }
                        Button {
                            id: button5
                            x: 5
                            width: 190
                            leftPadding: 8
                            topPadding: 0
                            height: 30
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 15
                            flat: true
                            contentItem: Item {
                                Row {
                                    Image {
                                        id: nastnavbtnicon
                                        source: vzhledAplikace.set
                                        anchors.verticalCenter: parent.verticalCenter
                                        width: 18
                                        height: 18
                                    }
                                    Text {
                                        text: "O aplikaci"
                                        anchors.verticalCenter: parent.verticalCenter
                                        padding: 5
                                        color: vzhledAplikace.textc
                                        font.pixelSize: 15
                                    }
                                }
                            }
                            MouseArea {
                                   width: 190
                                   height: 30
                                   hoverEnabled: true
                                   cursorShape: Qt.OpenHandCursor
                                   onClicked: stackView.push("aboutapp.qml")
                               }
                            background: Rectangle {
                                implicitWidth: 100
                                implicitHeight: 40
                                opacity: enabled ? 1 : 0.3
                                border.color: button5.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.menubg
                                border.width: 1
                                color: button5.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.menubg
                                radius: 2
                            }
                }
}
}
            Rectangle{
                id: content
                Layout.fillWidth: true
                Layout.fillHeight: true
                x: 250
                y: 0
                StackView {
                    id: stackView
                    x: 0
                    y: 0
                    initialItem: "mainp.qml"
                    //anchors.fill: parent
                    width: content.width
                    height: content.height
                    pushEnter: Transition {}
                    pushExit: Transition {}
                    popEnter: Transition {}
                    popExit: Transition {}
                    replaceEnter: Transition {}
                    replaceExit: Transition {}
                }
            }
    }
    /*Connections {
        target: xsettings.nastaveni()
        onValueChanged: {
            console.log("Theme changed to:", vzhledAplikace.theme);
            switchtheme()
        }
    }*/
}
