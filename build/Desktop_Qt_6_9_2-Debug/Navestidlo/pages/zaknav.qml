pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Basic
import ComboBoxHandler
import QtQml
import QtQuick 2.0
import "../components"
Page {
    id: root
    anchors.fill: parent
    property string pageName: ""
    property string pageNamepath: "zaknav"

    Loader {
        id: pageloader
        anchors.fill: parent
        source: root.width >= 800 ? "qrc:/pages/zaknavDesktop.qml" : "qrc:/pages/zaknavMobile.qml"
        onLoaded: {
                if (pageloader.item) {
                    // Pokud chceš, můžeš rovnou předat odkaz zpět
                    root.pageName = pageloader.item.pageName
                }
            }
    }
    Connections {
        target: Screen
        onWidthChanged: {
            pageloader.source = Screen.width >= 800 ? "qrc:/pages/zaknavDesktop.qml" : "qrc:/pages/zaknavMobile.qml"
        }
    }
}
