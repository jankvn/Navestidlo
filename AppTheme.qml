import QtQuick

QtObject {
    property color bg: "#FFFFFF"
    property color textc: "#212121"
    property color menubg: "#f5f5f5"
    property color menuheadline: "#424242"
    property color headbg: "#d4d4d4"
    property color buttonbg: "#ffffff"
    property color buttonhover: "#dddddd"

    function svetly(){
        bg = "#FFFFFF"
        textc = "#212121"
        menubg = "#f5f5f5"
        menuheadline = "#424242"
        headbg = "#d4d4d4"
        buttonbg = "#ffffff"
        buttonhover = "#dddddd"
    }
    function tmavy(){
        bg = "#1A1A1A"
        textc = "#ededed"
        menubg = "#242424"
        menuheadline = "#cccbca"
        headbg = "#474747"
        buttonbg = "#000"
        buttonhover = "#6b6b6b"
    }
}
