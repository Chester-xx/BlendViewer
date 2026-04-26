import QtQuick
import QtQuick.Layouts

import BlendViewer

// File Manager Header
RowLayout
{
    width: parent.width
    Layout.fillWidth: true
    Layout.topMargin: Properties.marginM
    Layout.leftMargin: Properties.marginM
    Layout.rightMargin: Properties.marginM

    // Section Label
    Text
    {
        text: qsTr("RECENT FILES")
        font.pixelSize: Properties.fontL
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