pragma ComponentBehavior: Bound
pragma Singleton
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Basic
import ComboBoxHandler
import QtQml
import QtQuick 2.0

Page {
    id: root
    anchors.fill: parent
    Layout.fillWidth: true
    Layout.fillHeight: true
    property string nid: ""
    property string pageName: "Informace o návěsti: " + nid + " (Mobilní)"
    Component.onCompleted: { ostnavd()
    console.log("xsamovratnav() vrací:", ond.xsamovratnav(), "typ:", typeof ond.xsamovratnav())
    }
    function ostnavd() {
        ond.vypisdata(nid)
        text7.text = ond.xnazev()
        text8.text = ond.xnavestidlo()
        text9.text = ond.xpopis()
        var ico = ond.xico()
        if (ond.xden() !== "null" && ond.xnoc() !== "null") {
            xico1.source = "qrc:/images/navesti/"+ond.xden()+".png"
            xico2.source = "qrc:/images/navesti/"+ond.xnoc()+".png"
            dennadpis.visible = true
            nocnadpis.visible = true
            xico1.visible = true
            xico2.visible = true
            //xico2.Layout.height = 150
            xico2.Layout.preferredHeight = 150
        }
        if (ond.xvyh() === "y") {
            xico1.source = "qrc:/images/vyhybky/"+ond.xico()+".png"
            xico2.source = "qrc:/images/vyhplan/"+ond.xvyhplan()+".png"
            xico2.visible = true
            //xico1.Layout.preferredHeight = 100
            xico1.height = 120
            //xico2.Layout.preferredHeight = 100
            xico2.height = 120
            //xico2.Layout.height = 150
        }
        if (ond.xsamovratnav() === "y") {
            xico1.visible = false
            xico2.visible = false
            samovratcont.visible = true
            samovrat.blikej(ond.xblik())
            if (nid == "24") samovrat2.visible = true
            xico2.Layout.preferredHeight = 0
            navcont.visible = true
            console.log("ss")
        }
        else if (ond.xden() === "null" && ond.xnoc() === "null" && ond.xvyh() === "n") {
            xico1.source = "qrc:/images/navesti/"+ico+".png"
            xico1.visible = true
            xico2.active = false
            xico2.Layout.preferredHeight = 0
            xico2.height = 0
        }

    }

    ComboBoxHandler { id: handler }

    Rectangle {
        color: vzhledAplikace.bg
        anchors.fill: parent

            // HEADER
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
                    onClicked: stackView.push("ostnav.qml")

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
                    text: qsTr("Popis návěsti")
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

            // OBSAH
            ScrollView {
            id: scroller
            anchors.fill: parent
            anchors.topMargin: 70   // odsazení pod ComboBox
            spacing: 10
            clip: true
            contentWidth: availableWidth

                    // LEVÁ ČÁST (obrázky)
                    Column {
                        width: scroller.availableWidth   // správná šířka
                        Layout.alignment: Qt.AlignTop
                        spacing: 10
                        Layout.columnSpan: 1   // každý sloupec zabírá 1 buňku

                        Text {
                            id: dennadpis
                            visible: false
                            width: parent.width
                            text: qsTr("Denní návěst:")
                            color: vzhledAplikace.textc
                            font.pixelSize: 15
                            Layout.fillWidth: true
                            horizontalAlignment: Text.AlignHCenter
                        }

                        Image {
                            id: xico1
                            Layout.fillWidth: true
                            width: parent.width
                            Layout.preferredHeight: 150
                            fillMode: Image.PreserveAspectFit
                        }

                        Text {
                            id: nocnadpis
                            visible: false
                            width: parent.width
                            text: qsTr("Noční návěst:")
                            color: vzhledAplikace.textc
                            font.pixelSize: 15
                            Layout.fillWidth: true
                            horizontalAlignment: Text.AlignHCenter
                        }

                        Image {
                            id: xico2
                            visible: false
                            //Layout.fillWidth: true
                            width: parent.width
                            //height: 150
                            fillMode: Image.PreserveAspectFit
                        }

                    Item {
                        id: navcont
                        width: parent.width
                        height: 160
                        visible: false

                        RowLayout {
                            id: samovratcont
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            spacing: 10
                            visible: false
                            height: 160

                            Rectangle {
                                id: samovrat
                                width: 70
                                height: 150
                                color: "#303030"
                                border.color: "#7d7d7d"
                                border.width: 3
                                radius: 10
                                property var idMap: ({ s1: nx1, s2: nx2 })

                                function findItemById(id) { return idMap[id]; }

                                function blikej(barva) {
                                    var item = findItemById(barva)
                                    if (item) item.visible = true
                                    seq.xx.targets = [item]
                                    seq.xx.property = "opacity"
                                    seq.xx.value = 0
                                    seq.xy.duration = 900
                                    seq.yx.targets = [item]
                                    seq.yx.property = "opacity"
                                    seq.yx.value = 1
                                    seq.yy.duration = 70
                                    seq.start()
                                }

                                Rectangle {
                                    y:10; x:3
                                    width: 64; height: 130
                                    color: "#303030"
                                    border.color: "#FFFF00"
                                    border.width: 5

                                    Rectangle {
                                        id: nx1
                                        width: 40; height: 40
                                        x: 12; y: 15
                                        radius: 45
                                        color: "#ff0000"
                                        visible: false
                                    }
                                    Rectangle {
                                        id: nx2
                                        width: 40; height: 40
                                        x: 12; y: 75
                                        radius: 45
                                        color: "#ffffff"
                                        visible: false
                                    }
                                }
                            }

                        Rectangle {
                            id: samovrat2
                            visible: false
                            width: 70
                            height: 150
                            color: "#303030"
                            border.color: "#7d7d7d"
                            border.width: 3
                            radius: 10
                            Rectangle {
                                y:10; x:3
                                width: 64; height: 130
                                color: "#303030"
                                border.color: "#FFFF00"
                                border.width: 5
                            }
                        }
                        }
                }

                        Text {
                            text: qsTr("Název návěsti:")
                            font.pixelSize: 15
                            font.bold: true
                            Layout.fillWidth: true
                            width: parent.width - 20
                            color: vzhledAplikace.textc
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            height: text7.implicitHeight + 10
                            color: vzhledAplikace.headbg
                            width: parent.width - 20
                            anchors.horizontalCenter: parent.horizontalCenter
                            Text {
                                id: text7
                                text: "---------"
                                wrapMode: Text.Wrap
                                anchors.fill: parent
                                anchors.margins: 5
                                color: vzhledAplikace.textc
                            }
                        }

                        Text {
                            text: qsTr("Návěstidlo:")
                            font.pixelSize: 15
                            font.bold: true
                            width: parent.width - 20
                            color: vzhledAplikace.textc
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            height: text8.implicitHeight + 10
                            width: parent.width - 20
                            anchors.horizontalCenter: parent.horizontalCenter
                            color: vzhledAplikace.headbg
                            Text {
                                id: text8
                                text: "---------"
                                wrapMode: Text.Wrap
                                anchors.fill: parent
                                anchors.margins: 5
                                color: vzhledAplikace.textc
                            }
                        }

                        Text {
                            text: qsTr("Význam návěsti:")
                            font.pixelSize: 15
                            //width: parent.width
                            font.bold: true
                            width: parent.width - 20
                            color: vzhledAplikace.textc
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            height: text9.implicitHeight + 10
                            color: vzhledAplikace.headbg
                            width: parent.width - 20
                            anchors.horizontalCenter: parent.horizontalCenter
                            Text {
                                id: text9
                                text: "---------"
                                wrapMode: Text.Wrap
                                anchors.fill: parent
                                anchors.margins: 5
                                color: vzhledAplikace.textc
                            }
                        }
                    }
                }

                SequentialAnimation {
                    id: seq
                    loops: Animation.Infinite
                    property alias xx: xx1
                    property alias xy: xy1
                    property alias yx: yx1
                    property alias yy: yy1
                    PropertyAction { id: xx1 }
                    PauseAnimation { id: xy1 }
                    PropertyAction { id: yx1 }
                    PauseAnimation { id: yy1 }
                }
            }
}
