pragma Singleton

import QtQuick

QtObject
{
	id: properties

	// App Specifications
		readonly property string version: "v1.0.0"
		readonly property string author: "Chester-xx"
		readonly property string github: "https://github.com/Chester-xx/BlendViewer/"
		readonly property string license: "MIT"
		readonly property string rhi_pipeline: "D3D11"
		readonly property string rootSource: "qrc:/qt/qml/BlendViewer/"
		readonly property string iconSource: rootSource + "assets/icons/"
		readonly property string iconSourceEnvironment: iconSource + "environments/"
		readonly property string modelSource: rootSource + "assets/models/"
	// - App Specifications

	// Window Specifications
		readonly property bool fullscreen: false
		readonly property int minimumWidth: 900
		readonly property int minimumHeight: 600
		property real scale: 1.0
	// - Window Specifications

	// Font Scales
		readonly property real fontS: Math.max(scale * 9,  8)
		readonly property real fontM: Math.max(scale * 11, 9)
		readonly property real fontL: Math.max(scale * 13, 10)
		readonly property real fontTitle: Math.max(scale * 17, 13)
		readonly property real fontSub: Math.max(scale * 12, 9)
	// - Font Scales

	// Background Colors | Main | Border | Controls
		readonly property color primaryBackground: "#171D28"
		readonly property color secondaryBackground: "#111A22"
		readonly property color tertiaryBackground: "#0D141B"

		readonly property color viewPortDarkColor: "#0A0E15"
		readonly property color viewPortLightColor: "#1A202C"

		readonly property color border: "#2A3B4F"
	
		readonly property color controlBackground: "#1A2634"
		readonly property color controlEnabled: "#21C35D"
		// - Background Colors

	// Text Colors
		readonly property color textPrimary: "#ffffff"
		readonly property color textSecondary: "#94A3B8"
	// - Text Colors

	// Button Colors | Normal | Light
		readonly property color button: "#137FEC"
		readonly property color buttonHover: "#2563EB"
		readonly property color buttonPressed: "#1A52C7"

		readonly property color lightButton: "#3BA5FF"
		readonly property color lightButtonHover: "#2896F7"
		readonly property color lightButtonPressed: "#1E7FE0"
	// - Button Colors

	
}