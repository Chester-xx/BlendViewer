import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

import BlendViewer

// Side Bar
Rectangle
{
    id: sideBar

    width: Math.max(parent.width * 1 / 8, 200)
    height: parent.height
    color: Properties.secondaryBackground

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

        color: Properties.border
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
        interactive: true
        contentHeight: sideBarColumnLayout.implicitHeight

        ScrollBar.vertical: ScrollBar
        {
            policy: ScrollBar.AsNeeded
        }

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
                color: Properties.textSecondary
                Layout.alignment: Qt.AlignHCenter
            }
            // - Import Label

            // CameraControlsHeader.qml
            CameraControlsHeader
            {
                id: cameraControlsHeader
            }
            // - CameraControlsHeader.qml

            // CameraControls.qml
            CameraControls
            {
                id: cameraControls
            }
            // - CameraControls.qml

            // QuickViewsHeader.qml
            QuickViewsHeader
            {
                id: quickViewsHeader
            }
            // - QuickViewsHeader.qml

            // QuickViews.qml
            QuickViews
            {
                id: quickViews
            }
            // - QuickViews.qml
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