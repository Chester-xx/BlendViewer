import QtQuick
import QtQuick.Layouts

import BlendViewer

// Quick Views Header
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
        text: qsTr("QUICK VIEWS")
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
// - Quick Views Header