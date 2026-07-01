import QtQuick
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
        Column
        {
            id: sideBarColumnLayout

            width: sideBar.width
            spacing: 0

            // ImportFileButton.qml
            Item { width: 1; height: Properties.marginL }
            ImportFileButton
            {
                id: importFileButton
            }
            Item { width: 1; height: Properties.marginXS }
            // - ImportFileButton.qml

            // Import Label
            Text
            {
                text: qsTr("Drag & Drop .glTF or .glb Files")
                font.pixelSize: Properties.fontSub
                color: Properties.textSecondary
                width: sideBar.width
                horizontalAlignment: Text.AlignHCenter
                bottomPadding: Properties.marginL
            }
            // - Import Label

            // CameraControlsHeader.qml
            Item { width: 1; height: Properties.sectionSpacing }
            CameraControlsHeader
            {
                id: cameraControlsHeader
            }
            // - CameraControlsHeader.qml

            // CameraControls.qml
            Item { width: 1; height: Properties.sectionSpacing }
            CameraControls
            {
                id: cameraControls
            }
            // - CameraControls.qml

            // QuickViewsHeader.qml
            Item { width: 1; height: Properties.sectionSpacing }
            QuickViewsHeader
            {
                id: quickViewsHeader
            }
            // - QuickViewsHeader.qml

            // QuickViews.qml
            Item { width: 1; height: Properties.sectionSpacing }
            QuickViews
            {
                id: quickViews
            }
            // - QuickViews.qml

            // EnvironmentsHeader.qml
            Item { width: 1; height: Properties.sectionSpacing }
            EnvironmentsHeader
            {
                id: environmentsHeader
            }
            // - EnvironmentsHeader.qml

            // Environments.qml
            Item { width: 1; height: Properties.sectionSpacing }
            Environments
            {
                id: environments
            }
            // - Environments.qml

            // FileManagerHeader.qml
            Item { width: 1; height: Properties.sectionSpacing }
            FileManagerHeader
            {
                id: fileManagerHeader
            }
            // - FileManagerHeader.qml

            // FileManager.qml
            Item { width: 1; height: Properties.sectionSpacing }
            FileManager
            {
                id: fileManager
            }
            Item { width: 1; height: Properties.marginS }
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

        width: 15
        hoverEnabled: true
        cursorShape: Qt.SizeHorCursor

        anchors
        {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }

        property real dragStartGlobalX: 0
        property real dragStartWidth: 0

        onPressed: (mouse) =>
        {
            var globalPos = mapToItem(null, mouse.x, mouse.y)
            dragStartGlobalX = globalPos.x
            dragStartWidth = sideBar.width
        }

        onPositionChanged: (mouse) =>
        {
            if (pressed)
            {
                var globalPos = mapToItem(null, mouse.x, mouse.y)
                var delta = globalPos.x - dragStartGlobalX
                Properties.sideBarWidth = dragStartWidth + delta
            }
        }

    }
    // - Resize Handle

}
// - Side Bar