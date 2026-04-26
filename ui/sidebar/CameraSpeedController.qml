import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

import BlendViewer

// Camera Speed Controller
Rectangle
{
    id: cameraSpeed

    height: Properties.baseComponentH
    color: Properties.tertiaryBackground

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

                source: Properties.iconSource + "camera-speed.svg"
                width: Properties.fontL * 1.5
                height: width
            }
            // - Icon

            // Text
            Text
            {
                id: cameraSpeedLabel

                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Camera Speed")
                color: Properties.textSecondary
                font.pixelSize: Properties.fontL
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
                color: Properties.textSecondary
                font.pixelSize: Properties.fontL
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
                    delay: Properties.tooltipDelay
                    timeout: Properties.tooltipTimeout
                }

                // Track
                background: Rectangle
                {
                    id: cameraSpeedSliderTrack

                    x: 0
                    y: cameraSpeedSlider.topPadding + cameraSpeedSlider.availableHeight / 2 - height / 2
                    width: cameraSpeedSlider.width
                    height: Properties.sliderComponent
                    radius: Properties.radiusS
                    color: Properties.border

                    // Filled Portion
                    Rectangle
                    {
                        width: cameraSpeedSlider.visualPosition * parent.width
                        height: parent.height
                        radius: Properties.radiusS
                        color: Properties.button
                    }
                    // - Filled Portion
                }
                // - Track

                // Handle
                handle: Rectangle
                {
                    x: cameraSpeedSlider.visualPosition * (cameraSpeedSlider.width - width)
                    y: cameraSpeedSlider.topPadding + cameraSpeedSlider.availableHeight / 2 - height / 2
                    width: cameraSpeedSliderTrack.height * 4
                    height: cameraSpeedSliderTrack.height * 4
                    radius: Properties.radiusL
                    color: cameraSpeedSlider.pressed ? Properties.buttonPressed : cameraSpeedSlider.hovered ? Properties.buttonHover : Properties.button
                    border.color: cameraSpeedSlider.pressed ? Properties.buttonPressed : cameraSpeedSlider.hovered ? Properties.buttonHover : Properties.button
                    border.width: 1
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

        color: Properties.border
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
        id: cameraSpeedRightBorder

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
// - Camera Speed Controller