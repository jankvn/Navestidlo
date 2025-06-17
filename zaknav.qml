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
    //anchors.fill: parent
    Layout.fillWidth: true
    Layout.fillHeight: true
    property string myString: znd.xbarva()
    property variant stringList: myString.split(';')
    ComboBoxHandler {
        id: handler
    }
    Rectangle {
Layout.fillWidth: true
Layout.fillHeight: true
    GridLayout {
        anchors.fill: parent
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
            height: 40
            color: vzhledAplikace.headbg
            width: parent.width

            Text {
                id: text1
                y: 8
                text: qsTr("Základní návěsti na světelných návěstidlech")
                font.pixelSize: 18
                width: root.width
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: vzhledAplikace.textc
            }
        }
                Rectangle{
                    y: 40
                    width: root.width
                    //Layout.fillWidth: true
            ComboBox {
                id: control
                width: 500
                y: 5
                anchors.horizontalCenter: parent.horizontalCenter
                model: zaklnavesti
                    ListModel{
                    id: zaklnavesti
                    ListElement { key: "Vyberte prosím návěst..."}
                    ListElement { key: "Stůj"}
                    ListElement { key: "Volno"}
                    ListElement { key: "Výstraha"}
                    ListElement { key: "Opakování návěsti výstraha"}
                    ListElement { key: "Jízda vlaku dovolena"}
                    ListElement { key: "Přivolávací návěst"}
                    ListElement { key: "Posun dovolen"}
                    ListElement { key: "Posun zakázán"}
                }
                onActivated: {
                    nav.stopblikej()
                    handler.onItemChanged(currentIndex)
                    text7.text = znd.xnazev()
                    text9.text = znd.xpopis()
                    nav.setVisibility(znd.xbarva(), true)
                    if (znd.xblikb() != "n"){
                        nav.blikej(znd.xblikb(), znd.xblikt())
                    }

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
                    height: Math.min(contentItem.implicitHeight, control.Window.height - topMargin - bottomMargin)
                    padding: 1
                    contentItem: ListView {
                        clip: true
                        implicitHeight: contentHeight - 1
                        model: control.popup.visible ? control.delegateModel : null
                        currentIndex: control.highlightedIndex
                       ScrollIndicator.vertical: ScrollIndicator { }
                    }
                    background: Rectangle {
                        color: vzhledAplikace.headbg
                    }
                }
            }}
            Rectangle{
                //Layout.fillHeight: true
                width: root.width
                y: 90
            RowLayout {
                        anchors.fill: parent
                        //width: root.width
                        spacing: 0
                Rectangle {
                            Layout.preferredWidth: parent.width / 2
                            Layout.fillHeight: true
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
                            id: name
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
                        property string myString: znd.xbarva()

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
                            var item = findItemById(barva);
                            if (item) item.visible = true;
                            seq.xx.targets = [item]
                            seq.xx.property = "opacity"
                            seq.xx.value = 0
                            //seq.xy.targets = [item]
                            seq.xy.duration = 900
                            seq.yx.targets = [item]
                            seq.yx.property = "opacity"
                            seq.yx.value = 1
                            //seq.yy.targets = [item]
                            seq.yy.duration = 900
                            seq.start()
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

                        ProgressBar {
                            id: progressBar
                            value: 1.0
                            x: 10
                            y: 10
                            visible: false
                            height: 15
                            width: parent.width -20
                        }
                        ProgressBar {
                            id: progressBa1
                            value: 1.0
                            x: 10
                            y: 25
                            visible: false
                            height: 15
                            width: parent.width -20
                        }

                    }
                }
                Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true

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
                            text: "---------"
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
                            text: "---------"
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
                        //NumberAnimation { to: 0; duration: 500 }
                        //NumberAnimation { to: 1; duration: 500 }
                        property alias xx: xx1
                        property alias xy: xy1
                        property alias yx: yx1
                        property alias yy: yy1
                        PropertyAction {id: xx1}
                        PauseAnimation {id: xy1 } // Wait for 500 ms
                        PropertyAction {id: yx1 } // Instantly change opacity to 1
                        PauseAnimation {id: yy1 } // Wait for 500 ms
                    }
        }

}
}
}}
}
