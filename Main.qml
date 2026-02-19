import QtQuick
import QtQuick.Window

import BlendViewer.SideBar
import BlendViewer.StatusBar

Window {

    id: mainWindow

    visible: true
    // visibility: Window.FullScreen
    visibility: Window.Maximized

    color: "#171D28"

    width: Screen.width * 1/2
    height: Screen.height * 1/2
    
    title: qsTr("BlendViewer")

    SideBar
    {
        id: sideBar
    }

    StatusBar
    {
        id: statusBar
    }

}
