import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// Side Bar
Rectangle
{
    id: sideBar
    anchors
    {
        left: parent.left
        top: parent.top
        bottom: parent.bottom
    }
    width: parent.width * 1 / 8
    height: parent.height
    color: "#111A22"

    // Right Side Border
    Rectangle
    {
        id: sideBarRightBorder
        anchors
        {
            bottom: parent.bottom
            top: parent.top
            right: parent.right
        }
        color: "#2A3B4F"
        width: 1
    }
    // - Right Side Border

    // App Info
    Rectangle
    {
        id: appInfo
        anchors
        {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        height: parent.height * 1 / 17
        color: "#0D141B"

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
                    color: "#888888"
                }
                // - Version Heading
            }
            // - Text Column

            // Settings Column
            RoundButton
            {
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                Layout.rightMargin: appInfo.width / 16
                width: 32
                height: 32
                flat: true
                icon.source: "qrc:/qt/qml/BlendViewer/assets/icons/settings.svg"
                icon.color: "#888888"
            }
            // - Settings Column
        }
        // - App Info Grid

        // Bottom Side Border
        Rectangle
        {
            id: appInfoBottomBorder
            anchors
            {
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }
            color: "#2A3B4F"
            height: 1
        }
        // - Bottom Side Border

        // Right Side Border
        Rectangle
        {
            id: appInfoRightBorder
            anchors
            {
                top: parent.top
                bottom: parent.bottom
                right: parent.right
            }
            color: "#2A3B4F"
            width: 1
        }
        // - Right Side Border

    }
    // - App Info

    // Camera Speed
    Rectangle
    {
        id: cameraSpeed
        anchors
        {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
        height: parent.height * 1 / 17
        color: "#0D141B"

        // Top Side Border
        Rectangle
        {
            id: cameraSpeedTopBorder
            anchors
            {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            color: "#2A3B4F"
            height: 1
        }
        // - Top Side Border

        // Right Side Border
        Rectangle
        {
            id: cameraSpeefRightBorder
            anchors
            {
                top: parent.top
                bottom: parent.bottom
                right: parent.right
            }
            color: "#2A3B4F"
            width: 1
        }
        // - Right Side Border
    }
    // - Camera Speed
}
// - Side Bar