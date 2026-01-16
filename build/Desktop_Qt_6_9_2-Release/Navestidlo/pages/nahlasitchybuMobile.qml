import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls 6.5
import "../components"

Page {
    id: root
    anchors.fill: parent
    property string fromPage: ""
    property string fromPagepath: ""
    property string pageName: "Nahlásit chybu"
    function odeslatChybu() {
        var url = "https://navestidlo.kavjan.cz/data/api/api_proxy.php?target=chyby&fnc=chyby"

        var xhr = new XMLHttpRequest()
        xhr.open("POST", url)
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    console.log("Odpověď API:", xhr.responseText)
                    var resp = JSON.parse(xhr.responseText)
                    if (resp.status === "ok") {
                        Qt.callLater(() => {
                            status.visible = true
                            statustext.text = "Chyba byla úspěšně odeslána"
                            hideStatusTimer.start()
                        })
                    } else {
                        status.visible = true
                        status.color = "red"
                        statustext.text = "Chyba při odesílání:" + resp.message
                        hideStatusTimer.start()
                    }
                } else {
                    console.log("HTTP error", xhr.status)
                }
            }
        }

        // data z formuláře
        var typ = "Aplikace - " + control.currentText
        var popisStrucny = strucnypopis.text
        var popisPresny = presnypopis.text
        var stranka = xstranka.text
        var verze = Qt.application.version
        var os = osVersion

        var data = "ervyskyt=" + encodeURIComponent(typ) +
                   "&errstrpopis=" + encodeURIComponent(popisStrucny) +
                   "&errprpopis=" + encodeURIComponent(popisPresny) +
                   "&str=" + encodeURIComponent(stranka) +
                   "&ver=" + encodeURIComponent(verze) +
                   "&os=" + encodeURIComponent(os)

        xhr.send(data)
    }
    /*Layout.fillWidth: true
    Layout.fillHeight: true*/
    Component.onCompleted: {
        console.log("Přišel argument:", fromPage)
        zmenstranku()
    }
    function zmenstranku()
    {
        if (fromPagepath === "")
        {
            fromPagepath = "ostatni"
        }
    }

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
           color: vzhledAplikace.bg
           height: root.height
    width:root.width
    Rectangle {
        id: xsrectangle
        x: 0
        y: 0
        Layout.fillWidth: true
        height: 60
        color: vzhledAplikace.headbg
        width: parent.width

        RowLayout {
            anchors.fill: parent
            spacing: 10

            Button {
                id: backbtn
                Layout.preferredWidth: 60
                Layout.preferredHeight: 60
                MouseArea {
                    anchors.fill: parent
                    onClicked: stackView.push(fromPagepath+".qml")
                    hoverEnabled: true
                    cursorShape: Qt.OpenHandCursor
                }
                background: Rectangle {
                    anchors.fill: parent
                    color: backbtn.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.headbg
                    radius: 2
                }
                Canvas {
                    id: arrowCanvas
                    anchors.centerIn: parent
                    width: 25
                    height: 25

                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.clearRect(0, 0, width, height)
                        ctx.fillStyle = vzhledAplikace.textc

                        ctx.beginPath()
                        ctx.moveTo(width * 0.7, height * 0.15)   // pravý horní
                        ctx.lineTo(width * 0.3, height * 0.5)    // levý střed
                        ctx.lineTo(width * 0.7, height * 0.85)   // pravý dolní
                        ctx.closePath()
                        ctx.fill()
                    }
                }

            }

            // Text vycentrovaný mezi oba "rozpěrky"
            Text {
                id: text1
                text: qsTr("Nahlásit chybu")
                font.pixelSize: 18
                color: vzhledAplikace.textc
                Layout.alignment: Qt.AlignCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            // prázdný Item na vyvážení šířky backbtn
            Item {
                Layout.preferredWidth: backbtn.width
                Layout.preferredHeight: 1
            }
        }
        }
    ScrollView {
        id: scroller
        y: 60
        //Layout.preferredHeight: parent.height * 0.8
        contentWidth: -1
        anchors.top: xsrectangle.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        clip : true
            ColumnLayout {
                anchors.fill: parent
                //width: root.width
                spacing: 0
                Rectangle{
                    id:status
                    implicitHeight: statustext.implicitHeight
                    anchors.left: parent.left
                    anchors.right: parent.right
                    visible: false
                    anchors.margins: 0
                    color: "green"
                    Text{
                        id: statustext
                        text: "--------"
                        anchors.fill: parent
                        font.pixelSize: 15
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        padding: 5
                        color: "#FFFFFF"
                    }
                    Timer {
                        id: hideStatusTimer
                        interval: 6000    // 3000 ms = 3 sekundy
                        repeat: false
                        onTriggered: {
                            status.visible = false
                            statustext.text = ""
                            status.color = "black" // nebo původní barva
                        }
                    }
                }
                Item {
                        height: 15
                    }
                Rectangle {
                    implicitHeight: columnLayout.implicitHeight
                    y: 15
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 25
                    color: "transparent"
                    Column {
                        id: columnLayout
                        anchors.fill: parent
                        spacing: 15
                        Text {
                            text: qsTr("O jakou chybu se jedná:")
                            font.pixelSize: 16
                            color: vzhledAplikace.textc
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                        }
                        Item {
                                height: 15
                            }
                        ComboBox {
                            id: control
                            width: parent.width

                            //y: 5
                            anchors.horizontalCenter: parent.horizontalCenter
                            model: zaklnavesti
                                ListModel{
                                id: zaklnavesti
                                ListElement { key: "Funkce"}
                                ListElement { key: "Obsah"}
                            }
                            delegate: ItemDelegate {
                                id: delegate
                                hoverEnabled: true
                                required property var model
                                required property int index
                                width: control.width
                                //width: control.width
                                contentItem: Text {
                                    text: delegate.model[control.textRole]
                                    color: vzhledAplikace.textc
                                    font: control.font
                                    elide: Text.ElideRight
                                    verticalAlignment: Text.AlignVCenter
                                }
                                background: Rectangle {
                                    color: highlighted ? vzhledAplikace.buttonhover : vzhledAplikace.headbg
                                }
                                highlighted: control.highlightedIndex === index
                            }
                            MouseArea{
                                property bool overridePressed: false
                                        readonly property bool effectivePressed: (pressed || overridePressed) && containsMouse
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        cursorShape: Qt.OpenHandCursor
                                        onClicked:{
                                            if(combopopup.opened == true){
                                                combopopup.close()
                                            }
                                            else{
                                                combopopup.open()
                                            }
                                }
                                }

                            indicator: Canvas {
                                id: canvas
                                x: control.width - width - control.rightPadding
                                y: control.topPadding + (control.availableHeight - height) / 2
                                width: 12
                                height: 8
                                contextType: "2d"

                                Connections {
                                    target: control
                                    function onPressedChanged() { canvas.requestPaint(); }
                                }

                                onPaint: {
                                    context.reset();
                                    context.moveTo(0, 0);
                                    context.lineTo(width, 0);
                                    context.lineTo(width / 2, height);
                                    context.closePath();
                                    context.fillStyle = vzhledAplikace.textc;
                                    context.fill();
                                }
                            }

                            contentItem: Text {
                                leftPadding: 5
                                rightPadding: control.indicator.width + control.spacing

                                text: control.displayText
                                font: control.font
                                color: vzhledAplikace.textc
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }

                            background: Rectangle {
                                implicitWidth: 500
                                implicitHeight: 35
                                color: control.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.headbg
                                border.color: vzhledAplikace.textc
                                border.width: 1
                            }

                            popup: Popup {
                                id: combopopup
                                y: control.height
                                width: control.width
                                // nastavíme výšku popupu podle počtu položek
                                height: Math.min(listView.contentHeight, control.Window.height - 100)

                                padding: 1

                                contentItem: ListView {
                                    id: listView
                                    anchors.fill: parent
                                    clip: true
                                    model: control.popup.visible ? control.delegateModel : null
                                    currentIndex: control.highlightedIndex
                                    ScrollIndicator.vertical: ScrollIndicator {}
                                }

                                background: Rectangle {
                                    color: vzhledAplikace.headbg
                                }
                            }
                        }
                        Text {
                            text: qsTr("Stručný popis chyby:")
                            font.pixelSize: 16
                            color: vzhledAplikace.textc
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                        }
                        TextField {
                            id: strucnypopis
                            width: parent.width
                            height: 35
                            color: vzhledAplikace.textc
                            onTextChanged: if (text.length > 255) text = text.slice(0, 255)
                            background: Rectangle {
                                color: vzhledAplikace.headbg
                                border.color: vzhledAplikace.textc
                            }
                        }
                        Text {
                            text: qsTr("Kde se chyba vyskytuje (stránka):")
                            font.pixelSize: 16
                            color: vzhledAplikace.textc
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                        }
                        TextField {
                            id: xstranka
                            width: parent.width
                            height: 35
                            text: fromPage
                            color: vzhledAplikace.textc
                            onTextChanged: if (text.length > 255) text = text.slice(0, 255)
                            background: Rectangle {
                                color: vzhledAplikace.headbg
                                border.color: vzhledAplikace.textc
                            }
                        }
                        Text {
                            text: qsTr("Přesný popis chyby:")
                            font.pixelSize: 16
                            color: vzhledAplikace.textc
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                        }
                        TextArea {
                            id: presnypopis
                            width: parent.width
                            height: 150
                            wrapMode: TextEdit.Wrap
                             color: vzhledAplikace.textc

                            onTextChanged: if (text.length > 1500) text = text.slice(0, 1500)
                            background: Rectangle {
                                color: vzhledAplikace.headbg
                                border.color: vzhledAplikace.textc
                                border.width: 1
                            }
                        }
                        Text {
                            text: qsTr("Verze aplikace:")
                            font.pixelSize: 16
                            color: vzhledAplikace.textc
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                        }
                        Text {
                            text: Qt.application.version
                            font.pixelSize: 16
                            color: vzhledAplikace.textc
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                        }
                        Text {
                            text: qsTr("Operační systém:")
                            font.pixelSize: 16
                            color: vzhledAplikace.textc
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                        }
                        Text {
                            text:osVersion
                            font.pixelSize: 16
                            color: vzhledAplikace.textc
                            wrapMode: Text.WordWrap
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                        }
                    /*    CheckBox {
                            id: checkbox1
                            text: "Souhlasím s odesláním "
                            indicator: Rectangle {
                                implicitWidth: 26
                                implicitHeight: 26
                                color: vzhledAplikace.menubg
                                x: checkbox1.leftPadding
                                y: parent.height / 2 - height / 2
                                radius: 3
                                border.color: vzhledAplikace.textc

                                   Rectangle {
                                       width: 14
                                       height: 14
                                       x: 6
                                       y: 6
                                       radius: 2
                                       color: vzhledAplikace.textc
                                       visible: checkbox1.checked
                                   }
                               }
                            contentItem: Text {
                                    text: checkbox1.text
                                    font: checkbox1.font
                                    opacity: enabled ? 1.0 : 0.3
                                    color: vzhledAplikace.textc
                                    verticalAlignment: Text.AlignVCenter
                                    leftPadding: checkbox1.indicator.width + checkbox1.spacing
                                }
                        } */

                        Rectangle {
                            implicitHeight: columnLayoutxx.implicitHeight
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.margins: 0
                            color: vzhledAplikace.menubg
                            radius: 10
                            border.color: vzhledAplikace.headbg
                            border.width: 1

                            Column {
                                id: columnLayoutxx
                                anchors.fill: parent
                                spacing: 1

                                Rectangle {
                                        width: parent.width
                                        height: 70
                                        radius: 10
                                        color: "transparent"   // ← tady změna!
                                        property bool isHovered: false

                                        MouseArea {
                                            anchors.fill: parent
                                            hoverEnabled: true
                                            onEntered: parent.isHovered = true
                                            onExited: parent.isHovered = false
                                            onClicked: odeslatChybu()
                                            cursorShape: Qt.PointingHandCursor
                                        }

                                        RoundedBackground {
                                            anchors.fill: parent
                                            topRounded: true
                                            bottomRounded: true
                                            fillColor: parent.isHovered ? vzhledAplikace.buttonhover : "transparent"   // ← tady změna!
                                        }

                                        RowLayout {
                                            anchors.fill: parent
                                            anchors.margins: 12
                                            spacing: 10

                                            // text uprostřed (zabere zbytek šířky)
                                            Text {
                                                text: "Odeslat"
                                                font.pixelSize: 16
                                                color: vzhledAplikace.textc
                                                wrapMode: Text.WordWrap
                                                elide: Text.ElideRight
                                                Layout.fillWidth: true
                                                Layout.alignment: Qt.AlignVCenter
                                            }

                                            // šipka napravo
                                            Canvas {
                                                id: arrowCanvasy
                                                width: 15
                                                height: 15
                                                Layout.alignment: Qt.AlignVCenter

                                                onPaint: {
                                                    var ctx = getContext("2d")
                                                    ctx.clearRect(0, 0, width, height)
                                                    ctx.fillStyle = vzhledAplikace.textc
                                                    ctx.beginPath()
                                                    ctx.moveTo(4, 2)
                                                    ctx.lineTo(11, 7.5)
                                                    ctx.lineTo(4, 13)
                                                    ctx.closePath()
                                                    ctx.fill()
                                                }
                                            }
                                        }
                                    }
                                }




                                }

                            }




                        }

                    }
                    }

                }

}}
