import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    anchors.fill: parent
    property string pageName: "O aplikaci (Desktop)"
    Component.onCompleted:
    {
        zjistivzhled()
    }
    function zjistivzhled()
    {
        if(xsettings.theme() == "tmavy")
        {
            control.currentIndex = 1
        }else {
            control.currentIndex = 0
        }
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
            text: qsTr("Nahlásit chybu")
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
        y: 60
        width: root.width
        //Layout.fillWidth: true

    RowLayout {
        anchors.fill: parent
        //width: root.width
        spacing: 0
        Rectangle {
            Layout.preferredWidth: parent.width / 2
            Layout.fillHeight: true
            Text {
                id: text10
                x: 10
                y: 10
                text: qsTr("Základní informace")
                font.pixelSize: 18
                font.bold: true
                color: vzhledAplikace.textc
            }
            Text {
                id: text2
                x: 20
                y: 45
                text: qsTr("Autor:")
                font.pixelSize: 15
                font.bold: true
                color: vzhledAplikace.textc
            }
            Text {
                id: text3
                x: 20
                y: 70
                text: qsTr("Verze:")
                font.pixelSize: 15
                font.bold: true
                color: vzhledAplikace.textc
            }
            Text {
                id: text4
                x: 20
                y: 95
                text: qsTr("Odkaz na Github:")
                font.pixelSize: 15
                font.bold: true
                color: vzhledAplikace.textc
            }
            Text {
                id: text5
                x: 20
                y: 120
                text: qsTr("Webová verze:")
                font.pixelSize: 15
                font.bold: true
                color: vzhledAplikace.textc
            }
            Text {
                x: 10
                y: 155
                text: qsTr("Zdroje")
                font.pixelSize: 18
                font.bold: true
                color: vzhledAplikace.textc
            }
            Text {
                x: 20
                y: 190
                text: qsTr("Informace o návěstech: (název, popis apod.)")
                font.pixelSize: 15
                font.bold: true
                color: vzhledAplikace.textc
            }
            Text {
                id: text12
                x: 10
                y: 220
                text: qsTr("Nastavení")
                font.pixelSize: 18
                font.bold: true
                color: vzhledAplikace.textc
            }
            Text {
                x: 20
                y: 255
                text: qsTr("Režim aplikace:")
                font.pixelSize: 15
                font.bold: true
                color: vzhledAplikace.textc
            }
        }
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Text {
                x: 10
                y: 45
                text: qsTr("jankvn")
                font.pixelSize: 15
                color: vzhledAplikace.textc
                font.underline: true
                MouseArea{
                    id: mouseHyperlinkArea0
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        Qt.openUrlExternally("https://github.com/jankvn");
                    }
                }
            }
            Text {
                id: text7
                x: 10
                y: 70
                text: qsTr("0.8.0 - OS: " + osVersion)
                font.pixelSize: 15
                color: vzhledAplikace.textc
            }
            Text {
                id: text8
                x: 10
                y: 95
                font.pixelSize: 15
                text: "Stránka aplikace na github.com"
                font.underline: true
                color: vzhledAplikace.textc
                MouseArea{
                    id: mouseHyperlinkArea00
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        Qt.openUrlExternally("https://github.com/jankvn/Navestidlo");
                    }
                }
            }
            Text {
                id: text9
                x: 10
                y: 120
                font.pixelSize: 15
                text: "Webová verze aplikace"
                color: vzhledAplikace.textc
                font.underline: true
                MouseArea{
                    id: mouseHyperlinkArea2
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        Qt.openUrlExternally("https://navestidlo.kavjan.cz/");
                    }
                }
            }
            Text {
                id: text11
                x: 10
                y: 190
                font.pixelSize: 15
                text: "SŽ D1 (Správa železenic, s. o. - platnost od 14. 12. 2025)"
                color: vzhledAplikace.textc
                font.underline: true
                MouseArea{
                    id: mouseHyperlinkArea3
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        // to do something on clicking the link
                        Qt.openUrlExternally("https://provoz.spravazeleznic.cz/Portal/ViewDirective.aspx?oid=2255429");
                    }
                }
            }
            ComboBox {
                id: control
                width: 300
                x: 10
                y: 250
                //anchors.horizontalCenter: parent.horizontalCenter
                model: zaklnavesti
                    ListModel{
                    id: zaklnavesti
                    ListElement { key: "Světlý (výchozí)"}
                    ListElement { key: "Tmavý"}
                }
                onActivated: {
                    if (control.currentIndex == 0){
                        xsettings.nastaveni("svetly")
                        xsettings.vytahninastaveni()
                        vzhledAplikace.theme()
                    }
                    else{
                        xsettings.nastaveni("tmavy")
                        xsettings.vytahninastaveni()
                        vzhledAplikace.theme()
                    }
                }
                delegate: ItemDelegate {
                    id: delegate
                    hoverEnabled: true
                    required property var model
                    required property int index
                    width: control.width
                    //width: control.width
                    contentItem: Text {
                        text: delegate.model[control.textRole]
                        color: vzhledAplikace.textc
                        font: control.font
                        elide: Text.ElideRight
                        verticalAlignment: Text.AlignVCenter
                    }
                    background: Rectangle {
                        color: highlighted ? vzhledAplikace.buttonhover : vzhledAplikace.headbg
                    }
                    highlighted: control.highlightedIndex === index
                }
                MouseArea{
                    property bool overridePressed: false
                            readonly property bool effectivePressed: (pressed || overridePressed) && containsMouse
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.OpenHandCursor
                            onClicked:{
                                if(combopopup.opened == true){
                                    combopopup.close()
                                }
                                else{
                                    combopopup.open()
                                }
                    }
                    }

                indicator: Canvas {
                    id: canvas
                    x: control.width - width - control.rightPadding
                    y: control.topPadding + (control.availableHeight - height) / 2
                    width: 12
                    height: 8
                    contextType: "2d"

                    Connections {
                        target: control
                        function onPressedChanged() { canvas.requestPaint(); }
                    }

                    onPaint: {
                        context.reset();
                        context.moveTo(0, 0);
                        context.lineTo(width, 0);
                        context.lineTo(width / 2, height);
                        context.closePath();
                        context.fillStyle = vzhledAplikace.textc;
                        context.fill();
                    }
                }

                contentItem: Text {
                    leftPadding: 5
                    rightPadding: control.indicator.width + control.spacing

                    text: control.displayText
                    font: control.font
                    color: vzhledAplikace.textc
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: 500
                    implicitHeight: 35
                    color: control.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.headbg
                    border.color: vzhledAplikace.textc
                    border.width: 1
                }

                popup: Popup {
                    id: combopopup
                    y: control.height
                    width: control.width
                    height: Math.min(contentItem.implicitHeight, control.Window.height - topMargin - bottomMargin)
                    padding: 1
                    contentItem: ListView {
                        clip: true
                        implicitHeight: contentHeight - 1
                        model: control.popup.visible ? control.delegateModel : null
                        currentIndex: control.highlightedIndex
                       ScrollIndicator.vertical: ScrollIndicator { }
                    }
                    background: Rectangle {
                        color: vzhledAplikace.headbg
                    }
                }
            }}
        }
        }
    }

}
}
}

