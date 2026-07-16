import QtQuick

import BlendViewer

// Viewport Placeholder
Item 
{
    id: viewPortPlaceHolder
    
    anchors.fill: parent

    // Fragment Shader
    ShaderEffect
    {
        property color topC: Properties.viewPortLightColor
        property color bottomC: Properties.viewPortDarkColor
        property color gridColor: Properties.border
        property real gridSize: 0.05
        property real gridThickness: 1.0
        fragmentShader: "qrc:/shaders/viewport.frag.qsb"

    }
    // - Fragment Shader

    // Overlay
    // - Overlay

}
// - Viewport Placeholder