import QtQuick

import BlendViewer

// Quick Views Header
Item
{
    x: Properties.marginM
    width: parent.width - Properties.marginM * 2
    height: sectionLabel.implicitHeight

    // Section Label
    Text
    {
        id: sectionLabel

        text: qsTr("QUICK VIEWS")
        font.pixelSize: Properties.fontL
        font.bold: true
        color: Properties.textPrimary
        elide: Text.ElideRight
        width: parent.width

        anchors.left: parent.left
    }
    // - Section Label
}
// - Quick Views Header