import QtQuick

import BlendViewer

// File Manager Header
Item
{
    x: Properties.marginM
    width: parent.width - Properties.marginM * 2
    height: sectionLabel.implicitHeight

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