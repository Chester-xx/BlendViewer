import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

// App Info
Rectangle
{
    id: appInfo

    height: parent.height * 1 / 17
    color: "#0D141B"

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
                color: "#ffffff"
            }
            // - Studio Heading

            // Version Heading
            Text
            {
                text: qsTr("v1.0.0")
                leftPadding: appInfo.width * 1 / 16
                font.pixelSize: appInfo.height * 1 / 6.7
                color: "#94A3B8"
            }
            // - Version Heading
        }
        // - Text Column

        // Settings Button
        RoundButton
        {
            id: settingsButton

            flat: true
            icon.source: "qrc:/qt/qml/BlendViewer/assets/icons/settings.svg"
            icon.color: "#94A3B8"
            icon.width: appInfo.height * 3 / 8
            icon.height: appInfo.height * 3 / 8

            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.rightMargin: appInfo.width / 16
            Layout.preferredWidth: appInfo.height * 1 / 2
            Layout.preferredHeight: appInfo.height * 1 / 2
            Layout.minimumWidth: 30
            Layout.minimumHeight: 30
            
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