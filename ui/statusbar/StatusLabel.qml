import QtQuick

import BlendViewer

// Status Label
Row
{
	id: sLabel

	property string iconPath
	property string value
	property string label
	property bool isFPS: false

	spacing: 4
	clip: true

	// Label Icon
	Image
	{
		visible: sLabel.iconPath !== ""
		source: sLabel.iconPath
		width: Properties.baseComponentH / 3
		height: width
		fillMode: Image.PreserveAspectFit
		mipmap: true
		
		anchors.verticalCenter: parent.verticalCenter
	}
	// - Label Icon

	// Label Text & Value
	Text
	{
		text: sLabel.isFPS === true ? sLabel.label + " " + sLabel.value : (sLabel.label !== "" ? sLabel.value + " " + sLabel.label : sLabel.value)
		font.pixelSize: Properties.fontS
		color: Properties.textSecondary
		elide: Text.ElideRight

		anchors
		{
			verticalCenter: parent.verticalCenter
		}
	}
	// - Label Text & Value

}
// - Status Label