import QtQuick
import QtQuick.Layouts

import BlendViewer

// File Manager Header
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
        text: qsTr("RECENT FILES")
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
// - File Manager Header