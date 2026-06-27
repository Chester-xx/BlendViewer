import QtQuick
import QtQuick.Layouts

import BlendViewer

// File Manager Header
Item
{
    width: parent.width
    height: sectionLabel.implicitHeight

    Layout.fillWidth: true
    Layout.topMargin: Properties.marginM
    Layout.leftMargin: Properties.marginM
    Layout.rightMargin: Properties.marginM

    // Section Label
    Text
    {
        id: sectionLabel

        text: qsTr("RECENT FILES")
        font.pixelSize: Properties.fontL
        font.bold: true
        color: Properties.textPrimary
        elide: Text.ElideRight
        width: parent.width

        anchors.left: parent.left
    }
    // - Section Label
}
// - File Manager Header