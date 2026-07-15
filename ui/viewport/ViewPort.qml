import QtQuick

import BlendViewer

// Viewport
Item
{
	id: viewPort
	
	clip: true
	
	anchors
	{
		top: parent.top
		bottom: statusBar.top
		left: sideBar.right
		right: parent.right
	}

	// ViewPortPlaceHolder.qml
	ViewPortPlaceHolder
	{
		id: viewPortPlaceHolder

	}
	// - ViewPortPlaceHolder.qml


	// DisplayStatus.qml
	DisplayStatus
	{
		id: displayStatus
	}
	// - DisplayStatus.qml

	// GridStatus.qml
	GridStatus
	{
		id: gridStatus
	}
	// - GridStatus.qml

}
// Viewport