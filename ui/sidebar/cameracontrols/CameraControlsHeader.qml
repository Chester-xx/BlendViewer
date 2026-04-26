import QtQuick
import QtQuick.Layouts

import BlendViewer

// Camera Controls Header
RowLayout
{
    width: parent.width
    Layout.fillWidth: true
    Layout.topMargin: Properties.marginXS
    Layout.leftMargin: Properties.marginM
    Layout.rightMargin: Properties.marginM

    // Section Label
    Text
    {
        text: qsTr("CAMERA CONTROLS")
        font.pixelSize: Properties.fontL
        font.bold: true
        color: Properties.textPrimary
        Layout.alignment: Qt.AlignLeft
    }
    // - Section Label

    // Spacer
    Item 
    {
        Layout.fillWidth: true 
    }
    // - Spacer

    // Camera Controls Reset Button
    Text
    {
        id: resetCameraControls

        property bool hovered: false

        text: qsTr("Reset")
        font.pixelSize: Properties.fontM
        color: resetMouseArea.pressed ? Properties.lightButtonPressed : hovered ? Properties.lightButtonHover : Properties.lightButton
        scale: resetMouseArea.pressed ? 0.92 : 1.0
        Layout.alignment: Qt.AlignRight

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
            onClicked: 
            {
                
            }
        }
        // - Click Effects
    }
    // - Camera Controls Reset Button
}
// - Camera Controls Header