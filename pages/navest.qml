pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Basic
import ComboBoxHandler
import QtQml
import QtQuick 2.0
import QtQuick.Window 2.3   // důležité pro "Screen"
import "../components"

Page {
    id: root
    anchors.fill: parent

    // property přijde z ostnav.qml
    property string nid: ""
    property string pageName: ""
    property string pageNamepath: "navest"

    Loader {
        id: pageloader
        anchors.fill: parent
        onLoaded: {
                    if (pageloader.item) {
                        root.pageName = pageloader.item.pageName
                    }
                }
    }

    function loadPage() {
        var url = root.width >= 800 ? "qrc:/pages/navestDesktop.qml" : "qrc:/pages/navestMobile.qml"
        console.log("Loading page:", url, "nid:", root.nid)
        pageloader.setSource(url, { nid: root.nid })
    }

    Component.onCompleted:
    {
        loadPage()
    }

    // reaguj na změnu velikosti obrazovky
    Connections {
        target: Screen
        onWidthChanged: loadPage()
    }

    // reaguj i na změnu velikosti samotného Page (např. když měníš velikost okna na desktopu)
    onWidthChanged: loadPage()
}

