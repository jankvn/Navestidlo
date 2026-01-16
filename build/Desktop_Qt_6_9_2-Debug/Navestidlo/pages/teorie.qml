import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

//import "navest.qml" as navest

Page {
    id: root
    anchors.fill: parent
    Layout.fillWidth: true
    Layout.fillHeight: true
    property string pageName: "Teorie"
    property string pageNamepath: "teorie"
    background: Rectangle {
        opacity: enabled ? 1 : 0.3
        color: "#ffffff"
    }
     ListModel { id: teorielist }
    Component.onCompleted:
    {
        teorielist.append({ nazev: "Základní návěsti", icon: "zaklnavic", page: "zaknav" })
        teorielist.append({ nazev: "Rychlostní soustava", icon: "rychsoustaic", page: "rychs" })
        teorielist.append({ nazev: "Označovací pásy", icon: "oznpicn", page: "oznp" })
        teorielist.append({ nazev: "Ostatní návěsti", icon: "neprnavic", page: "ostnav" })

    }
        Rectangle {
           color: vzhledAplikace.bg
           height: root.height
    width:root.width
    Rectangle {
        id: xsrectangle
        x: 0
        y: 0
        Layout.fillWidth: true
        height: 60
        color: vzhledAplikace.headbg
        width: parent.width

        Text {
            id: text1
            text: qsTr("Teorie")
            font.pixelSize: 18
            width: root.width
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: vzhledAplikace.textc
            anchors.verticalCenter: parent.verticalCenter    // <-- centrum vertikálně
        }
    }
    ScrollView {
        id: scroller
        y: 60
        //Layout.preferredHeight: parent.height * 0.8
        contentWidth: -1
        anchors.top: xsrectangle.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        clip : true
            ColumnLayout {
                anchors.fill: parent
                //width: root.width
                spacing: 0
                Item {
                        Layout.preferredHeight: 15
                    }
                Rectangle {
                    implicitHeight: columnLayout.implicitHeight
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 25
                    color: vzhledAplikace.menubg
                    radius: 10
                    border.color: vzhledAplikace.headbg
                    border.width: 1

                    Column {
                        id: columnLayout
                        anchors.fill: parent
                        spacing: 1

                        Repeater {
                            model: teorielist.count
                            delegate: Rectangle {
                                width: parent.width
                                height: 70
                                color: "transparent"   // ← tady změna!
                                radius: 10
                                property bool isHovered: false

                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: parent.isHovered = true
                                    onExited: parent.isHovered = false
                                    onClicked: stackView.push(teorielist.get(index).page + ".qml")
                                    cursorShape: Qt.PointingHandCursor
                                }

                                RoundedBackground {
                                    anchors.fill: parent
                                    topRounded: index === 0
                                    bottomRounded: index === (teorielist.count - 1)
                                   fillColor: parent.isHovered ? vzhledAplikace.buttonhover : "transparent"
                                }

                                RowLayout {
                                    anchors.fill: parent
                                    anchors.margins: 12
                                    spacing: 10

                                    // ikona nalevo
                                    Image {
                                        source: vzhledAplikace[teorielist.get(index).icon];
                                        sourceSize.width: 16
                                        sourceSize.height: 16
                                        fillMode: Image.PreserveAspectFit
                                        Layout.alignment: Qt.AlignVCenter
                                    }

                                    // text uprostřed (zabere zbytek šířky)
                                    Text {
                                        text: teorielist.get(index).nazev
                                        font.pixelSize: 16
                                        color: vzhledAplikace.textc
                                        wrapMode: Text.WordWrap
                                        elide: Text.ElideRight
                                        Layout.fillWidth: true
                                        Layout.alignment: Qt.AlignVCenter
                                    }

                                    // šipka napravo
                                    Canvas {
                                        id: arrowCanvas
                                        width: 15
                                        height: 15
                                        Layout.alignment: Qt.AlignVCenter

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
                            }
                        }




                        }

                    }
                    }

                }

}}
