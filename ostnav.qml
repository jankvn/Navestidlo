import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
//import "navest.qml" as navest

Page {
    id: root
    //anchors.fill: parent
    Layout.fillWidth: true
    Layout.fillHeight: true
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
        //width: 1000
        Layout.fillWidth: true
        height: 40
        color: vzhledAplikace.headbg
        width: root.width
        z: 100

        Text {
            id: text1
            y: 8
            text: qsTr("Ostatní návěsti")
            font.pixelSize: 18
            width: root.width
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: vzhledAplikace.textc
        }
    }
    Rectangle{
        y:40
        Layout.fillHeight: true
        width: root.width
        color: vzhledAplikace.bg
        Layout.fillWidth: true
        Button
        {
            id: ttp
            width: 40
            height: 40
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
                        padding: 5
                        color: vzhledAplikace.textc
                        topPadding: -2
                        leftPadding: 7
                        font.pixelSize: 30
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
            model: xostnav
            interactive: true
            cacheBuffer: 100

            WheelHandler {
                id: wheelHandler
                target: lv
                orientation: Qt.Vertical
                property real scrollStep: 100  // Větší = rychlejší scroll

                onWheel: (event) => {
                    let deltaY = event.angleDelta.y !== 0
                                 ? event.angleDelta.y
                                 : event.pixelDelta.y;

                    // Výpočet posunu (scrollStep = jak rychle)
                    let newY = lv.contentY - (deltaY / 120) * scrollStep;

                    // Omezení posunu na platný rozsah
                    lv.contentY = Math.max(0, Math.min(newY, lv.contentHeight - lv.height));

                    // Zamezíme předání eventu dál
                    event.accepted = true;
                }
            }
                //displayMarginEnd: 40
                    delegate: Item {
                        width: parent.width
                        Layout.fillWidth: true
                        height: 150
                        /*Row {
                            Text { text: model.id + ": " + model.nazev }
                        }*/
                        Rectangle {
                            id: navbtn
                            property bool hovered: false

                            width: parent.width
                            height: 150
                            Layout.fillWidth: true

                            color: hovered
                                ? vzhledAplikace.buttonhover
                                : (index % 2 === 0 ? vzhledAplikace.bg : vzhledAplikace.headbg)

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.OpenHandCursor

                                onEntered: navbtn.hovered = true
                                onExited: navbtn.hovered = false

                                onClicked: {
                                    stackView.push("navest.qml", { nid: model.id })
                                }
                            }
                        }

                                Column {
                                    id: column
                                    width: 170
                                    height: 150
                                    Image {
                                        x: 10
                                        width: 150
                                        height: 80
                                        source: "qrc:/images/navesti/"+model.ico+".png"
                                        anchors.centerIn: parent
                                    }
                                }
                                Column {
                                    id: column1
                                    x:170
                                    width: 150
                                    height: 150
                                    Text {
                                        x: 25
                                        width: 100
                                        height: 150
                                        text: model.nazev
                                        color: vzhledAplikace.textc
                                        //horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }}
                                Column {
                                    id: column2

                                    y: 0
                                    anchors.right: parent.right
                                    anchors.rightMargin: 15
                                    width: 150
                                    height: 150
                                    Text {
                                                anchors.centerIn: parent
                                                text: ">"
                                                font.pixelSize: 28
                                                color: vzhledAplikace.textc
                                                font.bold: true
                                            }


                                    }

                            }
                    }
            }
        NumberAnimation {
            id: ttpan
                                   target: lv
                                   property: "contentY"
                                   to: 0
                                   duration: 500
                               }



    }
}
