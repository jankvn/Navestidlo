import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: root
    anchors.fill: parent
    Rectangle {
        width: root.width
        height: root.height
        color: vzhledAplikace.bg
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
                text: qsTr("Aplikace návěstidlo")
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
                        color: "transparent"
                        Column {
                            id: columnLayout
                            anchors.fill: parent
                            spacing: 1
                    Item {
                            Layout.preferredHeight: 15
                        }

                Text {
                    width: parent.width
                    text: qsTr("Aplikace je stále ve vývoji, sekce jsou postupně doplňovány <br><br> Současné řešení je pouze přechodné (demonstrativní). Podoba aplikace a některé funkce se mohou ještě změnit!")
                    font.pixelSize: 13
                    font.bold: true
                    wrapMode: Text.Wrap
                    horizontalAlignment: Text.AlignLeft
                    color: vzhledAplikace.textc
                }}}

                }}

    }}
