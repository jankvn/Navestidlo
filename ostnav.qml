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
            id:lv
                model: xostnav
                //anchors.fill: parent
                height: parent.height
                anchors.fill: parent
                Layout.fillWidth: true
                displayMarginBeginning: 40

                //displayMarginEnd: 40
                    spacing: 10
                    cacheBuffer: 100
                    delegate: Item {
                        width: parent.width
                        Layout.fillWidth: true
                        height: 150
                        /*Row {
                            Text { text: model.id + ": " + model.nazev }
                        }*/
                        Rectangle {
                            //: parent.width
                            width: parent.width
                            height: 150
                            Layout.fillWidth: true
                            color: vzhledAplikace.bg

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
}
