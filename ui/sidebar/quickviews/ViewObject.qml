import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Controls.impl
import QtQuick.Layouts

import BlendViewer

// View Object
Rectangle
{
	id: viewObject

	property string label: "View"
	property string icon: ""
	signal selected()

	Layout.fillWidth: true
	Layout.preferredHeight: width

	color: Properties.controlBackground
	radius: 7

	border
	{
		width: 1
		color: mouseArea.pressed ? Properties.buttonHover : mouseArea.containsMouse ? Properties.button : Properties.border

		Behavior on color
		{
			ColorAnimation
			{
				duration: 150
				easing.type: Easing.InOutQuad
			}
		}
	}

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

	// Content
	Column
	{
		anchors.centerIn: parent
		spacing: 4

		// Icon
		IconImage
		{
			source: Properties.iconSource + viewObject.icon
			width: viewObject.width * 1 / 3
			height: viewObject.width * 1 / 3
			sourceSize.width: viewObject.width * 1 / 3
			sourceSize.height: viewObject.width * 1 / 3
			fillMode: Image.PreserveAspectFit
			mipmap: true
			anchors.horizontalCenter: parent.horizontalCenter
			color: mouseArea.pressed ? Properties.buttonHover : mouseArea.containsMouse ? Properties.button : Properties.border

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

		// Label
		Text
		{
			text: viewObject.label
			font.pixelSize: viewObject.width * 1 / 7
			color: mouseArea.pressed ? Properties.buttonHover : mouseArea.containsMouse ? Properties.button : Properties.textPrimary
			anchors.horizontalCenter: parent.horizontalCenter

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
		}
		// - Label
	}
	// - Content

	// Mouse Area
	MouseArea
	{
		id: mouseArea
		anchors.fill: parent
		hoverEnabled: true
		cursorShape: Qt.PointingHandCursor
		onClicked: viewObject.selected()
	}
	// - Mouse Area

	ToolTip
	{
		visible: mouseArea.containsMouse
		text: qsTr("Switch to " + viewObject.label + " view")
		delay: 1000
		timeout: 3000
	}
}
// - View Object