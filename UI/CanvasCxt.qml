import QtQuick 2.0

Item {
    enabled: false
    Canvas {
        implicitHeight: parent.height
        implicitWidth: parent.width
        onPaint: {
            var ctx = getContext("2d")
            ctx.lineWidth = 1
            ctx.strokeStyle = "#e1e1e2"
            ctx.fillStyle = "#f5f5f7"
            ctx.fillRect(198,49,10,511)
            ctx.beginPath()
            ctx.moveTo(208,50)
            ctx.lineTo(208,561)
            ctx.stroke()
        }
    }
}
