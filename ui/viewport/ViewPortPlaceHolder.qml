import QtQuick
import BlendViewer

// Viewport Placeholder
Item 
{
    id: viewPortPlaceHolder
    
    anchors.fill: parent

    // Drawing
    Canvas 
    {
        anchors.fill: parent

        Component.onCompleted: requestPaint()

        // Event
        onPaint: 
        {
            var ctx = getContext("2d")
            var grad = ctx.createLinearGradient(0, 0, 0, height)
            var step = 40

            ctx.fillStyle = grad
            ctx.strokeStyle = "#7aa2f7"
            ctx.lineWidth = 0.3
            ctx.globalAlpha = 0.04

            grad.addColorStop(1.0, Properties.viewPortDarkColor)
            grad.addColorStop(0.0, "#1a2233")
            ctx.fillRect(0, 0, width, height)
            
            for (var x = 0; x < width; x += step) 
            {
                ctx.beginPath(); ctx.moveTo(x, 0); ctx.lineTo(x, height); ctx.stroke()
            }
            
            for (var y = 0; y < height; y += step) 
            {
                ctx.beginPath(); ctx.moveTo(0, y); ctx.lineTo(width, y); ctx.stroke()
            }
        }
        // Event 
    }
    // - Drawing
}
// - Viewport Placeholder