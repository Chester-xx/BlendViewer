import QtQuick
import QtQuick.Layouts

import BlendViewer

Rectangle 
{
	id: cameraControls

	Layout.fillWidth: true
	Layout.preferredHeight: sideBar.height * 1 / 6
	Layout.topMargin: sideBar.height * 1 / 100
	Layout.leftMargin: sideBar.width * 1 / 20
	Layout.rightMargin: sideBar.width * 1 / 20

	color: Properties.controlBackground
	radius: 7

	border
	{
		width: 1
		color: Properties.border
	}

}
