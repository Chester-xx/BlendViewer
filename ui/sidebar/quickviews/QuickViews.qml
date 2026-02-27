import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

import BlendViewer

// Quick Views
Rectangle
{
	id: quickViews

	Layout.fillWidth: true
	Layout.topMargin: sideBar.height * 1 / 100
	Layout.leftMargin: sideBar.width * 1 / 20
	Layout.rightMargin: sideBar.width * 1 / 20
	Layout.preferredHeight: viewGrid.implicitHeight

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
			icon: "view-top.svg"
			onSelected: {  }
		}
		// - Top

		// Bottom
		ViewObject
		{
			label: qsTr("Bottom")
			icon: "view-bottom.svg"
			onSelected: {  }
		}
		// - Bottom

		// Perspective
		ViewObject
		{
			label: qsTr("Persp")
			icon: "view-perspective.svg"
			onSelected: {  }
		}
		// - Perspective

		// Left
		ViewObject
		{
			label: qsTr("Left")
			icon: "view-left.svg"
			onSelected: {  }
		}
		// - Left

		// Front
		ViewObject
		{
			label: qsTr("Front")
			icon: "mesh.svg"
			onSelected: {  }
		}
		// - Front

		// Right
		ViewObject
		{
			label: qsTr("Right")
			icon: "view-right.svg"
			onSelected: {  }
		}
		// - Right
	}
	// - View Grid
}
// - Quick Views