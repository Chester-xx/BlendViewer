import QtQuick
import QtQuick.Controls.impl

import BlendViewer

// Environments Header
Item
{
    id: environmentsHeader

    x: Properties.marginM
    width: parent.width - Properties.marginM * 2
    height: Math.max(sectionLabel.implicitHeight, activeIndicator.implicitHeight)

    // Section Label
    Text
    {
        id: sectionLabel

        text: qsTr("ENVIRONMENT")
        font.pixelSize: Properties.fontL
        font.bold: true
        color: Properties.textPrimary
        elide: Text.ElideRight

        y: (parent.height - height) / 2
        x: 0
        width: parent.width - activeIndicator.implicitWidth - Properties.marginS
    }
    // - Section Label

    // Active Environment Indicator
	Row
	{
		id: activeIndicator

		spacing: Properties.fontS / 2

		y: (parent.height - height) / 2
		x: parent.width - implicitWidth

		// Environment Active Notifier
		IconImage
		{
			id: environmentActive

			source: Properties.iconSource + "dot.svg"
			width: Properties.fontM
			height: width
			sourceSize.width: width
			sourceSize.height: width
			fillMode: Image.PreserveAspectFit
			mipmap: true
			color: Properties.button

			anchors.verticalCenter: parent.verticalCenter

			// Inactive Environment color effect
			SequentialAnimation on color
			{
				running: true
				loops: Animation.Infinite

				// From
				ColorAnimation
				{
					from: Properties.button
					to: Properties.buttonPressed
					duration: 1000
					easing.type: Easing.InOutSine
				}
				// - From

				// To
				ColorAnimation
				{
					from: Properties.buttonPressed
					to: Properties.button
					duration: 1000
					easing.type: Easing.InOutSine
				}
				// - To
			}
			// - Inactive Environment color effect
		}
		// - Environment Active Notifier

		// Active Environment Text
		Text
		{
			id: environmentActiveText

			text: environments.activeEnv
			font.pixelSize: Properties.fontM
			color: Properties.textSecondary

			anchors.verticalCenter: parent.verticalCenter
		}
		// - Active Environment Text
	}
	// - Active Environment Indicator
}
// - Environments Header