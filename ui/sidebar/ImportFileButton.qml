import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

import BlendViewer

// Import File Button
Button
{
    id: importFileButton

    flat: true
    implicitHeight: Properties.buttonH
    scale: importFileButton.pressed ? 0.98 : 1

    Layout.fillWidth: true
    Layout.alignment: Qt.AlignHCenter

    Layout.topMargin: Properties.marginL
    Layout.bottomMargin: Properties.marginXS

    Layout.leftMargin: Properties.marginM
    Layout.rightMargin: Properties.marginM

    ToolTip
    {
        visible: importFileButton.hovered
        text: qsTr("Import a glTF model file into the viewer")
        delay: Properties.tooltipDelay
        timeout: Properties.tooltipTimeout
    }

    // Scale Effect
    Behavior on scale
    {
        NumberAnimation
        {
            duration: 100
            easing.type: Easing.InOutQuad
        }
    }
    // - Scale Effect

    // Button Background
    background: Rectangle
    {
        color: importFileButton.pressed ? Properties.buttonPressed : importFileButton.hovered ? Properties.buttonHover : Properties.button
        radius: Properties.radiusM
        layer.enabled: true

        // Hover Effect
        Behavior on color
        {
            ColorAnimation
            {
                duration: 150
                easing.type: Easing.InOutQuad
            }
        }
        // - Hover Effect
    }
    // - Button Background

    // Button Label
    contentItem: Item
    {
        opacity: 1

        // Collection of Icon and Text
        Row
        {
            spacing: importFileButton.height * 1 / 10
            anchors.centerIn: parent

            // Icon
            Image
            {
                id: importIcon
                source: Properties.iconSource + "import.svg"
                width: importFileButton.height * 7 / 12
                height: importFileButton.height * 7 / 12
                sourceSize.width: importFileButton.height * 7 / 12
                sourceSize.height: importFileButton.height * 7 / 12
                fillMode: Image.PreserveAspectFit
                mipmap: true
                anchors.verticalCenter: parent.verticalCenter
            }
            // - Icon

            // Label
            Text
            {
                text: qsTr("Import glTF Model")
                font.pixelSize: Properties.fontL
                font.bold: true
                color: Properties.textPrimary
                anchors.verticalCenter: parent.verticalCenter
            }
            // - Label
        }
        // - Collection of Icon and Text
    }
    // - Button Label
}
// - Import File Button