import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

import BlendViewer

// Quick Views
Rectangle
{
	id: quickViews

	x: Properties.marginM
	width: parent.width - Properties.marginM * 2
	height: viewGrid.implicitHeight

	color: "transparent"

	// View Grid
	GridLayout
	{
		id: viewGrid

		width: parent.width
		columns: 3
		rowSpacing: 6
		columnSpacing: 6

		// Top
		ViewObject
		{
			label: qsTr("Top")
			iconPath: "view-top.svg"
			onSelected: {  }
		}
		// - Top

		// Bottom
		ViewObject
		{
			label: qsTr("Bottom")
			iconPath: "view-bottom.svg"
			onSelected: {  }
		}
		// - Bottom

		// Perspective
		ViewObject
		{
			label: qsTr("Perspective")
			iconPath: "view-perspective.svg"
			onSelected: {  }
		}
		// - Perspective

		// Left
		ViewObject
		{
			label: qsTr("Left")
			iconPath: "view-left.svg"
			onSelected: {  }
		}
		// - Left

		// Front
		ViewObject
		{
			label: qsTr("Front")
			iconPath: "mesh.svg"
			onSelected: {  }
		}
		// - Front

		// Right
		ViewObject
		{
			label: qsTr("Right")
			iconPath: "view-right.svg"
			onSelected: {  }
		}
		// - Right
	}
	// - View Grid
}
// - Quick Views