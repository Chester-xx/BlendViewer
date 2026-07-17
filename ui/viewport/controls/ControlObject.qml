import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Controls.impl

import BlendViewer

// Control Object
Rectangle
{

	id: controlObject

	property string tooltip
	property string iconPath
	signal selected()
	
	width: parent.width
	height: width
	
	color: mouseArea.pressed ? Properties.tertiaryBackground : mouseArea.containsMouse ? Properties.primaryBackground : Properties.tertiaryBackground
	radius: width / 10

	// Hover & Press Effect
	Behavior on color
	{
		ColorAnimation
		{
			duration: 150
			easing.type: Easing.InOutQuad
		}
	}
	// - Hover & Press Effect

	// Scale Effect
	scale: mouseArea.pressed ? 0.95 : 1.0

	Behavior on scale
	{
		NumberAnimation
		{
			duration: 100
			easing.type: Easing.InOutQuad
		}
	}
	// - Scale Effect

	// Icon
	IconImage
	{
		source: Properties.iconSourceViewportControls + controlObject.iconPath
		width: controlObject.width * 0.75
		height: width
		sourceSize.width: controlObject.width
		sourceSize.height: controlObject.height
		fillMode: Image.PreserveAspectFit
		mipmap: true
		anchors.centerIn: parent
		color: mouseArea.pressed ? Properties.buttonHover : mouseArea.containsMouse ? Properties.textPrimary : Properties.textSecondary

		Behavior on color
		{
			ColorAnimation
			{
				duration: 150
				easing.type: Easing.InOutQuad
			}
		}

		// Scale Effect
		scale: mouseArea.containsMouse ? 1.05 : 1.0

		Behavior on scale
		{
			NumberAnimation
			{
				duration: 100
				easing.type: Easing.InOutQuad
			}
		}
		// - Scale Effect
	}
	// - Icon

	// Mouse Area
	MouseArea
	{
		id: mouseArea
		anchors.fill: parent
		hoverEnabled: true
		cursorShape: Qt.PointingHandCursor
		onClicked: controlObject.selected()
	}
	// - Mouse Area

	ToolTip
	{
		visible: mouseArea.containsMouse
		text: qsTr(controlObject.tooltip)
		delay: Properties.tooltipDelay
		timeout: Properties.tooltipTimeout
	}

}
// - Control Object