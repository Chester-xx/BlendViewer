import QtQuick
import QtQuick.Controls.impl

import BlendViewer

// Viewport Placeholder
Item 
{
    id: viewPortPlaceHolder
    
    anchors.fill: parent

    // Fragment Shader
    ShaderEffect
    {
        id: fragmentShaderPlaceHolder

        anchors.fill: parent

        property color topC: Properties.viewPortLightColor
        property color bottomC: Properties.viewPortDarkColor
        property color gridColor: Properties.border
        property real gridSize: 0.04
        property real aspectRatio: width / height

        fragmentShader: "qrc:/shaders/viewport.frag.qsb"

                

    }
    // - Fragment Shader

    // Overlay Icon
    IconImage
    {
        id: placeholderIcon

        source: Properties.iconSourceViewportPlaceholder + "icon.svg"
        width: Properties.baseComponentW * 4
        // height: 80
        sourceSize.width: Properties.baseComponentW
		// sourceSize.height: Properties.baseComponentH
        mipmap: true
        fillMode: Image.PreserveAspectFit
        color: Properties.textSecondary

        anchors.fill: parent
    }
    // - Overlay

}
// - Viewport Placeholder