import QtQuick
import QtQuick.Layouts

import BlendViewer

Rectangle 
{
	id: cameraControls

	width: parent.width
	height: sideBar.height * 1 / 3
	color: Properties.controlBackground
	radius: 7

	border
	{
		width: 1
		color: Properties.border
	}

}
