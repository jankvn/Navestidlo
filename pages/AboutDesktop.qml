import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Item {
    anchors.fill: parent
    property string pageName: "O aplikaci"
    ListModel { id: aboutapplist }
    ListModel { id: srcs }
    Component.onCompleted:
    {
        xdbinfo.vypisdata()
        aboutapplist.append({ headline: "Autor", text: "jankvn (https://github.com/jankvn)", icon: vzhledAplikace.home, page: "https://github.com/jankvn" })
        aboutapplist.append({ headline: "Verze aplikace", text: Qt.application.version + " (sestaveno: " + BuildDate +")", icon: vzhledAplikace.zaklnavic, page: "https://navestidlo.kavjan.cz/?stranka=chyby" })
        aboutapplist.append({ headline: "Verze databáze", text: xdbinfo.xlu(), icon: vzhledAplikace.zaklnavic, page: "https://navestidlo.kavjan.cz/?stranka=chyby" })
        aboutapplist.append({ headline: "Stránka aplikace na GitHub:", text: "https://github.com/jankvn/Navestidlo", icon: vzhledAplikace.rychsoustaic, page: "https://github.com/jankvn/Navestidlo" })
        aboutapplist.append({ headline: "Webová verze:", text: "https://navestidlo.kavjan.cz/", icon: vzhledAplikace.oznpicn, page: "https://navestidlo.kavjan.cz/" })

        srcs.append({ headline: "Informace o návěstech:", text: "SŽ D1 (Správa železenic, s. o.)", icon: vzhledAplikace.oznpicn, page: "https://provoz.spravazeleznic.cz/Portal/ViewDirective.aspx?oid=2255429" })
        srcs.append({ headline: "Založeno na frameworku Qt", text: "https://www.qt.io/", icon: vzhledAplikace.oznpicn, page: "https://www.qt.io/" })
    }
    Rectangle {
Layout.fillWidth: true
Layout.fillHeight: true
    GridLayout {
        id: grid
        anchors.fill: parent
        columns: 1
        rowSpacing: 0
        columnSpacing: 0
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

    RowLayout {
        anchors.fill: parent
        spacing: 10

        // Text vycentrovaný mezi oba "rozpěrky"
        Text {
            id: text1
            text: qsTr("O aplikaci")
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
            Text {
                id: text10
                text: qsTr("Základní informace:")
                font.pixelSize: 18
                font.bold: true
                color: vzhledAplikace.textc
                Layout.leftMargin: 20   // odsazení zleva jen u tohoto Textu
                Layout.topMargin: 15    // odsazení shora jen u tohoto Textu
            }
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
                        model: aboutapplist.count
                        delegate: Rectangle {
                            width: parent.width
                            height: 70
                            color: "transparent"   // ← tady změna!
                            //color: "transparent"
                            radius: 10
                            property bool isHovered: false

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: parent.isHovered = true
                                onExited: parent.isHovered = false
                                onClicked: Qt.openUrlExternally(aboutapplist.get(index).page)
                                cursorShape: Qt.PointingHandCursor
                            }

                            RoundedBackground {
                                anchors.fill: parent
                                topRounded: index === 0
                                bottomRounded: index === (aboutapplist.count - 1)
                                fillColor: parent.isHovered ? vzhledAplikace.buttonhover : "transparent"
                            }

                            Row {
                                anchors.fill: parent
                                anchors.margins: 12
                                spacing: 8

                                Column {
                                    spacing: 4
                                    width: parent.width - 40   // nech místo na šipku
                                    Text {
                                        text: aboutapplist.get(index).headline
                                        font.pixelSize: 16
                                        font.bold: true
                                        color: vzhledAplikace.textc
                                        wrapMode: Text.WordWrap
                                    }
                                    Text {
                                        text: aboutapplist.get(index).text
                                        font.pixelSize: 13
                                        color: vzhledAplikace.textc
                                        wrapMode: Text.WordWrap
                                    }
                                }

                                // šipka na pravé straně
                                Canvas {
                                    id: arrowCanvas
                                    width: 15
                                    height: 15
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 12

                                    onPaint: {
                                        var ctx = getContext("2d")
                                        ctx.clearRect(0, 0, width, height)
                                        ctx.fillStyle = vzhledAplikace.textc
                                        ctx.beginPath()
                                        // šipka doprava ">"
                                        ctx.moveTo(4, 2)
                                        ctx.lineTo(11, 7.5)
                                        ctx.lineTo(4, 13)
                                        ctx.closePath()
                                        ctx.fill()
                                    }
                                }

                            }
                        }}
                    }

                }
            Text {
                text: qsTr("Zdroje:")
                font.pixelSize: 18
                font.bold: true
                color: vzhledAplikace.textc
                Layout.leftMargin: 20   // odsazení zleva jen u tohoto Textu
                Layout.topMargin: 15    // odsazení shora jen u tohoto Textu
            }
            Item {
                    Layout.preferredHeight: 15
                }

            /////////////////////////////////////////////////////////////////////

            Rectangle {
                implicitHeight: columnLayout2.implicitHeight
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 25
                color: vzhledAplikace.menubg
                radius: 10
                border.color: vzhledAplikace.headbg
                border.width: 1

                Column {
                id: columnLayout2
                    //anchors.fill: parent
                    width: parent.width
                    spacing: 1

            /*    ColumnLayout {
                    id: columnLayout2
                    anchors.fill: parent
                    spacing: 1 */

                    Repeater {
                        model: srcs.count
                        delegate: Rectangle {
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
                                onClicked: Qt.openUrlExternally(srcs.get(index).page)
                                cursorShape: Qt.PointingHandCursor
                            }

                            RoundedBackground {
                                anchors.fill: parent
                                topRounded: index === 0
                                bottomRounded: index === (srcs.count - 1)
                                fillColor: parent.isHovered ? vzhledAplikace.buttonhover : "transparent"
                            }

                            Row {
                                anchors.fill: parent
                                anchors.margins: 12
                                spacing: 8

                                Column {
                                    spacing: 4
                                    width: parent.width - 40   // nech místo na šipku
                                    Text {
                                        text: srcs.get(index).headline
                                        font.pixelSize: 16
                                        font.bold: true
                                        color: vzhledAplikace.textc
                                        wrapMode: Text.WordWrap
                                    }
                                    Text {
                                        text: srcs.get(index).text
                                        font.pixelSize: 13
                                        color: vzhledAplikace.textc
                                        wrapMode: Text.WordWrap
                                    }
                                }

                                // šipka na pravé straně
                                Canvas {
                                    id: arrowCanvasx
                                    width: 15
                                    height: 15
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 12

                                    onPaint: {
                                        var ctx = getContext("2d")
                                        ctx.clearRect(0, 0, width, height)
                                        ctx.fillStyle = vzhledAplikace.textc
                                        ctx.beginPath()
                                        // šipka doprava ">"
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
/*            Text {
                text: qsTr("Zdroje:")
                font.pixelSize: 18
                font.bold: true
                color: vzhledAplikace.textc
                Layout.leftMargin: 20   // odsazení zleva jen u tohoto Textu
                Layout.topMargin: 15    // odsazení shora jen u tohoto Textu
            } */

                }

            }


}}}}//}}
