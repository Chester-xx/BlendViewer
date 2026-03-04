import QtQuick
import QtQuick.Layouts

import BlendViewer

// File Manager
Rectangle
{
    id: fileManager

    Layout.fillWidth: true
    Layout.topMargin: sideBar.height * 1 / 100
    Layout.leftMargin: sideBar.width * 1 / 20
    Layout.rightMargin: sideBar.width * 1 / 20
    Layout.preferredHeight: envColumn.implicitHeight

    color: "transparent"

    // File Object Column
    ColumnLayout
    {
        id: fileColumn

        width: parent.width
        spacing: sideBar.height * 1 / 100

        // FileObject.qml
            FileObject
            {
                id: test1
                name: "test1.gltf"
                dir: ""
            }
        // - FileObject.qml
    }
    // - File Object Column
}
// - File Manager