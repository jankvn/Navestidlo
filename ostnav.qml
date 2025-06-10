import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

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
        ListView {
                model: sqlModel
                //anchors.fill: parent
                height: parent.height
                anchors.fill: parent
                displayMarginBeginning: 40
                //displayMarginEnd: 40
                    spacing: 10
                    cacheBuffer: 100
                delegate: Item {
                    width: parent.width
                    height: 40
                    /*Row {
                        Text { text: model.id + ": " + model.nazev }
                    }*/
                    Rectangle {
                        width: parent.width
                        height: 50
                        color: colorCode

                            Column {
                                id: column
                                width: 200
                                height: 400
                            }
                        Text {
                            width: 100
                            text: model.id + ": " + model.nazev
                        }
                        }
                }
            }



    }
/*    Text {
        y: 50
        text: qsTr("Na této funkci se pracuje!")
        font.pixelSize: 18
        width: root.width
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: vzhledAplikace.textc
    }*/

}
}//}//}
