import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

import BlendViewer

// Control Object
Rectangle
{
    id: controlObject

    property string label: "Label"
    property real value: 0.0
    property real minValue: 0.0
    property real maxValue: 100.0
    property string unit: "°"
    property bool sliderDragging: false
    property bool initializeValues: true

    Layout.fillWidth: true
    Layout.preferredHeight: sideBar.height * 1 / 20
    Layout.leftMargin: sideBar.width * 1 / 20
    Layout.rightMargin: sideBar.width * 1 / 20

    color: "transparent"


    // REWRITE valueBox TO LAY VALUE AND UNIT HORIZONTALLY, WITHIN THE RECTANGLE, ALIGN BOX CORRECTLY
    // Row 1 | Label | Value Box
    RowLayout
    {
        id: sliderRow1

        width: parent.width
        height: parent.height * 1 / 2
        spacing: 0

        // Label
        Text
        {
            text: controlObject.label
            font.pixelSize: sideBar.height * 1 / 100
            color: Properties.textPrimary
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        }
        // - Label

        // Spacer
        Item
        {
            Layout.fillWidth: true
        }
        // - Spacer

        // Value Box
        Rectangle
        {
            id: valueBox

            height: parent.height * 7 / 10
            color: Properties.tertiaryBackground
            radius: 4

            // sideBar.width * 1 / 5
            Layout.preferredWidth: valueInput.contentWidth + unitLabel.contentWidth + sideBar.width * 1 / 10
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

            border
            {
                width: 1
                color: valueInput.activeFocus ? Properties.button : Properties.border
            }

            // Border Focus Effect
            Behavior on border.color
            {
                ColorAnimation
                {
                    duration: 150
                    easing.type: Easing.InOutQuad
                }
            }
            // - Border Focus Effect

            // Value Input
            TextInput
            {
                id: valueInput

                anchors.centerIn: parent

                text: {
                    if (controlObject.initializeValues) {
                        controlObject.initializeValues = false
                        return controlObject.value
                    } else {
                        return controlObject.sliderDragging ? controlObject.value.toFixed(1) : text
                    }
                }
                
                color: Properties.textPrimary
                font.pixelSize: sideBar.height * 1 / 120
                horizontalAlignment: Text.AlignHCenter
                clip: true

                validator: DoubleValidator
                {
                    bottom: controlObject.minValue
                    top: controlObject.maxValue
                    decimals: 1
                    notation: DoubleValidator.StandardNotation
                }

                onEditingFinished:
                {
                    if (controlObject.sliderDragging) return
                    var clamped = Math.min(Math.max(parseFloat(text), controlObject.minValue), controlObject.maxValue)
                    controlObject.value = clamped
                    slider.value = clamped
                    text = clamped.toFixed(1)
                    focus = false
                }
            }
            // - Value Input

            // Trailing Unit Label
            Text
            {
                id: unitLabel

                text: controlObject.unit
                color: Properties.textPrimary
                font.pixelSize: sideBar.height * 1 / 120
                
                anchors
                {
                    left: valueInput.right
                    right: parent.right
                    rightMargin: 4
                    leftMargin: 2
                    verticalCenter: parent.verticalCenter
                }
            }
            // - Trailing Unit Label

            // Validation Tooltip
            ToolTip
            {
                id: validationTooltip
                visible: valueInput.activeFocus && !valueInput.acceptableInput
                text: {
                    var input = parseFloat(valueInput.text)
                    if (valueInput.text === "" || isNaN(input))
                        return qsTr("Please enter a valid number")
                    if (input < controlObject.minValue)
                        return qsTr("Minimum value is " + controlObject.minValue + controlObject.unit)
                    if (input > controlObject.maxValue)
                        return qsTr("Maximum value is " + controlObject.maxValue + controlObject.unit)
                    return qsTr("Invalid input")
                }
                delay: 500
                timeout: -1
            }
            // - Validation Tooltip
        }
        // - Value Box
    }
    // - Row 1

    // Value Slider
    Slider
    {
        id: slider

        from: controlObject.minValue
        to: controlObject.maxValue
        value: controlObject.value

        anchors
        {
            top: sliderRow1.bottom
            left: parent.left
            right: parent.right
        }
        height: parent.height * 1 / 2

        onPressedChanged: controlObject.sliderDragging = pressed

        onValueChanged:
        {
            if (pressed) controlObject.value = value
        }

        // Track
        background: Rectangle
        {
            x: slider.leftPadding
            y: slider.topPadding + slider.availableHeight / 2 - height / 2
            width: slider.availableWidth
            height: 4
            radius: 2
            color: Properties.border

            // Filled Portion
            Rectangle
            {
                width: slider.visualPosition * parent.width
                height: parent.height
                radius: 2
                color: Properties.button
            }
            // - Filled Portion
        }
        // - Track

        // Handle
        handle: Rectangle
        {
            x: slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
            y: slider.topPadding + slider.availableHeight / 2 - height / 2
            width: 14
            height: 14
            radius: 7
            color: slider.pressed ? Properties.buttonPressed : slider.hovered ? Properties.buttonHover : Properties.button
            border.color: slider.pressed ? Properties.buttonPressed : slider.hovered ? Properties.buttonHover : Properties.button

            Behavior on color
            {
                ColorAnimation
                {
                    duration: 150
                    easing.type: Easing.InOutQuad
                }
            }
        }
        // - Handle
    }
    // - Value Slider
}
// - Control Object