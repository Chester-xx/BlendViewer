import QtQuick
import QtQuick.Window

import BlendViewer
import BlendViewer.SideBar
import BlendViewer.StatusBar

Window {

    id: mainWindow

    visible: true
    width: Screen.width * 1 / 2
    height: Screen.height * 1 / 2
    minimumWidth: Properties.minimumWidth
    minimumHeight: Properties.minimumHeight
    color: Properties.primaryBackground
    title: qsTr("BlendViewer")

    // Debugging during UI iteration
    visibility: Properties.fullscreen ? Window.FullScreen : Window.Maximized

    // SideBar.qml
    SideBar
    {
        id: sideBar
    }
    // - SideBar.qml

    // StatusBar.qml
    StatusBar
    {
        id: statusBar
    }
    // - StatusBar.qml

    // ViewPort.qml
    ViewPort
    {
        id: viewPort
    }
    // - ViewPort.qml
}
