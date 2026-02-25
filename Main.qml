import QtQuick
import QtQuick.Window

import BlendViewer.SideBar
import BlendViewer.StatusBar

Window {

    id: mainWindow

    visible: true
    width: Screen.width * 1 / 2
    height: Screen.height * 1 / 2
    minimumWidth: 900
    minimumHeight: 600
    color: "#171D28"
    title: qsTr("BlendViewer")

    // Debugging during UI iteration
    visibility: Window.FullScreen
    //visibility: Window.Maximized

    SideBar
    {
        id: sideBar
    }

    StatusBar
    {
        id: statusBar
    }

}
