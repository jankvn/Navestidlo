import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: root
    anchors.fill: parent
    VzhledAplikace
    {
        id: vzhledAplikace
    }
    Rectangle {
        width: root.width
        height: root.height
        color: vzhledAplikace.bg
        Rectangle {
            id: xsrectangle
            x: 0
            y: 0
            //width: 1000
            Layout.fillWidth: true
            height: 40
            color: "#d4d4d4"
            width: root.width

            Text {
                id: text1
                y: 8
                text: qsTr("Aplikace návěstidlo na QT/QML")
                font.pixelSize: 18
                width: root.width
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
        Text {
            x: 5
            y: 45
            text: qsTr("Aplikace je stále ve vývoji, sekce jsou postupně doplňovány")
            font.pixelSize: 13
            font.bold: true
            horizontalAlignment: Text.AlignLeft
        }
        Text {
            x: 5
            y: 70
            text: qsTr("Současné řešení je pouze přechodné (demonstrativní). Podoba aplikace a některé funkce se mohou ještě změnit!")
            font.pixelSize: 13
            font.bold: true
            horizontalAlignment: Text.AlignLeft
        }

    }

}
