import QtQuick
import BlendViewer

// Viewport Placeholder
Item 
{
    id: viewPortPlaceHolder
    
    anchors.fill: parent

    Rectangle
    {
        anchors.fill: parent

        gradient: Gradient
        {
            orientation: Gradient.Vertical

            GradientStop
            {
                position: 0
                color: Properties.viewPortLightColor
            }
            GradientStop
            {
                position: 1
                color: Properties.viewPortDarkColor
            }
        }
    }



    /*
    for (var x = 0; x < width; x += step) 
    {
        ctx.beginPath(); ctx.moveTo(x, 0); ctx.lineTo(x, height); ctx.stroke()
    }
            
    for (var y = 0; y < height; y += step) 
    {
        ctx.beginPath(); ctx.moveTo(0, y); ctx.lineTo(width, y); ctx.stroke()
    } */



}
// - Viewport Placeholder