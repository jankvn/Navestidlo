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
        Layout.fillWidth: true
        height: 60
        color: vzhledAplikace.headbg
        width: parent.width

        RowLayout {
            anchors.fill: parent
            spacing: 10

            Button {
                id: backbtn
                Layout.preferredWidth: 50
                Layout.preferredHeight: 50
                flat: true
                onClicked: stackView.push("teorie.qml")

                contentItem: Text {
                    text: "<"
                    color: vzhledAplikace.textc
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            // Text vycentrovaný mezi oba "rozpěrky"
            Text {
                id: text1
                text: qsTr("Ostatní návěsti")
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
            model: xostnav
            spacing: 10
            clip: true
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
            delegate: Item {
                width: parent.width
                Layout.fillWidth: true
                height: 150
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


                                Column {
                                    id: column
                                    width: 170
                                    height: 150
                                    Image {
                                        x: 10
                                        width: 150
                                        height: 80
                                        source: "qrc:/images/navesti/"+model.ico+".png"
                                        anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter:  parent.verticalCenter
                                    }
                                }
                                Column {
                                    id: column1
                                    x:170
                                    width: 150
                                    Layout.fillWidth: true
                                    height: 150
                                    Text {
                                        x: 25
                                        width: parent.width - 5
                                        wrapMode: Text.Wrap
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
                                    anchors.rightMargin: 5
                                    width: 50
                                    height: 150
                                    Canvas {
                                        id: arrowCanvas
                                        width: 15
                                        height: 15
                                        Layout.alignment: Qt.AlignVCenter
                                        anchors.centerIn: parent

                                        onPaint: {
                                            var ctx = getContext("2d")
                                            ctx.clearRect(0, 0, width, height)
                                            ctx.fillStyle = vzhledAplikace.textc
                                            ctx.beginPath()
                                            ctx.moveTo(4, 2)
                                            ctx.lineTo(11, 7.5)
                                            ctx.lineTo(4, 13)
                                            ctx.closePath()
                                            ctx.fill()
                                        }
                                    }


                                    }
                             /*   Column {
                                    id: column2
                                    //x:150
                                    y: 50
                                    anchors.right: parent.right
                                    anchors.rightMargin: 15
                                    width: 150
                                    height: 100
                                    Button{
                                        id: navvic
                                        y: 50
                                        width: 100
                                        height: 50
                                        flat: true
                                        Text{
                                            text: qsTr("Popis")
                                            //color: vzhledAplikace.textc
                                            font.pixelSize: 13
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
                                            width: navvic.width
                                            height: navvic.height
                                            color: vzhledAplikace.textc
                                        }
                                        MouseArea {
                                               width: 100
                                               height: 50
                                               hoverEnabled: true
                                               cursorShape: Qt.OpenHandCursor
                                               onClicked:
                                            {
                                                   //stackView.push("navest.qml")
                                                   stackView.push("navest.qml", { nid: model.id })
                                                   //xnavest.ostnavd()
                                               }
                                           }
                                        background: Rectangle {
                                            implicitWidth: 100
                                            implicitHeight: 40
                                            opacity: enabled ? 1 : 0.3
                                            border.color: vzhledAplikace.textc
                                            border.width: 1
                                            color: navvic.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.menubg
                                        }
                                    }

                                    } */

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
}
