import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: root
    //anchors.fill: parent
    Layout.fillWidth: true
    Layout.fillHeight: true
    property string pageName: "Označovací pásy"
    background: Rectangle {
        opacity: enabled ? 1 : 0.3
        color: "#ffffff"
    }
    GridLayout {
        anchors.fill: parent
        Layout.fillWidth: true
        Layout.fillHeight: true
        columns: 1
        rowSpacing: 0
        columnSpacing: 0
    Rectangle {
        id: xsrectangle
        x: 0
        y: 0
        Layout.fillWidth: true
        height: 60
        color: vzhledAplikace.headbg
        width: parent.width

        RowLayout {
            anchors.fill: parent
            spacing: 10

            Button {
                id: backbtn
                Layout.preferredWidth: 60
                Layout.preferredHeight: 60
                MouseArea {
                    anchors.fill: parent
                    onClicked: stackView.push("teorie.qml")
                    hoverEnabled: true
                    cursorShape: Qt.OpenHandCursor
                }
                background: Rectangle {
                    anchors.fill: parent
                    color: backbtn.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.headbg
                    radius: 2
                }
                Text {
                    text: "<"
                    color: vzhledAplikace.textc
                    font.pixelSize: 30
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            // Text vycentrovaný mezi oba "rozpěrky"
            Text {
                id: text1
                text: qsTr("Označovací pásy a štítky návěstidel")
                font.pixelSize: 18
                color: vzhledAplikace.textc
                Layout.alignment: Qt.AlignCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            // prázdný Item na vyvážení šířky backbtn
            Item {
                Layout.preferredWidth: backbtn.width
                Layout.preferredHeight: 1
            }
        }
        }
    Rectangle{
        y:40
        anchors.top: xsrectangle.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        color: vzhledAplikace.bg
        anchors.topMargin: appWindow.safeArea ? appWindow.safeArea.topMargin : 0
        anchors.bottomMargin: appWindow.isMobile && bottomNav.visible
            ? 0   // safeArea už je zahrnuto v bottomNav
            : (appWindow.safeArea ? appWindow.safeArea.bottomMargin : 0)
        Button
        {
            id: ttp
            width: 50
            height: 60
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 15
            anchors.rightMargin: 15
            visible: lv.contentY > 50
            z: 1000
            contentItem: Item {
                Row {
                    Text {
                        text: "^"
                        anchors.verticalCenter: parent.verticalCenter
                        color: vzhledAplikace.textc
                        topPadding: 0
                        leftPadding: -5
                        font.pixelSize: 28
                    }
                }
            }
            MouseArea {
                   width: 40
                   height: 40
                   hoverEnabled: true
                   cursorShape: Qt.OpenHandCursor
                   onClicked: lv.contentY = 0
               }
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                border.color: ttp.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.headbg
                border.width: 1
                color: ttp.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.headbg
                radius: 2
            }

        }
        ListView {
            id: lv
            anchors.fill: parent
            model: xoznp
            spacing: 10
            clip: true

            delegate: Rectangle {
                width: parent.width
                color: index % 2 === 0 ? vzhledAplikace.bg : vzhledAplikace.headbg // šedá pro sudé, jinak výchozí
                implicitHeight: Math.max(rowLayout.implicitHeight + 20, 150) // +20 pro padding

                Row {
                    id: rowLayout
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 10

                    Rectangle {
                        width: 150
                        height: 120
                        color: "transparent"
                        Image {
                            anchors.centerIn: parent
                            width: 120
                            height: 120
                            source: "qrc:/images/oznpasy/" + model.ico + ".png"
                        }
                    }

                    Column {
                        width: parent.width - 170
                        spacing: 5

                        Text {
                            text: model.nazev
                            wrapMode: Text.WordWrap
                            color: vzhledAplikace.textc
                            width: parent.width
                        }
                    }
                }
            }
        }


            }



    }
/*    Text {
        y: 50
        text: qsTr("Na této funkci se pracuje!")
        font.pixelSize: 18
        width: root.width
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: vzhledAplikace.textc
    }*/

}
//}//}//}
