import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.impl

import BlendViewer

// Environments Header
RowLayout
{
    id: environmentsHeader

    width: parent.width
    Layout.fillWidth: true
    Layout.topMargin: Properties.marginM
    Layout.leftMargin: Properties.marginM
    Layout.rightMargin: Properties.marginM

    // Section Label
    Text
    {
        text: qsTr("ENVIRONMENT")
        font.pixelSize: Properties.fontL
        font.bold: true
        color: Properties.textPrimary
        Layout.alignment: Qt.AlignLeft
    }
    // - Section Label

    // Spacer
    Item 
    {
        Layout.fillWidth: true 
    }
    // - Spacer

    // Active Environment Indicator
	RowLayout
	{
		spacing: Properties.fontS / 2
		Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

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

			Layout.alignment: Qt.AlignVCenter

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

			Layout.alignment: Qt.AlignVCenter
		}
		// - Active Environment Text
	}
	// - Active Environment Indicator
}
// - Environments Header