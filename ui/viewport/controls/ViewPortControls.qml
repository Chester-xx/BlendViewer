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

		width: parent.width * 0.9
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

	}
// - Control Objects

}
// - Viewport Controls