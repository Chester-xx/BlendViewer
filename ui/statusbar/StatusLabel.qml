import QtQuick
import QtQuick.Layouts

// Status Label
Row
{
	property string icon
	property string value
	property string label

	spacing: 4
	clip: true

	// Label Icon
	Image
	{
		visible: icon !== ""
		source: icon
		width: statusBar.height * 1 / 2
		height: statusBar.height * 1 / 2
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
		text: label !== "" ? value + " " + label : value
		font.pixelSize: statusBar.height * 4 / 10
		color: "#94A3B8"
		elide: Text.ElideRight

		anchors
		{
			verticalCenter: parent.verticalCenter
		}
	}
	// - Label Text & Value

}
// - Status Label