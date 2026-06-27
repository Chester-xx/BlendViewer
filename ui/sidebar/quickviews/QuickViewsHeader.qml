import QtQuick
import QtQuick.Layouts

import BlendViewer

// Quick Views Header
Item
{
    width: parent.width
    height: sectionLabel.implicitHeight

    Layout.fillWidth: true
    Layout.topMargin: Properties.marginXS
    Layout.leftMargin: Properties.marginM
    Layout.rightMargin: Properties.marginM

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