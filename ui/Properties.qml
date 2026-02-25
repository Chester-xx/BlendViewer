pragma Singleton

import QtQuick

QtObject
{
	id: properties

	readonly property string version: "v1.0.0"
	readonly property string author: "Chester-xx"
	readonly property string github: "https://github.com/Chester-xx/BlendViewer/"
	readonly property string license: "MIT"
	readonly property string rhi_pipeline: "D3D11"
	readonly property string iconSource: "qrc:/qt/qml/BlendViewer/assets/icons/"

	readonly property bool fullscreen: false
	readonly property int minimumWidth: 900
	readonly property int minimumHeight: 600

	readonly property color primaryBackground: "#171D28"
	readonly property color secondaryBackground: "#111A22"
	readonly property color tertiaryBackground: "#0D141B"

	readonly property color border: "#2A3B4F"

	readonly property color textPrimary: "#ffffff"
	readonly property color textSecondary: "#94A3B8"

	readonly property color button: "#137FEC"
	readonly property color buttonHover: "#2563EB"
	readonly property color buttonPressed: "#1A52C7"


	//readonly property color 
}