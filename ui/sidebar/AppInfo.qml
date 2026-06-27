import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

import BlendViewer

// App Info
Rectangle
{
    id: appInfo

    height: Properties.baseComponentH
    color: Properties.tertiaryBackground

    anchors
    {
        top: parent.top
        left: parent.left
        right: parent.right
    }

    Column
    {
        id: textColumn

        width: appInfo.width - settingsButtonReservedWidth - Properties.marginXS
        spacing: 2

        anchors
        {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }

        // Studio Heading
        Text
        {
            text: qsTr("glTF Studio")
            leftPadding: Properties.marginM
            width: parent.width
            font.pixelSize: Properties.fontTitle
            font.bold: true
            color: Properties.textPrimary
            elide: Text.ElideRight
        }
        // - Studio Heading

        // Version Heading
        Text
        {
            text: qsTr(Properties.version)
            leftPadding: Properties.marginM
            width: parent.width
            font.pixelSize: Properties.fontSub
            color: Properties.textSecondary
            elide: Text.ElideRight
        }
        // - Version Heading
    }
    // - Text Column

    readonly property real settingsButtonReservedWidth: Math.max(30, Properties.baseComponentH * 0.6) + Properties.marginS

    // Settings Button
    RoundButton
    {
        id: settingsButton

        property color settingsIconColor: settingsButton.pressed ? Properties.lightButtonPressed : settingsButton.hovered ? Properties.textPrimary : Properties.textSecondary

        flat: true
        scale: settingsButton.pressed ? 0.92 : 1.0
        icon.source: Properties.iconSource + "settings.svg"
        icon.width: width * 0.5
        icon.height: height * 0.5
        icon.color: settingsIconColor

        width: Math.max(30, Properties.baseComponentH * 0.6)
        height: width

        anchors
        {
            right: parent.right
            rightMargin: Properties.marginS
            verticalCenter: parent.verticalCenter
        }

        // Remove Button Background
        background: Rectangle
        {
            color: "transparent"
            radius: Properties.radiusL
        }
        // - Remove Button Background

        // Icon Color Property

        // Icon Color Effect
        Behavior on settingsIconColor
        {
            ColorAnimation
            {
                duration: 150
                easing.type: Easing.InOutQuad
            }
        }
        // - Icon Color Effect

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

        ToolTip
        {
            visible: settingsButton.hovered
            text: qsTr("Open Settings Menu")
            delay: Properties.tooltipDelay
            timeout: Properties.tooltipTimeout
        }
    }
    // - Settings Button

    // Bottom Side Border
    Rectangle
    {
        id: appInfoBottomBorder

        color: Properties.border
        height: 1

        anchors
        {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    }
    // - Bottom Side Border

    // Right Side Border
    Rectangle
    {
        id: appInfoRightBorder

        color: Properties.border
        width: 1

        anchors
        {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }
    }
    // - Right Side Border
}
// - App Info