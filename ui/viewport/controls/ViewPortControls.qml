import QtQuick

import BlendViewer

// Viewport Controls
Rectangle 
{

	id: viewPortControls

	width: Properties.baseComponentW / 8
	height: controlObjectsColumn.implicitHeight + Properties.marginXS
	radius: width / 10
	color: Properties.tertiaryBackground

	border
	{
		color: Properties.border
		width: 1
	}

	anchors
	{
		top: parent.top
		right: parent.right

		topMargin: Properties.marginS
		rightMargin: Properties.marginS
	}

	// Control Objects
	Column
	{
		id: controlObjectsColumn

		width: parent.width * 0.8
		spacing: Properties.marginXS

		anchors.centerIn: parent

		// Select
		ControlObject 
		{
				id: selectControlObject
				tooltip: "Select"
				iconPath: "select.svg"
		}
		// - Select

		// Move
		ControlObject 
		{
				id: moveControlObject
				tooltip: "Move"
				iconPath: "move.svg"
		}
		// - Move

		// Rotate
		ControlObject
		{
			id: rotateControlObject
			tooltip: "Rotate"
			iconPath: "rotate.svg"
		}
		// - Rotate

		// Scale
		ControlObject
		{
			id: scaleControlObject
			tooltip: "Scale"
			iconPath: "scale.svg"
		}
		// - Scale

		// Category Spacer
		Rectangle
		{
			width: parent.width * 0.8
			height: 1
			color: Properties.border

			anchors.horizontalCenter: parent.horizontalCenter
		}
		// - Category Spacer

		// Grid Toggle
		ControlObject
		{
			id: gridToggleControlObject
			tooltip: "Toggle Grid"
			iconPath: "grid.svg"
		}
		// - Grid Toggle

		// Wireframe Toggle
		ControlObject
		{
			id: wireframeToggleControlObject
			tooltip: "Toggle Wireframe"
			iconPath: "wireframe.svg"
		}
		// - Wireframe Toggle

	}
// - Control Objects

}
// - Viewport Controls