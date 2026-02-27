import QtQuick
import QtQuick.Layouts

import BlendViewer

Rectangle 
{
	id: cameraControls

	color: Properties.controlBackground
	radius: 7

	Layout.fillWidth: true
	Layout.preferredHeight: sideBar.height * 1 / 6
	Layout.topMargin: sideBar.height * 1 / 100
	Layout.leftMargin: sideBar.width * 1 / 20
	Layout.rightMargin: sideBar.width * 1 / 20

	border
	{
		width: 1
		color: Properties.border
	}

	ColumnLayout
	{
		spacing: 0

		anchors
		{
			fill: parent
			topMargin: 8
			bottomMargin: 8
		}

		// Rotation X
		ControlObject
		{
			id: rotationXControl

			label: "Rotation X"
			minValue: -180.0
			maxValue: 180.0
			value: 0.0
			unit: "°"
		}
		// - Rotation X

		// Rotation Y
		ControlObject
		{
			id: rotationYControl

			label: "Rotation Y"
			minValue: -90.0
			maxValue: 90.0
			value: 0.0
			unit: "°"
		}
		// - Rotation Y

		// Distance
		ControlObject
		{
			id: distanceControl

			label: "Distance"
			minValue: 0.0
			maxValue: 100.0
			value: 10.0
			unit: "m"
		}
		// - Distance

	}

}
