import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

import BlendViewer

// Environment Object
Rectangle
{
    id: environmentObject

    property string label
    signal selected()
    onSelected: environments.activeEnv = label.toUpperCase()

    color: Properties.controlBackground
    radius: 7
    scale: mouseArea.pressed ? 0.98 : 1.0

    border
    {
        width: 1
        color: mouseArea.pressed ? Properties.buttonHover : mouseArea.containsMouse ? Properties.button : Properties.border

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
        onClicked: environmentObject.selected()
    }
    // - Mouse Area

    ToolTip
    {
        visible: mouseArea.containsMouse
        text: qsTr("Apply " + environmentObject.label + " environment")
        delay: 1000
        timeout: 3000
    }




    // Label
    Text
    {
        text: environmentObject.label
        font.pixelSize: sideBar.height * 1 / 100
        color: mouseArea.containsMouse ? Properties.textPrimary : Properties.textSecondary
        anchors.verticalCenter: parent.verticalCenter
        leftPadding: sideBar.width * 1 / 20

        Behavior on color
        {
            ColorAnimation { duration: 150; easing.type: Easing.InOutQuad }
        }
    }
    // - Label




}
// - Environment Object