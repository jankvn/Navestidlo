
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: root
    property string pageName: ""
    anchors.fill: parent

    Loader {
        id: pageloader
        anchors.fill: parent
        source: root.width >= 800 ? "qrc:/rychsDesktop.qml" : "qrc:/rychsMobile.qml"
        onLoaded: {
                if (pageloader.item) {
                    // Pokud chceš, můžeš rovnou předat odkaz zpět
                    root.pageName = pageloader.item.pageName
                }
            }
    }

    Connections {
        target: Screen
        function onWidthChanged() {   // změna syntaxe
            pageloader.source = Screen.width >= 800 ? "qrc:/rychsDesktop.qml" : "qrc:/rychsMobile.qml"
        }
    }
}

