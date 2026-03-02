import QtQuick
import QtQuick.Layouts

import BlendViewer

// Environments
Rectangle
{
    id: environments

    property string activeEnv: "NONE"

    Layout.fillWidth: true
    Layout.topMargin: sideBar.height * 1 / 100
    Layout.leftMargin: sideBar.width * 1 / 20
    Layout.rightMargin: sideBar.width * 1 / 20
    Layout.preferredHeight: envColumn.implicitHeight

    color: "transparent"

    // Environment Column
    ColumnLayout
    {
        id: envColumn

        width: parent.width
        spacing: sideBar.height * 1 / 100

        // Studio
        EnvironmentObject
        {
            label: qsTr("Studio")
        }

        // Sunset
        EnvironmentObject
        {
            label: qsTr("Sunset")
        }

        // Night
        EnvironmentObject
        {
            label: qsTr("Night")
        }

        // Overcast
        EnvironmentObject
        {
            label: qsTr("Overcast")
        }
    }
    // - Environment Column
}
// - Environments