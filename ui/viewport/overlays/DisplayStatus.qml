import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Controls.impl

import BlendViewer

// Display Status Indicator
Rectangle
{
	id: displayStatus

	x: Properties.marginS
	y: Properties.marginS

    width: displayStatusIndicator.implicitWidth + Properties.marginM
    height: Properties.baseComponentH / 3
	color: Properties.tertiaryBackground

	anchors
	{
		top: parent.top
		left: parent.left

		leftMargin: Properties.marginS
        rightMargin: Properties.marginS
	}

	ToolTip
    {
        visible: displayStatus.hovered
        text: qsTr("Render loading and application loading status")
        delay: Properties.tooltipDelay
        timeout: Properties.tooltipTimeout
    }

    // Container
    Row
    {
        id: displayStatusIndicator

		spacing: Properties.fontS / 2

        y: (parent.height - height) / 2
		x: parent.width - implicitWidth

		anchors.centerIn: parent

		// Indicator
		IconImage
		{
			id: displayStatusIndicatorIcon

			source: Properties.iconSource + "dot.svg"
			width: Properties.fontM
			height: width
			sourceSize.width: width
			sourceSize.height: width
			fillMode: Image.PreserveAspectFit
			mipmap: true
			color: Properties.greenOffIndicator

			anchors.verticalCenter: parent.verticalCenter

			// Color effect
			SequentialAnimation on color
			{
				running: true
				loops: Animation.Infinite

				// From
				ColorAnimation
				{
					from: Properties.greenOffIndicator
					to: Properties.greenOnIndicator
					duration: 1000
					easing.type: Easing.InOutSine
				}
				// - From

				// To
				ColorAnimation
				{
					from: Properties.greenOnIndicator
					to: Properties.greenOffIndicator
					duration: 1000
					easing.type: Easing.InOutSine
				}
				// - To
			}
			// - Color effect
		}
		// - Indicator

		// Active Environment Text
		Text
		{
			id: displayStatusText

			text: qsTr("Ready")
			font.pixelSize: Properties.fontM
			color: Properties.textSecondary

			anchors.verticalCenter: parent.verticalCenter
		}
		// - Active Environment Text

    }
    // - Container

}
// - Display Status Indicator