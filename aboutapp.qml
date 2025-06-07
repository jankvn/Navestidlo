import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.settings 1.0
import "."

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



    GridLayout {
        id: grid
        anchors.fill: parent
        columns: 1
        rowSpacing: 0
        columnSpacing: 0
        Rectangle {
            id: xsrectangle
            x: 0
            y: 0
            Layout.fillWidth: true
            height: 40
            color: vzhledAplikace.headbg
            width: root.width

            Text {
                id: text1
                y: 8
                text: qsTr("O aplikaci")
                //text: "Current theme: " + userSettings.theme
                font.pixelSize: 18
                width: root.width
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: vzhledAplikace.textc
            }
        }
        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            RowLayout {
                anchors.fill: parent
                spacing: 0
                Rectangle {
                    Layout.preferredWidth: parent.width / 2
                    Layout.fillHeight: true

                    Text {
                        id: text2
                        x: 10
                        y: 10
                        text: qsTr("Autor:")
                        font.pixelSize: 15
                        font.bold: true
                        color: vzhledAplikace.textc
                    }

                    Text {
                        id: text3
                        x: 10
                        y: 35
                        text: qsTr("Verze:")
                        font.pixelSize: 15
                        font.bold: true
                        color: vzhledAplikace.textc
                    }

                    Text {
                        id: text4
                        x: 10
                        y: 60
                        text: qsTr("Odkaz na Github:")
                        font.pixelSize: 15
                        font.bold: true
                        color: vzhledAplikace.textc
                    }

                       Text {
                           id: text5
                           x: 10
                           y: 85
                           text: qsTr("Webová verze:")
                           font.pixelSize: 15
                           font.bold: true
                           color: vzhledAplikace.textc
                       }
                       Text {
                           id: text10
                           x: 10
                           y: 120
                           text: qsTr("Nastavení")
                           font.pixelSize: 18
                           font.bold: true
                           color: vzhledAplikace.textc
                       }
                       Text {
                           x: 10
                           y: 155
                           text: qsTr("Režim aplikace: (funkce není zatím implementována!)")
                           font.pixelSize: 15
                           font.bold: true
                           color: vzhledAplikace.textc
                       }

                }
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                       Text {
                           id: text6
                           x: 10
                           y: 10
                           text: qsTr("Johan5140")
                           font.pixelSize: 15
                           color: vzhledAplikace.textc
                       }

                       Text {
                           id: text7
                           x: 10
                           y: 35
                           text: qsTr("0.7.3 (zkušební verze)")
                           font.pixelSize: 15
                           color: vzhledAplikace.textc
                       }

                       Text {
                           id: text8
                           x: 10
                           y: 60
                           font.pixelSize: 15
                           text: "Stránka aplikace na github.com"
                           font.underline: true
                           color: vzhledAplikace.textc

                           MouseArea{
                               id: mouseHyperlinkArea
                               anchors.fill: parent
                               hoverEnabled: true
                               cursorShape: Qt.PointingHandCursor
                               onClicked: {
                                   Qt.openUrlExternally("https://github.com/Johan5140/Navestidlo");
                               }
                           }
                       }

                       Text {
                           id: text9
                           x: 10
                           y: 85
                           font.pixelSize: 15
                           text: "*Nefunkční odkaz"
                           color: vzhledAplikace.textc
                           font.underline: true

                           MouseArea{
                               id: mouseHyperlinkArea2
                               anchors.fill: parent
                               hoverEnabled: true
                               cursorShape: Qt.PointingHandCursor
                               onClicked: {
                                   // to do something on clicking the link
                               }
                           }
                       }
                       Switch {
                           id: switch1
                           x: 10
                           y: 150
                           text: "Světlý režim"
                           checked: false
                           contentItem: Text {
                               text: switch1.checked ? "Tmavý režim" : "Světlý režim"
                               verticalAlignment: Text.AlignVCenter
                               leftPadding: switch1.indicator.width + switch1.spacing
                               font.pixelSize: 15
                           }
                           onCheckedChanged: {
                               if (checked){
                                  xsettings.nastaveni("tmavy")
                                  xsettings.vytahninastaveni()
                               }
                               else{
                                  xsettings.nastaveni("svetly")
                                  xsettings.vytahninastaveni()
                               }
                           }
                       }
                   }

            }
        }

    }
}
}

