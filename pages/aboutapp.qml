import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Page {
    id: root
    anchors.fill: parent
    property string pageName: ""
    property string pageNamepath: "aboutapp"

    Loader {
        id: pageloader
        anchors.fill: parent
        source: root.width >= 800 ? "qrc:/pages/AboutDesktop.qml" : "qrc:/pages/AboutMobile.qml"
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
            pageloader.source = Screen.width >= 800 ? "qrc:/pages/AboutDesktop.qml" : "qrc:/pages/AboutMobile.qml"
        }
    }
}
