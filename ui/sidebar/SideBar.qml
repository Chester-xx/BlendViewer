import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic

import BlendViewer

// Side Bar
Rectangle
{
    id: sideBar

    width: Properties.sideBarWidth < Properties.minimumSideBarWidth ? Properties.minimumSideBarWidth : Properties.sideBarWidth > Properties.maximumSideBarWidth ? Properties.maximumSideBarWidth : Properties.sideBarWidth
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
                font.pixelSize: Properties.fontSub
                color: Properties.textSecondary
                Layout.alignment: Qt.AlignHCenter
                Layout.bottomMargin: Properties.marginL
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

            // EnvironmentsHeader.qml
            EnvironmentsHeader
            {
                id: environmentsHeader
            }
            // - EnvironmentsHeader.qml

            // Environments.qml
            Environments
            {
                id: environments
            }
            // - Environments.qml

            // FileManagerHeader.qml
            FileManagerHeader
            {
                id: fileManagerHeader
            }
            // - FileManagerHeader.qml

            // FileManager.qml
            FileManager
            {
                id: fileManager
            }
            // - FileManager.qml
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

    // Resize Handle
    MouseArea
    {
        id: resizeHandle

        width: 8
        hoverEnabled: true
        cursorShape: Qt.SizeHorCursor

        anchors
        {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }

        property real dragSX: 0
        property real dragSW: 0

        onPressed: (mouse) =>
        {
            dragSX = mouse.x
            dragSW = Properties.sideBarWidth
        }

        onPositionChanged: (mouse) =>
        {
            if (pressed)
            {
                var delta = mouse.x - dragSX
                Properties.sideBarWidth = dragSW + delta
            }
        }

    }
    // - Resize Handle

}
// - Side Bar