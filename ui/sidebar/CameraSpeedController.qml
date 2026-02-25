import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

// Camera Speed Controller
Rectangle
{
    id: cameraSpeed

    height: parent.height * 1 / 17
    color: "#0D141B"

    anchors
    {
        bottom: parent.bottom
        left: parent.left
        right: parent.right
    }

    // Rows Container
    Column
    {
        id: cameraSpeedRows

        width: parent.width * 9 / 10
        height: parent.height * 8 / 10

        anchors
        {
            centerIn: parent
        }

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

                ToolTip
                {
                    visible: cameraSpeedSlider.hovered
                    text: qsTr("Change camera speed")
                    delay: 2000
                    timeout: 3000
                }

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

        color: "#2A3B4F"
        height: 1

        anchors
        {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }
    // - Top Side Border

    // Right Side Border
    Rectangle
    {
        id: cameraSpeefRightBorder

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
// - Camera Speed Controller