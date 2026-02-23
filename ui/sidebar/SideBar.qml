import QtQuick
import QtQuick.Controls.Basic
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
    width: Math.max(parent.width * 1 / 8, 200)
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
                    color: "#94A3B8"
                }
                // - Version Heading
            }
            // - Text Column

            // Settings Column
            RoundButton
            {
                id: settingsButton
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
                    delay: 500
                    timeout: 3000
                }
                flat: true
                icon.source: "qrc:/qt/qml/BlendViewer/assets/icons/settings.svg"
                icon.color: "#94A3B8"
                icon.width: appInfo.height * 3 / 8
                icon.height: appInfo.height * 3 / 8
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

    // Import File Button
    Button
    {
        id: importFileButton
        flat: true
        anchors
        {
            top: appInfo.bottom
            horizontalCenter: parent.horizontalCenter
            topMargin: parent.height * 1 / 100
        }
        ToolTip
        {
            visible: importFileButton.hovered
            text: qsTr("Import a glTF model file into the viewer")
            delay: 500
            timeout: 3000
        }
        width: parent.width * 9 / 10
        height: parent.height * 1 / 30
        scale: importFileButton.pressed ? 0.98 : 1

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
        background:
        Rectangle
        {
            color: importFileButton.pressed ? "#1A52C7" : importFileButton.hovered ? "#2563EB" : "#137FEC"
            radius: 7
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
                    source: "qrc:/qt/qml/BlendViewer/assets/icons/import.svg"
                    width: importFileButton.height * 7 / 12
                    height: importFileButton.height * 7 / 12
                    anchors
                    {
                        verticalCenter: parent.verticalCenter
                    }
                    fillMode: Image.PreserveAspectFit
                    mipmap: true
                }
                // - Icon

                // Label
                Text
                {
                    text: qsTr("Import glTF Model")
                    font.pixelSize: importFileButton.height * 1 / 3
                    font.bold: true
                    color: "#ffffff"
                    anchors
                    {
                        verticalCenter: parent.verticalCenter
                    }
                }
                // - Label
            }
            // - Collection of Icon and Text
        }
        // - Button Label
    }
    // - Import File Button

    Text
    {
        text: qsTr("Drag & Drop .glTF or .glb Files")
        anchors
        {
            top: importFileButton.bottom
            horizontalCenter: parent.horizontalCenter
        }
        font.pixelSize: parent.height * 1 / 120
        topPadding: 10
        color: "#94A3B8"
    }

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

        // Rows Container
        Column
        {
            id: cameraSpeedRows
            anchors
            {
                centerIn: parent
            }
            width: parent.width * 9 / 10
            height: parent.height * 8 / 10

            // Label Container
            Row
            {
                id: cameraSpeedRow1
                width: parent.width
                height: parent.height * 1 / 3

                // Icon
                Image
                {
                    id: cameraSpeedIcon
                    source: "qrc:/qt/qml/BlendViewer/assets/icons/camera-speed.svg"
                    width: height
                    height: parent.height
                }
                // - Icon

                // Text
                Text
                {
                    id: cameraSpeedLabel
                    anchors.verticalCenter: parent.verticalCenter
                    text: qsTr("Camera Speed")
                    color: "#94A3B8"
                    font.pixelSize: parent.height * 6 / 10
                    leftPadding: 3
                }
                // - Text

                // Spacer
                Item
                {
                    id: cameraSpeedSpacer
                    width: parent.width - cameraSpeedIcon.width - cameraSpeedLabel.width - cameraSpeedValue.width
                    height: parent.height
                }
                // - Spacer

                // Speed Value
                Text
                {
                    id: cameraSpeedValue
                    anchors.verticalCenter: parent.verticalCenter
                    text: cameraSpeedSlider.value.toFixed(1) + "x"
                    color: "#94A3B8"
                    font.pixelSize: parent.height * 6 / 10
                }
                // - Speed Value
            }
            // - Label Container

            // Speed Slider
                Rectangle
                {
                    id: cameraSpeedRow2
                    width: parent.width
                    height: parent.height * 2 / 3
                    color: "transparent"

                    // Speed Slider
                    Slider
                    {
                        id: cameraSpeedSlider
                        from: 0.1
                        to: 5.0
                        value: 1.0
                        width: parent.width
                        height: parent.height

                        // Track
                        background: Rectangle
                        {
                            x: cameraSpeedSlider.leftPadding
                            y: cameraSpeedSlider.topPadding + cameraSpeedSlider.availableHeight / 2 - height / 2
                            width: cameraSpeedSlider.availableWidth
                            height: 4
                            radius: 2
                            color: "#2A3B4F"

                            // Filled Portion
                            Rectangle
                            {
                                width: cameraSpeedSlider.visualPosition * parent.width
                                height: parent.height
                                radius: 2
                                color: "#94A3B8"
                            }
                            // - Filled Portion
                        }
                        // - Track

                        // Handle
                        handle: Rectangle
                        {
                            x: cameraSpeedSlider.leftPadding + cameraSpeedSlider.visualPosition * (cameraSpeedSlider.availableWidth - width)
                            y: cameraSpeedSlider.topPadding + cameraSpeedSlider.availableHeight / 2 - height / 2
                            width: 16
                            height: 16
                            radius: 8
                            color: cameraSpeedSlider.pressed ? "#1A52C7" : cameraSpeedSlider.hovered ? "#2563EB" : "#137FEC"
                            border.color: cameraSpeedSlider.pressed ? "#1A52C7" : cameraSpeedSlider.hovered ? "#2563EB" : "#137FEC"
                            border.width: 1
                        }
                        // - Handle
                    }
                    // - Speed Slider
                }
                // - Speed Slider
        }
        // - Rows Container

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