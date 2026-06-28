import QtQuick
import QtQuick.Layouts

import BlendViewer

// Camera Controls Header
Item
{
    id: cameraControlsHeader

    width: parent.width
    height: Math.max(sectionLabel.implicitHeight, resetCameraControls.implicitHeight)

    Layout.fillWidth: true
    Layout.topMargin: Properties.sectionSpacing
    Layout.leftMargin: Properties.marginM
    Layout.rightMargin: Properties.marginM

    // Section Label
    Text
    {
        id: sectionLabel

        text: qsTr("CAMERA CONTROLS")
        font.pixelSize: Properties.fontL
        font.bold: true
        color: Properties.textPrimary
        elide: Text.ElideRight

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: resetCameraControls.left
        anchors.rightMargin: Properties.marginS
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

        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right

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