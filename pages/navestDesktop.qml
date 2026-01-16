pragma ComponentBehavior: Bound
pragma Singleton
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
    //anchors.fill: parent
    Layout.fillWidth: true
    Layout.fillHeight: true
    property string pageName: "Informace o návěsti: " + nid
    property string myString: znd.xbarva()
    property variant stringList: myString.split(';')
    property string nid: ""

    Component.onCompleted: {
        console.log("Mám nid:", nid)
        ostnavd()
        }
    ComboBoxHandler {
        id: handler
    }
    function ostnavd()
    {
        ond.vypisdata(nid)
        text7.text = ond.xnazev()
        text8.text = ond.xnavestidlo()
        text9.text = ond.xpopis()
        console.log("Received data:", ond.xico())
        var ico = ond.xico()
        xico1.source = "qrc:/images/navesti/"+ico+".png"
        if(ond.xden() != "null" && ond.xnoc() != "null")
        {
            xico1.source = "qrc:/images/navesti/"+ond.xden()+".png"
            xico2.source = "qrc:/images/navesti/"+ond.xnoc()+".png"
            dennadpis.text = "Denní návěst:"
            dennadpis.visible = true
            nocnadpis.text = "Noční návěst:"
            nocnadpis.visible = true
        }
        if(ond.xvyh() == "y")
        {
            xico1.source = "qrc:/images/vyhybky/"+ond.xico()+".png"
            xico2.source = "qrc:/images/vyhplan/"+ond.xvyhplan()+".png"
        }
        if(ond.xsamovratnav() == "y")
        {
            xico1.visible = false
            xico2.visible = false
            samovratcont.visible = true
            samovrat.blikej(ond.xblik())
            if (nid == "24")
            {
                samovrat2.visible = true
            }
        }
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
                                onClicked: stackView.push("ostnav.qml")
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
                            text: qsTr("Popis návěsti")
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
                    y: 60
                    width: root.width
                    //Layout.fillWidth: true}
            Rectangle{
                //Layout.fillHeight: true
                width: root.width
            RowLayout {
                        anchors.fill: parent
                        //width: root.width
                        spacing: 0
                Rectangle {
                                id:xs
                            Layout.preferredWidth: parent.width / 2
                            Layout.fillHeight: true
                                Rectangle{
                                    //y:
                                    width: parent.width
                                    //height: parent.height
                                    anchors.centerIn: parent
                                    Text {
                                        y: 10
                                        visible: false
                                        width: parent.width
                                        height: 30
                                        id: dennadpis
                                        text: qsTr("Denní návěst:")
                                        color: vzhledAplikace.textc
                                        font.pixelSize: 15
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                                    Image {
                                        id: xico1
                                        width: 250
                                        height: 120
                                        fillMode: Image.PreserveAspectFit

                                        anchors.horizontalCenter: parent.horizontalCenter  // horizontálně vycentrované
                                        y: 40  // vertikální pozice zůstává
                                    }
                                    Text {
                                        visible: false
                                        y: 170
                                        width: parent.width
                                        height: 30
                                        id: nocnadpis
                                        text: qsTr("Noční návěst:")
                                        color: vzhledAplikace.textc
                                        font.pixelSize: 15
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                    }
                               /* Image {
                                        y: 170
                                       id: xico2
                                        width: 250
                                       //width: parent.width
                                       height: 240
                                       fillMode: Image.PreserveAspectFit
                                       horizontalAlignment: Text.AlignHCenter
                                }*/
                                    Image {
                                        id: xico2
                                        width: 250
                                        height: 240
                                        fillMode: Image.PreserveAspectFit

                                        anchors.horizontalCenter: parent.horizontalCenter  // horizontálně vycentrované
                                        y: 200  // vertikální pozice zůstává
                                    }
                                Rectangle{
                                    id: samovratcont
                                    width: 160
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    visible: false
                                    Rectangle{
                                        id: samovrat
                                        y: 40
                                        width: 70
                                        height: 150
                                        color: "#303030"
                                        border.color: "#7d7d7d"
                                        border.width: 3
                                        radius: 10
                                        property var idMap: ({ s1: nx1, s2: nx2 })
                                            function stopblikej(barva, tempo){
                                                seq1.stop()
                                                for (var key in idMap) {
                                                           idMap[key].visible = false;
                                                        idMap[key].opacity = 1;
                                                       }
                                                var item = findItemById(barva);
                                                if (item) item.visible = true;
                                            }
                                            function findItemById(id) {
                                                return idMap[id];
                                            }
                                            function blikej(barva){
                                                var a = ""
                                                var item = findItemById(barva);
                                                if (item) item.visible = true;
                                                /*if (tempo == "pomalu")
                                                {
                                                    a = 900
                                                }
                                                if (tempo == "rychle")
                                                {
                                                    a = 450
                                                }*/
                                                seq.xx.targets = [item]
                                                seq.xx.property = "opacity"
                                                seq.xx.value = 0
                                                //seq.xy.targets = [item]
                                                seq.xy.duration = 900
                                                seq.yx.targets = [item]
                                                seq.yx.property = "opacity"
                                                seq.yx.value = 1
                                                //seq.yy.targets = [item]
                                                seq.yy.duration = 70
                                                seq.start()
                                            }
                                        Rectangle{
                                                y:10
                                                x:3
                                                width: 64
                                                height: 130
                                                color: "#303030"
                                                border.color: "#FFFF00"
                                                border.width: 5
                                                Rectangle{
                                                    width: 40
                                                    objectName: "x6"
                                                    id: nx1
                                                    height: 40
                                                    x: 12
                                                    y: 15
                                                    radius: 45
                                                    color: "#ff0000"
                                                    visible: false
                                                }
                                                Rectangle{
                                                    width: 40
                                                    objectName: "x5"
                                                    id: nx2
                                                    height: 40
                                                    x: 12
                                                    y: 75
                                                    radius: 45
                                                    color: "#ffffff"
                                                    visible: false
                                                }
                                        }
                                }
                                        Rectangle{
                                            id: samovrat2
                                            x: 90
                                            y: 40
                                            width: 70
                                            height: 150
                                            color: "#303030"
                                            border.color: "#7d7d7d"
                                            border.width: 3
                                            radius: 10
                                            visible: false
                                            Rectangle{
                                                    y:10
                                                    x:3
                                                    width: 64
                                                    height: 130
                                                    color: "#303030"
                                                    border.color: "#FFFF00"
                                                    border.width: 5
                                            }
                                    }}



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
                        x: 8
                        y: 70
                        text: qsTr("Návěstidlo:")
                        font.pixelSize: 15
                        font.bold: true
                        color: vzhledAplikace.textc
                    }
                    Rectangle{
                        x: 8
                        width: parent.width - 15
                        height: 30
                        y: 95
                        color: vzhledAplikace.headbg
                        Text {
                            id: text8
                            text: "---------"
                            height: parent.height
                            font.pixelSize: 15
                            verticalAlignment: Text.AlignVCenter
                            padding: 5
                            color: vzhledAplikace.textc
                        }
                    }


                       Text {
                           x: 8
                           y: 130
                           font.pixelSize: 15
                           text: "Význam návěsti:"
                        font.bold: true
                                color: vzhledAplikace.textc
                       }
                        Rectangle{
                        x: 8
                        y: 155
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
                SequentialAnimation {
                     id: seq
                        loops: Animation.Infinite
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
}}
