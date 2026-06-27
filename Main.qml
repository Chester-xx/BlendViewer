import QtQuick
import QtQuick.Window

import BlendViewer
import BlendViewer.SideBar
import BlendViewer.StatusBar
import BlendViewer.Viewport

Window {

    id: mainWindow

    visible: true
    width: Screen.width * 1 / 2
    height: Screen.height * 1 / 2
    minimumWidth: Properties.minimumWidth
    minimumHeight: Properties.minimumHeight
    color: Properties.primaryBackground
    title: qsTr("BlendViewer")

    // Throttled scale recalculation
    Timer
    {
        id: scaleRecalcTimer

        interval: 32
        repeat: false

        onTriggered:
        {
            Properties.scale = Math.round((mainWindow.width / 1200) * 1000) / 1000
            Properties.scaleHeight = Math.round((mainWindow.height / 800) * 1000) / 1000
            Properties.maximumSideBarWidth = Math.round(mainWindow.width / 2)
            Properties.minimumSideBarWidth = Math.round(mainWindow.width / 6)
        }
    }

    function requestScaleRecalc()
    {
        scaleRecalcTimer.restart()
    }

    onWidthChanged: requestScaleRecalc()
    onHeightChanged: requestScaleRecalc()

    Component.onCompleted: requestScaleRecalc()
    // - Throttled scale recalculation

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
