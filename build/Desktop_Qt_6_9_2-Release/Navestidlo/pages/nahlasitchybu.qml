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
    property string pageName: "Nahlásit chybu"
    property string fromPage: ""
    property string fromPagepath: ""

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
        var url = root.width >= 800 ? "qrc:/pages/nahlasitchybuDesktop.qml" : "qrc:/pages/nahlasitchybuMobile.qml"
        console.log("Loading page:", url, "nid:", root.fromPage)
        pageloader.setSource(url, { fromPage: root.fromPage , fromPagepath: root.fromPagepath })
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

