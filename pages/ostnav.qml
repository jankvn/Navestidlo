import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Page {
    id: root
    anchors.fill: parent
    property string pageName: ""
    property string pageNamepath: "ostnav"

    Loader {
        id: pageloader
        anchors.fill: parent
        source: (appWindow.width >= 1000)
                  ? "qrc:/pages/ostnavDesktop.qml"
                  : "qrc:/pages/ostnavMobile.qml"

        onLoaded: {
            if (pageloader.item) {
                root.pageName = pageloader.item.pageName
            }
        }
    }

    Connections {
        target: appWindow
        function onWidthChanged() {
            pageloader.source = (appWindow.width >= 1000)
                                 ? "qrc:/pages/ostnavDesktop.qml"
                                 : "qrc:/pages/ostnavMobile.qml"
        }
    }
}
