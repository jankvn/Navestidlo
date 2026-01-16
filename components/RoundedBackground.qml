// RoundedBackground.qml
import QtQuick
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

Rectangle {
    id: roundedBackground
    anchors.fill: parent
    color: fillColor
    radius: 0   // výchozí hodnota

    property bool topRounded: false
    property bool bottomRounded: false
    property color fillColor: "transparent"

    layer.enabled: true
    layer.smooth: true
    layer.effect: OpacityMask {
        maskSource: Item {
            width: roundedBackground.width
            height: roundedBackground.height

            Canvas {
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.clearRect(0, 0, width, height)

                    var r = 8  // poloměr zaoblení

                    ctx.beginPath()
                    ctx.moveTo(0, topRounded ? r : 0)

                    if (topRounded) {
                        ctx.arcTo(0, 0, r, 0, r)
                        ctx.arcTo(width, 0, width, r, r)
                    } else {
                        ctx.lineTo(width, 0)
                    }

                    ctx.lineTo(width, height - (bottomRounded ? r : 0))

                    if (bottomRounded) {
                        ctx.arcTo(width, height, width - r, height, r)
                        ctx.arcTo(0, height, 0, height - r, r)
                    } else {
                        ctx.lineTo(0, height)
                    }

                    ctx.closePath()
                    ctx.fillStyle = "white"
                    ctx.fill()
                }
            }
        }
    }
}
