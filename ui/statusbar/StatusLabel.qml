import QtQuick
import QtQuick.Layouts

import BlendViewer

// Status Label
Row
{
	property string icon
	property string value
	property string label
	property bool isFPS: false

	spacing: 4
	clip: true

	// Label Icon
	Image
	{
		visible: icon !== ""
		source: icon
		width: Properties.baseComponentH / 3
		height: width
		fillMode: Image.PreserveAspectFit
		mipmap: true
		
		anchors
		{
			verticalCenter: parent.verticalCenter
		}
	}
	// - Label Icon

	// Label Text & Value
	Text
	{
		text: isFPS === true ? label + " " + value : (label !== "" ? value + " " + label : value)
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