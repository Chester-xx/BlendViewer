import QtQuick
import QtQuick.Window

import BlendViewer
import BlendViewer.SideBar
import BlendViewer.StatusBar
import BlendViewer.Viewport

// Test 2 External
// Main Window
Window {

    id: mainWindow

    visible: true
    width: Screen.width * 1 / 2
    height: Screen.height * 1 / 2
    minimumWidth: Properties.minimumWidth
    minimumHeight: Properties.minimumHeight
    title: qsTr("BlendViewer")

    // Throttled scale recalculation
    Timer
    {
        id: scaleRecalcTimer

        interval: 48
        repeat: false

        onTriggered:
        {
            var s = Math.round((mainWindow.width / 1200) * 1000) / 1000
            var sh = Math.round((mainWindow.height / 800) * 1000) / 1000
            var mx = Math.round(mainWindow.width / 2)
            var mn = Math.round(mainWindow.width / 6)

            if (s  !== Properties.scale)               Properties.scale = s
            if (sh !== Properties.scaleHeight)         Properties.scaleHeight = sh
            if (mx !== Properties.maximumSideBarWidth) Properties.maximumSideBarWidth = mx
            if (mn !== Properties.minimumSideBarWidth) Properties.minimumSideBarWidth = mn
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
// - Main Window
