import QtQuick

import BlendViewer

// Camera Controls Header
Item
{
    id: cameraControlsHeader

    x: Properties.marginM
    width: parent.width - Properties.marginM * 2
    height: Math.max(sectionLabel.implicitHeight, resetCameraControls.implicitHeight)

    // Section Label
    Text
    {
        id: sectionLabel

        text: qsTr("CAMERA CONTROLS")
        font.pixelSize: Properties.fontL
        font.bold: true
        color: Properties.textPrimary
        elide: Text.ElideRight

        y: (parent.height - height) / 2
        x: 0
        width: parent.width - resetCameraControls.implicitWidth - Properties.marginS
    }
    // - Section Label

    // Camera Controls Reset Button
    Text
    {
        id: resetCameraControls

        property bool hovered: false

        text: qsTr("Reset")
        font.pixelSize: Properties.fontM
        color: resetMouseArea.pressed ? Properties.lightButtonPressed : hovered ? Properties.lightButtonHover : Properties.lightButton
        scale: resetMouseArea.pressed ? 0.92 : 1.0

        y: (parent.height - height) / 2
        x: parent.width - implicitWidth

        Behavior on color
        {
            ColorAnimation
            {
                duration: 150
                easing.type: Easing.InOutQuad
            }
        }

        Behavior on scale
        {
            NumberAnimation
            {
                duration: 100
                easing.type: Easing.InOutQuad
            }
        }

        // Click Effects
        MouseArea
        {
            id: resetMouseArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onEntered: resetCameraControls.hovered = true
            onExited: resetCameraControls.hovered = false
        }
        // - Click Effects
    }
    // - Camera Controls Reset Button
}
// - Camera Controls Header