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

        // EnvironmentObject.qml
            // Studio
            EnvironmentObject
            {
                label: qsTr("Studio")
                icon: "studio.svg"
            }

            // Sunset
            EnvironmentObject
            {
                label: qsTr("Sunset")
                icon: "sunset.svg"
            }

            // Night
            EnvironmentObject
            {
                label: qsTr("Night")
                icon: "night.svg"
            }

            // Overcast
            EnvironmentObject
            {
                label: qsTr("Overcast")
                icon: "overcast.svg"
            }
        // - EnvironmentObject.qml
    }
    // - Environment Column
}
// - Environments