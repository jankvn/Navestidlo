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
    Layout.fillWidth: true
    Layout.fillHeight: true
    property string pageName: "Rychlostní soustava (Mobilní)"
    property string myString: znd.barva()
    property variant stringList: myString.split(';')
    ComboBoxHandler {
        id: handler
    }
        Rectangle {
           color: vzhledAplikace.bg
           anchors.fill: parent
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
                        onClicked: stackView.push("teorie.qml")
                        hoverEnabled: true
                        cursorShape: Qt.OpenHandCursor
                    }
                    background: Rectangle {
                        anchors.fill: parent
                        color: backbtn.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.headbg
                        radius: 2
                    }
                    Text {
                        text: "<"
                        color: vzhledAplikace.textc
                        font.pixelSize: 30
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                // Text vycentrovaný mezi oba "rozpěrky"
                Text {
                    id: text1
                    text: qsTr("Rychlostní soustava")
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
        Rectangle{
    y:40
    anchors.top: xsrectangle.bottom
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    color: vzhledAplikace.bg
    anchors.topMargin: appWindow.safeArea ? appWindow.safeArea.topMargin : 0
    anchors.bottomMargin: appWindow.isMobile && bottomNav.visible
        ? 0   // safeArea už je zahrnuto v bottomNav
        : (appWindow.safeArea ? appWindow.safeArea.bottomMargin : 0)
        GridLayout {
        id:kxx
        anchors.top: xsrectangle.bottom
        anchors.left: parent.left

        columns: 2
        uniformCellHeights: true
        //uniformCellWidths: true
        width: parent.width -10
        //rowSpacing: 10; columnSpacing: 10
            //height: 200
            Rectangle {
                Layout.preferredWidth: 80
                Layout.preferredHeight: 100
                color: vzhledAplikace.bg
                //Layout.fillHeight: true
       /* Rectangle{
            //Layout.fillWidth: true
            y:50
            //height: 50
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 10

            color: vzhledAplikace.bg*/
            Text {
                y: 15
                x: 10
                height: 25
                text: qsTr("Rychlost")
                font.pixelSize: 15
                verticalAlignment: Text.AlignVCenter
                color: vzhledAplikace.textc
            }
                Text {
                    y: 55
                    x: 10
                    height: 25
                    text: qsTr("a")
                    font.pixelSize: 15
                    verticalAlignment: Text.AlignVCenter
                    color: vzhledAplikace.textc
                }}
                Rectangle {
                    //Layout.preferredWidth: 250
                    Layout.preferredHeight: 100
                    Layout.preferredWidth: parent.width - 75
                color: vzhledAplikace.bg
            ComboBox {
                id: control
                displayText: currentIndex === -1 ? "Please Choose..." : currentText
                width: parent.width -10
                currentIndex: 1
                y: 10
                x: 5
                model: zaklnavesti
                ListModel{
                    id: zaklnavesti
                    ListElement { key: "30 km/h"}
                    ListElement { key: "40 km/h"}
                    ListElement { key: "50 km/h"}
                    ListElement { key: "60 km/h"}
                    ListElement { key: "80 km/h"}
                    ListElement { key: "100 km/h"}
                    ListElement { key: "120 km/h"}
                }
                    onActivated: {
                                nav.stopblikej()
                                xnav.stopblikej()
                                handler.vybratrychnav(control.currentIndex + 1, control2.currentIndex)
                                text7.text = rnd.nazev()
                                text9.text = rnd.vyznam()
                                nav.setVisibility(rnd.barva(), true)
                                nav.ukaztext()
                                nav.linky()
                                nav.horniidc()
                                xnav.visible2nav()
                                xnav.horniidc()
                                xnav.setVisibility(rnd.barva(), true)
                                if (rnd.blik1() !== "" || rnd.blik2() !== ""){
                                    nav.blikej(rnd.blik1(), rnd.blikr())
                                    xnav.blikej(rnd.blik2(), rnd.blikr())
                                }

                    }
                delegate: ItemDelegate {
                    id: delegate
                    hoverEnabled: true
                    required property var model
                    required property int index
                    width: control.width
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
                                if(combopopup.opened === true){
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
                    y: control.height - 1
                    width: control.width
                    height: Math.min(contentItem.implicitHeight, control.Window.height - topMargin - bottomMargin)
                    padding: 1

                    contentItem: ListView {
                        clip: true
                        implicitHeight: contentHeight
                        model: control.popup.visible ? control.delegateModel : null
                        currentIndex: control.highlightedIndex

                       ScrollIndicator.vertical: ScrollIndicator { }
                    }

                    background: Rectangle {
                        color: vzhledAplikace.headbg
                    }
                }
            }
 /*           Text {
                y: 10
                x: 340
                height: 25
                text: qsTr("a")
                font.pixelSize: 15
                verticalAlignment: Text.AlignVCenter
                color: vzhledAplikace.textc
            }*/
        ComboBox {
            id: control2
            width: parent.width -10
            y: 50
            x: 5
            currentIndex: 1
            model: zaklnavesti2
            ListModel{
                id: zaklnavesti2
                ListElement { key: "---"}
                ListElement { key: "volno"}
                ListElement { key: "výstraha"}
                ListElement { key: "opakování návěsti výstraha"}
                ListElement { key: "očekávejte rychlost 40 km/h"}
                ListElement { key: "očekávejte rychlost 60 km/h"}
                ListElement { key: "očekávejte rychlost 80 km/h"}
                ListElement { key: "očekávejte rychlost 100 km/h"}
                ListElement { key: "očekávejte rychlost 120 km/h"}
            }
                    Component.onCompleted: {
                        nav.stopblikej()
                        xnav.stopblikej()
                        handler.vybratrychnav(control.currentIndex + 1, control2.currentIndex)
                        text7.text = rnd.nazev()
                        text9.text = rnd.vyznam()
                        nav.setVisibility(rnd.barva(), true)
                        nav.ukaztext()
                        nav.linky()
                        nav.horniidc()
                        xnav.visible2nav()
                        xnav.horniidc()
                        xnav.setVisibility(rnd.barva(), true)
                        if (rnd.blik1() !== "" || rnd.blik2() !== ""){
                            nav.blikej(rnd.blik1(), rnd.blikr())
                            xnav.blikej(rnd.blik2(), rnd.blikr())
                        }
                    }
                    onActivated: {
                                nav.stopblikej()
                                xnav.stopblikej()
                                handler.vybratrychnav(control.currentIndex + 1, control2.currentIndex)
                                text7.text = rnd.nazev()
                                text9.text = rnd.vyznam()
                                nav.setVisibility(rnd.barva(), true)
                                nav.ukaztext()
                                nav.linky()
                                nav.horniidc()
                                xnav.visible2nav()
                                xnav.horniidc()
                                xnav.setVisibility(rnd.barva(), true)
                                if (rnd.blik1() !== "" || rnd.blik2() !== ""){
                                    nav.blikej(rnd.blik1(), rnd.blikr())
                                    xnav.blikej(rnd.blik2(), rnd.blikr())
                                }

                    }
            delegate: ItemDelegate {
                id: delegate2
                hoverEnabled: true
                required property var model
                required property int index
                width: control2.width
                contentItem: Text {
                    text: delegate2.model[control2.textRole]
                    color: vzhledAplikace.textc
                    font: control2.font
                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter
                }
                background: Rectangle {
                    color: highlighted ? vzhledAplikace.buttonhover : vzhledAplikace.headbg
                }
                highlighted: control2.highlightedIndex === index
            }
            MouseArea{
                property bool overridePressed: false
                        readonly property bool effectivePressed: (pressed || overridePressed) && containsMouse
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.OpenHandCursor
                        onClicked:{
                            if(combopopup2.opened === true){
                                combopopup2.close()
                            }
                            else{
                                combopopup2.open()
                            }
                }
                }

            indicator: Canvas {
                id: canvas2
                x: control2.width - width - control2.rightPadding
                y: control2.topPadding + (control2.availableHeight - height) / 2
                width: 12
                height: 8
                contextType: "2d"

                Connections {
                    target: control2
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
                rightPadding: control2.indicator.width + control2.spacing

                text: control2.displayText
                font: control2.font
                color: vzhledAplikace.textc
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 500
                implicitHeight: 35
                color: control2.hovered ? vzhledAplikace.buttonhover : vzhledAplikace.headbg
                border.color: vzhledAplikace.textc
                border.width: 1
            }

            popup: Popup {
                id: combopopup2
                y: control2.height - 1
                width: control2.width
                height: Math.min(contentItem.implicitHeight, control2.Window.height - topMargin - bottomMargin)
                padding: 1

                contentItem: ListView {
                    clip: true
                    implicitHeight: contentHeight
                    model: control2.popup.visible ? control2.delegateModel : null
                    currentIndex: control2.highlightedIndex

                   ScrollIndicator.vertical: ScrollIndicator { }
                }

                background: Rectangle {
                    color: vzhledAplikace.headbg
                }
            }
        }}}}
        ScrollView {
            id: scroller
            anchors.fill: parent
            anchors.topMargin: 160   // odsazení pod ComboBox
            spacing: 10
            clip: true
            GridLayout {
            anchors.fill: parent
            columns: 1
            uniformCellHeights: true
            uniformCellWidths: true
            rowSpacing: 10; columnSpacing: 10
            /*Rectangle{
                Layout.fillHeight: true
                width: parent.width
                y: 90*/
            RowLayout {
                anchors.fill: parent
                spacing: 0
                Rectangle {
                    id: signalrect
                    Layout.preferredWidth: parent.width
                    Layout.preferredHeight: 470
                    color: vzhledAplikace.bg
                    RowLayout {
                        Layout.preferredWidth: 150
                        spacing: 5
                        anchors.horizontalCenter: parent.horizontalCenter
                        Rectangle {
                            id: sigrect1
                            Layout.preferredWidth: 70
                            Layout.fillHeight: true
                            //anchors.horizontalCenter: parent.horizontalCenter
                            Rectangle{
                                y: 10
                                color: "#303030"
                                width: 70
                                height: 50
                                border.color: "#7d7d7d"
                                border.width: 3
                                radius: 10
                                anchors.horizontalCenter: parent.horizontalCenter
                                Text {
                                    id: hindct
                                    text: qsTr("---")
                                    color: "#f1f50a"
                                    font.bold: true
                                    anchors.fill: parent
                                    font.pixelSize: 28
                                    visible: false
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                            Rectangle{
                                y: 65
                                id: nav
                                color: "#303030"
                                width: 70
                                height: 350
                                border.color: "#7d7d7d"
                                border.width: 3
                                radius: 10
                                anchors.horizontalCenter: parent.horizontalCenter
                                    property var idMap: ({ x1: nx1, x2: nx2, x3: nx3, x4: nx4, x5: nx5, x6: nx6 })
                                    property string myString: rnd.barva()
                                    property variant stringList: myString.split(';')
                                    function findItemById(id) {
                                        return idMap[id];
                                    }
                                    function setVisibility(id, isVisible) {
                                        for (var key in idMap) {
                                                   idMap[key].visible = false;
                                               }
                                        var result = stringProcessor.splitString(id, ";")
                                        for (var i = 0; i < result.length; i++) {
                                            var item = findItemById(result[i]);
                                            if (item) item.visible = isVisible;
                                            }
                                    }
                                    function stopblikej(barva, tempo){
                                        seq.stop()
                                        for (var key in idMap) {
                                                   idMap[key].visible = false;
                                                idMap[key].opacity = 1;
                                               }
                                        var item = findItemById(barva);
                                        if (item) item.visible = true;
                                    }
                                    function blikej(barva, tempo){
                                        var a = ""
                                        var item = findItemById(barva);
                                        if (item) item.visible = true;
                                        if (tempo === "pomalu")
                                        {
                                            a = 900
                                        }
                                        if (tempo === "rychle")
                                        {
                                            a = 450
                                        }
                                        seq.xx.targets = [item]
                                        seq.xx.property = "opacity"
                                        seq.xx.value = 0
                                        //seq.xy.targets = [item]
                                        seq.xy.duration = a
                                        seq.yx.targets = [item]
                                        seq.yx.property = "opacity"
                                        seq.yx.value = 1
                                        //seq.yy.targets = [item]
                                        seq.yy.duration = a
                                        seq.start()
                                    }
                                    function ukaztext(){
                                        if (rnd.dolindc() !== ""){
                                            xtext2.text = rnd.dolindc()
                                            xtext2.visible = true
                                        }else{
                                            xtext2.visible = false
                                        }
                                    }
                                    function linky(){
                                        if (rnd.linka1() !== "" || rnd.linka2() !== "")
                                        {
                                            if (rnd.linka1() === "6")
                                            {
                                                line1.color = "#f1f50a"
                                                line1.visible = true
                                            }
                                            if (rnd.linka1() === "8" || rnd.linka1() === "10")
                                            {
                                                line1.color = "#16cc47"
                                                line1.visible = true
                                            }
                                            if (rnd.linka2() === "10")
                                            {
                                                line2.color = "#16cc47"
                                                line2.visible = true
                                            }
                                        } else{
                                            line1.visible = false
                                            line2.visible = false
                                        }
                                    }
                                    function horniidc()
                                    {
                                        if (rnd.hindct() !== "")
                                        {
                                            hindct.text = rnd.hindct()
                                            hindct.visible = true
                                        }else {
                                            hindct.visible = false
                                        }
                                    }
                                Rectangle{
                                    objectName: "x1"
                                    id: nx1
                                    width: 45
                                    height: 45
                                    x: 12
                                    y: 10
                                    radius: 50
                                    color: "#f1f50a"
                                    visible: false
                                }
                                Rectangle{
                                    width: 45
                                    id: nx2
                                    objectName: "x2"
                                    height: 45
                                    x: 12
                                    y: 65
                                    radius: 45
                                    color: "#16cc47"
                                    visible: false
                                }
                                Rectangle{
                                    width: 45
                                    objectName: "x3"
                                    id: nx3
                                    height: 45
                                    x: 12
                                    y: 120
                                    radius: 45
                                    color: "#ff0000"
                                    visible: false
                                }
                                Rectangle{
                                    width: 45
                                    objectName: "x4"
                                    id: nx4
                                    height: 45
                                    x: 12
                                    y: 175
                                    radius: 45
                                    color: "#fcfcfc"
                                    visible: false
                                }
                                Rectangle{
                                    width: 45
                                    objectName: "x6"
                                    id: nx6
                                    height: 45
                                    x: 12
                                    y: 230
                                    radius: 45
                                    color: "#3939e6"
                                    visible: false
                                }
                                Rectangle{
                                    width: 45
                                    objectName: "x5"
                                    id: nx5
                                    height: 45
                                    x: 12
                                    y: 285
                                    radius: 45
                                    color: "#f1f50a"
                                    visible: false
                                }
                            }
                            Rectangle{
                                y: 420
                                color: "#303030"
                                width: 70
                                height: 50
                                border.color: "#7d7d7d"
                                border.width: 3
                                radius: 10
                                anchors.horizontalCenter: parent.horizontalCenter
                                Rectangle {
                                    id: line1
                                    x: 10
                                    y: 10
                                    visible: false
                                    height: 10
                                    width: parent.width -20
                                }

                                Rectangle {
                                    id: line2
                                    //value: 1.0
                                    x: 10
                                    y: 30
                                    visible: false
                                    height: 10
                                    width: parent.width -20
                                }
                                Text {
                                    id: xtext2
                                    //x: 25
                                    width: parent.width
                                    text: "---"
                                    visible: false
                                    font.pixelSize: 35
                                    color: "#ffffff"
                                    font.bold: true
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }

                            }
                        }
                        Rectangle {
                            //Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.preferredWidth: 70
                            id:nav2cont
                            visible: false
                            Rectangle{
                                y: 10
                                color: "#303030"
                                width: 70
                                height: 50
                                border.color: "#7d7d7d"
                                border.width: 3
                                radius: 10
                                anchors.horizontalCenter: parent.horizontalCenter
                                Text {
                                    id: xhindct
                                    text: qsTr("---")
                                    color: "#f1f50a"
                                    font.bold: true
                                    anchors.fill: parent
                                    font.pixelSize: 28
                                    visible: false
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                            Rectangle{
                                y: 65
                                id: xnav
                                color: "#303030"
                                width: 70
                                height: 350
                                border.color: "#7d7d7d"
                                border.width: 3
                                radius: 10
                                anchors.horizontalCenter: parent.horizontalCenter
                                    property var idMap: ({ x7: nx7, x8: nx8, x9: nx9, x10: nx10, x11: nx11, x12: nx12 })
                                    property string myString: znd.xbarva()
                                    property variant stringList: myString.split(';')
                                    function visible2nav() {
                                        if (control.currentIndex === 0){
                                            nav2cont.visible = true;
                                        }else {
                                            nav2cont.visible = false;
                                        }
                                    }
                                    function findItemById(id) {
                                        return idMap[id];
                                    }
                                    function setVisibility(id, isVisible) {
                                        for (var key in idMap) {
                                                   idMap[key].visible = false;
                                               }
                                        var result = stringProcessor.splitString(id, ";")
                                        for (var i = 0; i < result.length; i++) {
                                            var item = findItemById(result[i]);
                                            if (item) item.visible = isVisible;
                                            }
                                    }
                                    function stopblikej(barva, tempo){
                                        seq1.stop()
                                        for (var key in idMap) {
                                                   idMap[key].visible = false;
                                                idMap[key].opacity = 1;
                                               }
                                        var item = findItemById(barva);
                                        if (item) item.visible = true;
                                    }
                                    function blikej(barva, tempo){
                                        var a = ""
                                        var item = findItemById(barva);
                                        if (item) item.visible = true;
                                        if (tempo === "pomalu")
                                        {
                                            a = 900
                                        }
                                        if (tempo === "rychle")
                                        {
                                            a = 450
                                        }
                                        seq1.xx.targets = [item]
                                        seq1.xx.property = "opacity"
                                        seq1.xx.value = 0
                                        //seq.xy.targets = [item]
                                        seq1.xy.duration = a
                                        seq1.yx.targets = [item]
                                        seq1.yx.property = "opacity"
                                        seq1.yx.value = 1
                                        //seq.yy.targets = [item]
                                        seq1.yy.duration = a
                                        seq1.start()
                                    }
                                    function horniidc()
                                    {
                                        if (rnd.hindct() !== "")
                                        {
                                            xhindct.text = rnd.hindct()
                                            xhindct.visible = true
                                        }else {
                                            xhindct.visible = false
                                        }
                                    }
                                Rectangle{
                                    objectName: "x1"
                                    id: nx7
                                    width: 45
                                    height: 45
                                    x: 12
                                    y: 10
                                    radius: 50
                                    color: "#f1f50a"
                                    visible: false
                                }
                                Rectangle{
                                    width: 45
                                    id: nx8
                                    objectName: "x2"
                                    height: 45
                                    x: 12
                                    y: 65
                                    radius: 45
                                    color: "#16cc47"
                                    visible: false
                                }
                                Rectangle{
                                    width: 45
                                    objectName: "x3"
                                    id: nx9
                                    height: 45
                                    x: 12
                                    y: 120
                                    radius: 45
                                    color: "#ff0000"
                                    visible: false
                                }
                                Rectangle{
                                    width: 45
                                    objectName: "x4"
                                    id: nx10
                                    height: 45
                                    x: 12
                                    y: 175
                                    radius: 45
                                    color: "#fcfcfc"
                                    visible: false
                                }
                                Rectangle{
                                    width: 45
                                    objectName: "x6"
                                    id: nx11
                                    height: 45
                                    x: 12
                                    y: 230
                                    radius: 45
                                    color: "#3939e6"
                                    visible: false
                                }
                                Rectangle{
                                    width: 45
                                    objectName: "x5"
                                    id: nx12
                                    height: 45
                                    x: 12
                                    y: 285
                                    radius: 45
                                    color: "#f1f50a"
                                    visible: false
                                }
                            }
                            Rectangle{
                                y: 420
                                color: "#303030"
                                width: 70
                                height: 50
                                border.color: "#7d7d7d"
                                border.width: 3
                                radius: 10
                                anchors.horizontalCenter: parent.horizontalCenter

                                Rectangle {
                                    id: rectangle
                                    x: 10
                                    y: 10
                                    width: 5
                                    height: 30
                                    color: "#FFFF00"
                                }

                                Text {
                                    id: text2
                                    x: 25
                                    text: qsTr("3")
                                    font.pixelSize: 35
                                    color: "#FFFF00"
                                    font.bold: true
                                }

                                Rectangle {
                                    id: rectangle1
                                    x: 55
                                    y: 10
                                    width: 5
                                    height: 30
                                    color: "#FFFF00"
                                }

                            }
                        }
                    }
                }}
                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
color: vzhledAplikace.bg
                       Text {
                           id: text6
                           x: 8
                           y: 8
                           text: qsTr("Název návěsti:")
                           font.pixelSize: 15
                            font.bold: true
                            color: vzhledAplikace.textc
                       }
                    Rectangle{
                    x: 8
                    width: parent.width - 15
                    height: 30
                    y: 35
                    color: vzhledAplikace.headbg
                    Text {
                        id: text7
                        text: "--------"
                        height: parent.height
                        font.pixelSize: 15
                        verticalAlignment: Text.AlignVCenter
                        padding: 5
                        color: vzhledAplikace.textc
                    }
                }


                   Text {
                       id: text8
                       x: 8
                       y: 70
                       font.pixelSize: 15
                       text: "Význam návěsti:"
                    font.bold: true
                        color: vzhledAplikace.textc
                   }
                    Rectangle{
                    x: 8
                    y: 95
                    width: parent.width - 15
                    height: childrenRect.height
                    color: vzhledAplikace.headbg
                    Text {
                        id: text9
                        textFormat: TextEdit.RichText
                        width: parent.width
                        wrapMode: Text.Wrap
                        font.pixelSize: 15
                        text: "--------"
                        padding: 5
                        color: vzhledAplikace.textc
                    }
                }

                }
                Connections{
                    target: znd
                    //: text7.text = text
                    onValueChanged: text7.text = znd.stuj()
                }
                SequentialAnimation {
                    id: seq
                    loops: Animation.Infinite
                    property alias xx: xx1
                    property alias xy: xy1
                    property alias yx: yx1
                    property alias yy: yy1
                    PropertyAction {id: xx1}
                    PauseAnimation {id: xy1 }
                    PropertyAction {id: yx1 }
                    PauseAnimation {id: yy1 }
                }
                SequentialAnimation {
                    id: seq1
                    loops: Animation.Infinite
                    property alias xx: xx2
                    property alias xy: xy2
                    property alias yx: yx2
                    property alias yy: yy2
                    PropertyAction {id: xx2}
                    PauseAnimation {id: xy2 }
                    PropertyAction {id: yx2 }
                    PauseAnimation {id: yy2 }
                }
        }

}
}
}
