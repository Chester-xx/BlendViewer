import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

import BlendViewer

// App Info
Rectangle
{
    id: appInfo

    height: parent.height * 1 / 17
    color: Properties.tertiaryBackground

    anchors
    {
        top: parent.top
        left: parent.left
        right: parent.right
    }

    // App Info Grid
    RowLayout
    {
        width: parent.width
        height: parent.height
        spacing: 0

        // Text Column
        ColumnLayout
        {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 2

            // Studio Heading
            Text
            {
                text: qsTr("glTF Studio")
                leftPadding: appInfo.width * 1 / 16
                font.pixelSize: appInfo.height * 1 / 4.7
                font.bold: true
                color: Properties.textPrimary
            }
            // - Studio Heading

            // Version Heading
            Text
            {
                text: qsTr("v1.0.0")
                leftPadding: appInfo.width * 1 / 16
                font.pixelSize: appInfo.height * 1 / 6.7
                color: Properties.textSecondary
            }
            // - Version Heading
        }
        // - Text Column

        // Settings Button
        RoundButton
        {
            id: settingsButton

            property color settingsIconColor: settingsButton.pressed ? "#4D84F2" : settingsButton.hovered ? Properties.textPrimary : Properties.textSecondary

            flat: true
            scale: settingsButton.pressed ? 0.92 : 1.0
            icon.source: "qrc:/qt/qml/BlendViewer/assets/icons/settings.svg"
            icon.width: appInfo.height * 3 / 8
            icon.height: appInfo.height * 3 / 8
            icon.color: settingsIconColor

            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.rightMargin: appInfo.width / 16
            Layout.preferredWidth: appInfo.height * 1 / 2
            Layout.preferredHeight: appInfo.height * 1 / 2
            Layout.minimumWidth: 30
            Layout.minimumHeight: 30

            // Remove Button Background
            background: Rectangle
            {
                color: "transparent"
                radius: width / 2
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
                text: qsTr("Open Settings")
                delay: 1000
                timeout: 3000
            }
        }
        // - Settings Button
    }
    // - App Info Grid

    // Bottom Side Border
    Rectangle
    {
        id: appInfoBottomBorder

        color: "#2A3B4F"
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

        color: "#2A3B4F"
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