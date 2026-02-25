import QtQuick
import QtQuick.Layouts

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

    // Content Scroll Controller
    Flickable
    {
        id: sideBarContent
        
        clip: true
        contentHeight: sideBarColumnLayout.implicitHeight

        anchors
        {
            top: appInfo.bottom
            bottom: cameraSpeed.top
            left: parent.left
            right: parent.right
        }

        // Content Layout
        ColumnLayout
        {
            id: sideBarColumnLayout

            width: parent.width
            spacing: 0

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
                font.pixelSize: sideBar.height * 1 / 110
                topPadding: 10
                color: "#94A3B8"
                Layout.alignment: Qt.AlignHCenter
            }
            // - Import Label

        }
        // - Content Layout
    }
    // - Content Scroll Controller

    // CameraSpeedController.qml
    CameraSpeedController
    {
        id: cameraSpeed
    }
    // - CameraSpeedController.qml

}
// - Side Bar