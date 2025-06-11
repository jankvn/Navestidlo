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
            text: qsTr("Označovací pásy")
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
        Layout.fillWidth: true
        color: vzhledAplikace.bg
        ListView {
                model: xoznp
                //anchors.fill: parent
                height: parent.height
                anchors.fill: parent
                Layout.fillWidth: true
                displayMarginBeginning: 40
                //displayMarginEnd: 40
                    spacing: 10
                    cacheBuffer: 100
                delegate: Item {
                    width: parent.width
                    height: 150
                    /*Row {
                        Text { text: model.id + ": " + model.nazev }
                    }*/
                    Rectangle {
                        //: parent.width
                        width: parent.width
                        height: 150
                        Layout.fillWidth: true
                        color: vzhledAplikace.bg

                            Column {
                                id: column
                                width: 150
                                height: 100
                                Image {
                                    width: 150
                                    height: 150
                                    source: "qrc:/images/oznpasy/"+model.ico+".png"
                                }
                            }
                            Column {
                                id: column1
                                x:150
                                width: 150
                                height: 50
                                Text {
                                    x:150
                                    width: 100
                                    height: 150
                                    text: model.nazev
                                    color: vzhledAplikace.textc
                                    //horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }}

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
