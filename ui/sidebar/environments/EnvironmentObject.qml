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
    radius: 7
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
    Layout.preferredHeight: sideBar.height * 1 / 22

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
            environmentObject.loadValue += 10
        }
    }
    // - Mouse Area

    ToolTip
    {
        visible: mouseArea.containsMouse
        text: qsTr("Apply " + environmentObject.label + " environment")
        delay: 1000
        timeout: 3000
    }

    // Content
    Row
    {
        spacing: parent.height * 1 / 6

        anchors
        {
            fill: parent
            margins: parent.height * 1 / 7
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
            spacing: parent.height * 1 / 25

            anchors
            {
                left: environmentIcon.right
                right: parent.right
                top: parent.top
                bottom: parent.bottom
                leftMargin: parent.anchors.margins
                topMargin: this.height * 1 / 4
                bottomMargin: this.height * 1 / 4
            }

            // Label
            Text
            {
                text: environmentObject.label
                font.pixelSize: sideBar.height * 1 / 100
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
                height: parent.height * 3 / 16
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
                    radius: 10
                    color: Properties.border

                    // Filled Portion
                    Rectangle
                    {
                        width: loadingBar.visualPosition * parent.width
                        height: parent.height
                        radius: 10
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
                    // - Filled Portion
                }
                // - Track

                // Disabled Handle
                handle: Item
                {
                
                }
                // - Disabled Handle
            }
            // - Loading Bar
        }
        // - Text & Bar Column
    }
    // - Content
}
// - Environment Object