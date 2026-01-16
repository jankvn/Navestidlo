pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Basic
import ComboBoxHandler
import QtQml
import QtQuick 2.0
import QtQuick.Window 2.3   // důležité pro "Screen"

Page {
    id: root
    anchors.fill: parent

    // property přijde z ostnav.qml
    property string nid: ""
    property string pageName: ""

    Loader {
        id: pageloader
        anchors.fill: parent
        onLoaded: {
                    console.log("Loader loaded. PageName:", pageloader.item ? pageloader.item.pageName : "undefined")
                    if (pageloader.item) {
                        root.pageName = pageloader.item.pageName
                    }
                }
    }

    function loadPage() {
        var url = root.width >= 800 ? "qrc:/navestDesktop.qml" : "qrc:/navestMobile.qml"
        console.log("Loading page:", url, "nid:", root.nid)
        pageloader.setSource(url, { nid: root.nid })
    }
    function getData() {
        if (pageloader.item) {
            // Pokud chceš, můžeš rovnou předat odkaz zpět
            root.pageName = pageloader.item.pageName
        }
    }

    Component.onCompleted:
    {
        loadPage()
        getData()
    }

    // reaguj na změnu velikosti obrazovky
    Connections {
        target: Screen
        onWidthChanged: loadPage()
    }

    // reaguj i na změnu velikosti samotného Page (např. když měníš velikost okna na desktopu)
    onWidthChanged: loadPage()
}

