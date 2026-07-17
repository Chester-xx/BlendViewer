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
        anchors.fill: parent

        property color topC: Properties.viewPortLightColor
        property color bottomC: Properties.viewPortDarkColor
        property color gridColor: Properties.border
        property real gridSize: 0.04
        property real aspectRatio: width / height

        fragmentShader: "qrc:/shaders/viewport.frag.qsb"
    }
    // - Fragment Shader

    // Overlay
    // - Overlay

}
// - Viewport Placeholder