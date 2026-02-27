import QtQuick
import QtQuick.Layouts

import BlendViewer

// Quick Views Header
RowLayout
{
    width: parent.width
    Layout.fillWidth: true
    Layout.topMargin: sideBar.height * 1 / 50
    Layout.leftMargin: sideBar.width * 1 / 20
    Layout.rightMargin: sideBar.width * 1 / 20

    // Section Label
    Text
    {
        text: qsTr("QUICK VIEWS")
        font.pixelSize: sideBar.height * 1 / 100
        font.bold: true
        color: Properties.textPrimary
        Layout.alignment: Qt.AlignLeft
    }
    // - Section Label

    // Spacer
    Item 
    {
        Layout.fillWidth: true 
    }
    // - Spacer
}
// - Quick Views Header