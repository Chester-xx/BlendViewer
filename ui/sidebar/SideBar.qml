import QtQuick

// Side Bar
Rectangle
{
    id: sideBar

    width: Math.max(parent.width * 1 / 8, 200)
    height: parent.height
    color: "#111A22"

    anchors
    {
        left: parent.left
        top: parent.top
        bottom: parent.bottom
    }

    // Right Side Border
    Rectangle
    {
        id: sideBarRightBorder

        color: "#2A3B4F"
        width: 1

        anchors
        {
            bottom: parent.bottom
            top: parent.top
            right: parent.right
        }
    }
    // - Right Side Border

    // AppInfo.qml
    AppInfo
    {
        id: appInfo
    }
    // - AppInfo.qml

    // ImportFileButton.qml
    ImportFileButton
    {
        id: importFileButton
    }
    // - ImportFileButton.qml

    // Import Label
    Text
    {
        text: qsTr("Drag & Drop .glTF or .glb Files")
        font.pixelSize: parent.height * 1 / 120
        topPadding: 10
        color: "#94A3B8"

        anchors
        {
            top: importFileButton.bottom
            horizontalCenter: parent.horizontalCenter
        }
    }
    // - Import Label

    // CameraSpeedController.qml
    CameraSpeedController
    {
        id: cameraSpeed
    }
    // - CameraSpeedController.qml

}
// - Side Bar