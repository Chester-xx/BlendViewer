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
}
// Viewport