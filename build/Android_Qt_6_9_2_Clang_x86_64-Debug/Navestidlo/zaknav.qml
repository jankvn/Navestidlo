pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Basic
import ComboBoxHandler
import QtQml
import QtQuick 2.0
Page {
    id: root
    anchors.fill: parent

    Loader {
        id: pageloader
        anchors.fill: parent
        source: root.width >= 800 ? "qrc:/zaknavDesktop.qml" : "qrc:/zaknavMobile.qml"
    }
    Connections {
        target: Screen
        onWidthChanged: {
            pageloader.source = Screen.width >= 800 ? "qrc:/zaknavDesktop.qml" : "qrc:/zaknavMobile.qml"
        }
    }
}
