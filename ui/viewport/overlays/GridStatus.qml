import QtQuick
import QtQuick.Controls.Basic

import BlendViewer

// Grid Status Indicator
Rectangle
{
	id: gridStatus

    width: gridStatusContainer.implicitWidth + Properties.marginM
    height: Properties.baseComponentH / 2.5
	color: Properties.tertiaryBackground

	radius: width / 20

	border.color: Properties.border
	border.width: 1

	anchors
	{
		top: parent.top
		left: parent.left

		leftMargin: displayStatus.width + Properties.marginS * 2
        topMargin: Properties.marginS
	}

	ToolTip
    {
        visible: gridStatus.hovered
        text: qsTr("Toggle grid status")
        delay: Properties.tooltipDelay
        timeout: Properties.tooltipTimeout
    }

    // Container
    Row
    {
        id: gridStatusContainer

		spacing: Properties.fontS / 2

		anchors.centerIn: parent

		// Indicator
		Image
		{
			id: gridStatusIcon

			source: Properties.iconSource + "grid.svg"
			width: Properties.fontM
			height: width
			fillMode: Image.PreserveAspectFit
			mipmap: true

			anchors.verticalCenter: parent.verticalCenter
		}
		// - Indicator

		// Active Environment Text
		Text
		{
			id: gridStatusText

			text: qsTr("Grid: On")
			font.pixelSize: Properties.fontM
			color: Properties.textSecondary

			anchors.verticalCenter: parent.verticalCenter
		}
		// - Active Environment Text

    }
    // - Container

}
// - Grid Status Indicator