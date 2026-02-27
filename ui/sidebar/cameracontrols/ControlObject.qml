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

	Layout.fillWidth: true
	Layout.preferredHeight: sideBar.height * 1 / 20
	Layout.leftMargin: sideBar.width * 1 / 20
	Layout.rightMargin: sideBar.width * 1 / 20

	color: "transparent"

	// Heading | Label | Value Box
	RowLayout
	{
		id: sliderHeading

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

			Layout.preferredWidth: valueRow.implicitWidth + (sideBar.width * 1 / 20)
			Layout.preferredHeight: parent.height * 7 / 10
			Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

			color: Properties.tertiaryBackground
			radius: 4

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

			// Value & Unit Row
			Row
			{
				id: valueRow
				anchors.centerIn: parent
				spacing: 2

				// Value Input
				TextInput
				{
					id: valueInput

					anchors.verticalCenter: parent.verticalCenter
					text: controlObject.value.toFixed(1)
					color: Properties.textPrimary
					font.pixelSize: sideBar.height * 1 / 120
					horizontalAlignment: Text.AlignHCenter
					clip: true

					validator: RegularExpressionValidator
					{
						regularExpression: /^-?\d*[.,]?\d*$/
					}

					onTextEdited:
					{
						var normalized = text.replace(",", ".")
						var num = parseFloat(normalized)
						if (!isNaN(num) && num >= controlObject.minValue && num <= controlObject.maxValue)
						{
							controlObject.value = num
							slider.value = num
						}
					}

					onEditingFinished:
					{
						var normalized = text.replace(",", ".")
						var num = parseFloat(normalized)
						if (isNaN(num)) num = controlObject.minValue
						controlObject.value = Math.min(Math.max(num, controlObject.minValue), controlObject.maxValue)
						slider.value = controlObject.value
						text = controlObject.value.toFixed(1)
						focus = false
					}

					Connections
					{
						target: controlObject
						function onValueChanged()
						{
							if (!valueInput.activeFocus)
								valueInput.text = controlObject.value.toFixed(1)
						}
					}
				}
				// - Value Input

				// Unit Label
				Text
				{
					id: unitLabel
					anchors.verticalCenter: parent.verticalCenter
					text: controlObject.unit
					color: Properties.textPrimary
					font.pixelSize: sideBar.height * 1 / 120
				}
				// - Unit Label
			}
			// - Value & Unit Row

			// Validation Tooltip
			ToolTip
			{
				id: validationTooltip
				visible: valueInput.activeFocus && (isNaN(parseFloat(valueInput.text.replace(",", "."))) && valueInput.text !== "" && valueInput.text !== "-")
				text: {
					var num = parseFloat(valueInput.text.replace(",", "."))
					if (valueInput.text === "" || isNaN(num))
						return qsTr("Please enter a valid number")
					if (num < controlObject.minValue)
						return qsTr("Minimum value is " + controlObject.minValue + controlObject.unit)
					if (num > controlObject.maxValue)
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
	// - Heading

	// Value Slider
	Slider
	{
		id: slider

		from: controlObject.minValue
		to: controlObject.maxValue
		value: controlObject.value
		height: parent.height * 1 / 2

		anchors
		{
			top: sliderHeading.bottom
			left: parent.left
			right: parent.right
		}

		onValueChanged:
		{
			if (pressed) controlObject.value = value
		}

		// Track
		background: Rectangle
		{
			id: sliderTrack

			x: slider.leftPadding
			y: slider.topPadding + slider.availableHeight / 2 - height / 2
			width: slider.availableWidth
			height: slider.height * 1 / 8
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
			width: sliderTrack.height * 4
			height: sliderTrack.height * 4
			radius: 20
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