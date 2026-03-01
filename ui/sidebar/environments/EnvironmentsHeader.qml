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
    Layout.topMargin: sideBar.height * 1 / 50
    Layout.leftMargin: sideBar.width * 1 / 20
    Layout.rightMargin: sideBar.width * 1 / 20

    // Section Label
    Text
    {
        text: qsTr("ENVIRONMENT")
        font.pixelSize: sideBar.height * 1 / 100
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
		spacing: environmentActiveText.font.pixelSize * 1 / 4
		Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

		// Environment Active Notifier
		IconImage
		{
			id: environmentActive
			source: Properties.iconSource + "dot.svg"
			width: environmentActiveText.font.pixelSize * 3 / 4
			height: width
			sourceSize.width: width
			sourceSize.height: width
			fillMode: Image.PreserveAspectFit
			mipmap: true
			color: Properties.button

			Layout.rightMargin: width * 1 / 3
			Layout.alignment: Qt.AlignVCenter
		}
		// - Environment Active Notifier

		// Active Environment Text
		Text
		{
			id: environmentActiveText
			text: environments.activeEnv
			font.pixelSize: sideBar.height * 1 / 120
			color: Properties.textSecondary

			Layout.alignment: Qt.AlignVCenter
		}
		// - Active Environment Text
	}
	// - Active Environment Indicator
}
// - Environments Header