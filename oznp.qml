import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: root
    anchors.fill: parent
    background: Rectangle {
        opacity: enabled ? 1 : 0.3
        color: "#ffffff"
    }

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
            text: qsTr("Označovací pásy")
            font.pixelSize: 18
            width: root.width
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
    Text {
        y: 50
        text: qsTr("Na této funkci se pracuje!")
        font.pixelSize: 18
        width: root.width
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    ListView {
        id: someListView
        y: 100
        model: data
        delegate: Text {
            anchors.fill: parent
            text: someRoleName
        }
    }
}
