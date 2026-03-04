import QtQuick
import QtQuick.Layouts
import Qt.labs.folderlistmodel

import BlendViewer

// File Manager
Rectangle
{
    id: fileManager

    Layout.fillWidth: true
    Layout.topMargin: sideBar.height * 1 / 100
    Layout.bottomMargin: sideBar.height * 1 / 100
    Layout.leftMargin: sideBar.width * 1 / 20
    Layout.rightMargin: sideBar.width * 1 / 20
    Layout.preferredHeight: fileColumn.implicitHeight

    color: "transparent"

    // Scans assets/models/ at runtime - no explicit file listing needed
    FolderListModel
    {
        id: folderModel

        folder: "file:///" + Qt.application.arguments[0].replace(/\\/g, "/").replace(/\/[^\/]*$/, "") + "/assets/models/"
        nameFilters: ["*.gltf", "*.glb"]
        showDirs: false
        showHidden: false
    }

    // Empty State
    Text
    {
        visible: folderModel.count === 0
        text: qsTr("No models found")
        font.pixelSize: sideBar.height * 1 / 110
        color: Properties.border
        anchors.horizontalCenter: parent.horizontalCenter
    }
    // - Empty State

    // File Object Column
    ColumnLayout
    {
        id: fileColumn

        width: parent.width
        spacing: sideBar.height * 1 / 100

        Repeater
        {
            model: folderModel

            FileObject
            {
                fileName: model.fileName
                filePath: model.filePath
                fileSize: {
                    var bytes = model.fileSize
                    if (bytes < 1024) return bytes + " B"
                    if (bytes < 1048576) return (bytes / 1024).toFixed(1) + " KB"
                    return (bytes / 1048576).toFixed(1) + " MB"
                }

                onSelected:
                {
                    // Backend load logic will go here
                    console.log("Selected:", filePath)
                }
            }
        }
    }
    // - File Object Column

Component.onCompleted: 
{
    console.log("Folder:", folderModel.folder)
    console.log("Count:", folderModel.count)
    console.log("Status:", folderModel.status)
    console.log("Exe path:", Qt.application.arguments[0])
    console.log("Looking in:", folderModel.folder)
    console.log("Exe dir:", Qt.applicationDirPath)
}

}
// - File Manager