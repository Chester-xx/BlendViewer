import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import QtQuick.Controls.impl

import BlendViewer

// File Object
Rectangle
{
    id: fileObject

    property string fileName
    property string filePath
    property string fileSize
    signal selected()

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

    Behavior on scale
    {
        NumberAnimation { duration: 100; easing.type: Easing.InOutQuad }
    }

    // Mouse Area
    MouseArea
    {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: fileObject.selected()
    }
    // - Mouse Area

    ToolTip
    {
        visible: mouseArea.containsMouse
        text: filePath
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
            margins: parent.height * 1 / 4
        }

        // File Icon
        IconImage
        {
            id: fileIcon

            source: Properties.iconSource + "mesh.svg"
            width: parent.height
            height: parent.height
            sourceSize.width: parent.height
            sourceSize.height: parent.height
            fillMode: Image.PreserveAspectFit
            mipmap: true
            color: mouseArea.containsMouse ? Properties.button : Properties.border

            anchors.verticalCenter: parent.verticalCenter

            Behavior on color
            {
                ColorAnimation { duration: 150; easing.type: Easing.InOutQuad }
            }
        }
        // - File Icon

        // Name & Size Column
        Column
        {
            width: parent.width - fileIcon.width - parent.spacing
            anchors.verticalCenter: parent.verticalCenter
            spacing: 2

            // File Name
            Text
            {
                text: fileObject.fileName
                width: parent.width
                font.pixelSize: sideBar.height * 1 / 100
                color: mouseArea.containsMouse ? Properties.textPrimary : Properties.textSecondary
                elide: Text.ElideMiddle

                Behavior on color
                {
                    ColorAnimation { duration: 150; easing.type: Easing.InOutQuad }
                }
            }
            // - File Name

            // File Size
            Text
            {
                text: fileObject.fileSize
                width: parent.width
                font.pixelSize: sideBar.height * 1 / 120
                color: Properties.border
                elide: Text.ElideRight
            }
            // - File Size
        }
        // - Name & Size Column
    }
    // - Content
}
// - File Object