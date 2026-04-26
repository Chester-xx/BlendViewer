import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import QtQuick.Controls.impl

import BlendViewer

// Environment Object
Rectangle
{
    id: environmentObject

    property string label
    property string icon
    property real loadValue: 0.0

    onLoadValueChanged: loadingBar.value = loadValue
    signal selected()
    onSelected: environments.activeEnv = label.toUpperCase()

    color: Properties.controlBackground
    radius: Properties.radiusM
    scale: mouseArea.pressed ? 0.98 : 1.0

    border
    {
        width: 1
        color: mouseArea.pressed ? Properties.buttonHover : mouseArea.containsMouse || loadingBar.hovered ? Properties.button : Properties.border

        Behavior on color
        {
            ColorAnimation { duration: 150; easing.type: Easing.InOutQuad }
        }
    }

    Layout.fillWidth: true
    Layout.preferredHeight: Properties.baseComponentH

    // Hover Effect
    Behavior on color
    {
        ColorAnimation { duration: 150; easing.type: Easing.InOutQuad }
    }
    // - Hover Effect

    Behavior on scale
    {
        NumberAnimation { duration: 100; easing.type: Easing.InOutQuad }
    }
    // - Scale Effect

    // Mouse Area
    MouseArea
    {
        id: mouseArea

        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked:
        {
            environmentObject.selected()
            environmentObject.loadValue += 100 // Test Debug
        }
    }
    // - Mouse Area

    ToolTip
    {
        visible: mouseArea.containsMouse
        text: qsTr("Apply " + environmentObject.label + " environment")
        delay: Properties.tooltipDelay
        timeout: Properties.tooltipTimeout
    }

	// Content
	Row
	{
		spacing: Properties.marginS
		
		anchors
		{
			fill: parent
			margins: Properties.marginXS
		}

		// Thumbnail Icon
		IconImage
		{
			id: environmentIcon

			source: Properties.iconSourceEnvironment + environmentObject.icon
			width: parent.height
			height: parent.height
			sourceSize.width: parent.height
			sourceSize.height: parent.height
			fillMode: Image.PreserveAspectFit
			mipmap: true
		}
		// - Thumbnail Icon
		
		// Text & Bar Column
		Column
		{
			width: parent.width - environmentIcon.width - (Properties.marginS + Properties.marginXS)
			height: implicitHeight
			spacing: Properties.marginXS

			anchors.verticalCenter: parent.verticalCenter
			
			// Label
			Text
			{
				text: environmentObject.label
				width: parent.width
				font.pixelSize: Properties.fontL
				color: mouseArea.containsMouse || loadingBar.hovered ? Properties.textPrimary : Properties.textSecondary
			
				Behavior on color
				{
					ColorAnimation
					{
						duration: 150
						easing.type: Easing.InOutQuad
					}
				}
			}
			// - Label

			// Loading Bar
			Slider
			{
				id: loadingBar

				from: 0
				to: 100
				value: environmentObject.loadValue
				width: parent.width
				height: Properties.sliderComponent
				enabled: false
				
				Behavior on value
				{
					NumberAnimation
					{
						duration: 600
						easing.type: Easing.InOutCubic
					}
				}
				
				// Track
				background: Rectangle
				{
					width: parent.width
					height: parent.height
					radius: Properties.radiusL
					color: Properties.border

					// Fill Portion
					Rectangle
					{
						width: loadingBar.visualPosition * parent.width
						height: parent.height
						radius: Properties.radiusL
						color: loadingBar.value < 100 ? Properties.button : Properties.controlEnabled

						Behavior on color
						{
							ColorAnimation
							{
								duration: 300
								easing.type: Easing.InOutQuad
							}
						}
					}
					// - Fill Portion
				}
				// - Track

				// Disable Handle
				handle: Item 
				{
				
				}
				// - Disable Handle
			}
			// - Loading Bar
		}
		// - Text & Bar Column
	}
	// - Content
}
// - Environment Object