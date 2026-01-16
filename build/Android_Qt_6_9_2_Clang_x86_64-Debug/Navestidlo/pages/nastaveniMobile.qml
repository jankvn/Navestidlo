import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Page {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true
    property string pageName: "Nastavení"
    background: Rectangle {
        color: vzhledAplikace.bg
    }
    function zjistivzhled()
    {
        if(xsettings.theme() === "tmavy"){
            xx.currentText = "Tmavý"
        }
        if (xsettings.theme() === "svetly") {
           xx.currentText = "Světlý (výchozí)"
        }
        if (xsettings.theme() === "dleSystemu") {
            xx.currentText = "Dle systému"
        }
    }
    Component.onCompleted:
    {
        zjistivzhled()
    }
    // Horní hlavička
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
                    onClicked: stackView.push("ostatni.qml")
                    hoverEnabled: true
                    cursorShape: Qt.OpenHandCursor
                }
                background: Rectangle {
                    anchors.fill: parent
                    color: backbtn.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.headbg
                    radius: 2
                }
                Canvas {
                    id: arrowCanvas
                    anchors.centerIn: parent
                    width: 25
                    height: 25

                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.clearRect(0, 0, width, height)
                        ctx.fillStyle = vzhledAplikace.textc

                        ctx.beginPath()
                        ctx.moveTo(width * 0.7, height * 0.15)   // pravý horní
                        ctx.lineTo(width * 0.3, height * 0.5)    // levý střed
                        ctx.lineTo(width * 0.7, height * 0.85)   // pravý dolní
                        ctx.closePath()
                        ctx.fill()
                    }
                }
            }

            // Text vycentrovaný mezi oba "rozpěrky"
            Text {
                id: text1
                text: qsTr("Nastavení")
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

    ColumnLayout {
        width: parent.width
        y:60
        //width: root.width
        spacing: 0
        Item {
                Layout.preferredHeight: 15
            }
        Rectangle {
            id: xx
            implicitHeight: mainColumn.implicitHeight
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 25
            color: vzhledAplikace.menubg
            radius: 10
            border.color: vzhledAplikace.headbg
            border.width: 1

            property bool menuOpen: false
            property string currentText: ""

            Column {
                id: mainColumn
                anchors.fill: parent
                spacing: 1

                // hlavní tlačítko
                Rectangle {
                    width: parent.width
                    height: 70
                    color: "transparent"
                    radius: 10
                    property bool isHovered: false
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: parent.isHovered = true
                        onExited: parent.isHovered = false
                        onClicked: xx.menuOpen = !xx.menuOpen
                        cursorShape: Qt.PointingHandCursor
                    }
                    RoundedBackground {
                        anchors.fill: parent
                        topRounded: true
                        bottomRounded: false
                        fillColor: parent.isHovered ? vzhledAplikace.buttonhover : "transparent"
                    }
                    Row {
                        anchors.fill: parent
                        anchors.margins: 12
                        spacing: 8
                        Column {
                            spacing: 4
                            width: parent.width - 40   // nech místo na šipku
                            Text { text: "Režim aplikace:"; font.pixelSize: 16; font.bold: true; color: vzhledAplikace.textc }
                            Text { text: xx.currentText; font.pixelSize: 13; color: vzhledAplikace.textc }
                            }
                            // šipka na pravé straně
                        // šipka napravo
                        Canvas {
                            id: arrowCanvasa
                            width: 15
                            height: 15
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            anchors.rightMargin: 12

                            property bool down: !xx.menuOpen  // dolů = true, nahoru = false

                            onPaint: {
                                var ctx = getContext("2d")
                                ctx.clearRect(0, 0, width, height)
                                ctx.fillStyle = vzhledAplikace.textc
                                ctx.beginPath()
                                if (down) {
                                    // šipka dolů ⌄
                                    ctx.moveTo(3, 5)
                                    ctx.lineTo(7.5, 11)
                                    ctx.lineTo(12, 5)
                                } else {
                                    // šipka nahoru ⌃
                                    ctx.moveTo(3, 10)
                                    ctx.lineTo(7.5, 4)
                                    ctx.lineTo(12, 10)
                                }
                                ctx.closePath()
                                ctx.fill()
                            }

                            Connections {
                                target: xx
                                onMenuOpenChanged: arrowCanvasa.requestPaint()
                            }
                        }


                        }
                    }

                // menu položky
                Column {
                    id: menuColumn
                    anchors.left: parent.left
                    anchors.right: parent.right
                    visible: xx.menuOpen
                    spacing: 1

                    Repeater {
                        model: [
                            { text: "Dle systému", key: "dleSystemu" },
                            { text: "Světlý (výchozí)", key: "svetly" },
                            { text: "Tmavý", key: "tmavy" }
                        ]

                        delegate: Rectangle {
                            width: parent.width
                            height: 40

                            // property pro hover efekt
                            property bool hovered: false

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: parent.hovered = true
                                onExited: parent.hovered = false
                                onClicked: {
                                    xx.currentText = modelData.text
                                    xsettings.nastaveni(modelData.key)
                                    xsettings.vytahninastaveni()
                                    vzhledAplikace.theme()
                                    xx.menuOpen = false
                                }
                                cursorShape: Qt.PointingHandCursor
                                z: 2
                            }

                            Column {
                                anchors.fill: parent
                                anchors.topMargin: 12
                                anchors.leftMargin: 25   // padding
                                z: 1
                                Text {
                                    text: modelData.text
                                    font.pixelSize: 13
                                    color: vzhledAplikace.textc
                                }
                            }

                            RoundedBackground {
                                anchors.fill: parent
                                topRounded: false
                                bottomRounded: false   // poslední položka zaoblena dole
                                fillColor: parent.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.cntxtmn
                                 z: 0
                            }
                        }
                    }
                }
            }
        }

    }


}
