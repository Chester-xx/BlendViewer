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

    // Scale bounding for component size calculation
    Binding
    {
        target: Properties
        property: "scale"
        value: mainWindow.width / 1200 // ----- debug
        // value: mainWindow.height / 800 ----- Inversing matches the scaling performance issues either horizontally or vertically
    }
    // - Scale bounding

    // Scale width bounding
    Binding
    {
        target: Properties
        property: "scaleWidth"
        value: mainWindow.width / 1200
    }
    // - Scale width bounding

    // Max Side Bar Width Binding
    Binding
    {
        target: Properties
        property: "maximumSideBarWidth"
        value: mainWindow.width / 3
    }
    // - Max SBW Binding

    // Min Side Bar Width Binding
    Binding
    {
        target: Properties
        property: "minimumSideBarWidth"
        value: mainWindow.width / 6
    }
    // - MIN SBW Binding

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
