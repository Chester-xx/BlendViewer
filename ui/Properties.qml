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
		
		readonly property real minimumSideBarWidth: minimumWidth / 6
		readonly property real maximumSideBarWidth: minimumWidth / 4
		property int sideBarWidth: maximumSideBarWidth

		property real scale: 1.0
		property real scaleWidth: 1.0
	// - Window Specifications

	// Font Scales
		readonly property real fontS: scale * 7
		readonly property real fontM: scale * 9
		readonly property real fontL: scale * 10
		readonly property real fontTitle: scale * 12
		readonly property real fontSub: scale * 8
	// - Font Scales

	// Spacing & Margin Scales
		readonly property real marginXS: scale * 6
		readonly property real marginS: scale * 12
		readonly property real marginM: scale * 16
		readonly property real marginL: scale * 20
	// - Spacing & Margin Scales

	// Border Scales
		readonly property real radiusS: 4
		readonly property real radiusM: 7
		readonly property real radiusL: 100
	// - Border Scales

	// Component Scales
		readonly property real buttonH: scale * 40

		readonly property real viewComponent: scale * 20
		readonly property real cameraControlsComponent: scale * 150

		readonly property real baseComponentW: scale * 200
		readonly property real baseComponentH: scale * 50

		readonly property real sliderInputComponent: scale * 15
		readonly property real sliderComponent: scale * 3
	// - Component Scales

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

	// ToolTips
		readonly property int tooltipDelay:   1500
		readonly property int tooltipTimeout: 3000
	// - ToolTips
	
}