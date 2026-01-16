import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: root
    anchors.fill: parent
    /*Layout.fillWidth: true
    Layout.fillHeight: true*/
    property string pageName: "Ostatní"
    background: Rectangle {
        opacity: enabled ? 1 : 0.3
        color: "#ffffff"
    }
     ListModel { id: ostatnilist }
    Component.onCompleted:
    {
        ostatnilist.append({ nazev: "Nastavení", icon: vzhledAplikace.set, page: "nastaveni" })
        ostatnilist.append({ nazev: "O aplikaci", icon: vzhledAplikace.set, page: "aboutapp" })
        ostatnilist.append({ nazev: "Nahlásit chybu", icon: vzhledAplikace.repbug, page: "nahlasitchybu" })

    }
    GridLayout {
        anchors.fill: parent
        Layout.fillWidth: true
        Layout.fillHeight: true
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

        Text {
            id: text1
            text: qsTr("Ostatní")
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
                            model: ostatnilist.count
                            delegate: Rectangle {
                                width: parent.width
                                height: 70
                                radius: 10
                                color: "transparent"   // ← tady změna!
                                property bool isHovered: false

                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: parent.isHovered = true
                                    onExited: parent.isHovered = false
                                    onClicked: stackView.push(ostatnilist.get(index).page + ".qml")
                                    cursorShape: Qt.PointingHandCursor
                                }

                                RoundedBackground {
                                    anchors.fill: parent
                                    topRounded: index === 0
                                    bottomRounded: index === (ostatnilist.count - 1)
                                    fillColor: parent.isHovered ? vzhledAplikace.buttonhover : "transparent"   // ← tady změna!
                                }

                                RowLayout {
                                    anchors.fill: parent
                                    anchors.margins: 12
                                    spacing: 10

                                    // ikona nalevo
                                    Image {
                                        source: ostatnilist.get(index).icon
                                        sourceSize.width: 16
                                        sourceSize.height: 16
                                        fillMode: Image.PreserveAspectFit
                                        Layout.alignment: Qt.AlignVCenter
                                    }

                                    // text uprostřed (zabere zbytek šířky)
                                    Text {
                                        text: ostatnilist.get(index).nazev
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

}}}
