cmake_minimum_required(VERSION 3.16)
project(BlendViewer VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Quick3D ShaderTools Svg)

qt_standard_project_setup(REQUIRES 6.8)

set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

# Main executable
qt_add_executable(appBlendViewer
    main.cpp
)

# Root QML module (Main.qml lives here)
# URI = "BlendViewer" → unique output dir: BlendViewer/
qt_add_qml_module(appBlendViewer
    URI BlendViewer
    QML_FILES
        Main.qml
    RESOURCES
        assets/icons/settings.svg
        assets/icons/import.svg
        assets/icons/camera-speed.svg
)

# Sub-module: Sidebar
# URI = "BlendViewer.Sidebar" → unique output dir: BlendViewer/Sidebar/
qt_add_library(BlendViewer_SideBar)
qt_add_qml_module(BlendViewer_SideBar
    URI BlendViewer.SideBar
    QML_FILES
        ui/sidebar/SideBar.qml
        ui/sidebar/AppInfo.qml
        ui/sidebar/ImportFileButton.qml
        ui/sidebar/CameraSpeedController.qml
)

# Sub-module: StatusBar
# URI = "BlendViewer.StatusBar" → unique output dir: BlendViewer/StatusBar/
qt_add_library(BlendViewer_StatusBar)
qt_add_qml_module(BlendViewer_StatusBar
    URI BlendViewer.StatusBar
    QML_FILES
        ui/statusbar/StatusBar.qml
)

# Sub-module: Viewport
# URI = "BlendViewer.Viewport" → unique output dir: BlendViewer/Viewport/
qt_add_library(BlendViewer_Viewport)
qt_add_qml_module(BlendViewer_Viewport
    URI BlendViewer.Viewport
    QML_FILES
        ui/viewport/Viewport.qml
)

# Link all modules into the main target
target_link_libraries(appBlendViewer
    PRIVATE
    Qt6::Quick
    Qt6::Quick3D
    Qt6::ShaderTools
    Qt6::Svg
    BlendViewer_SideBar
    BlendViewer_StatusBar
    BlendViewer_Viewport
)

# Install rules
set_target_properties(appBlendViewer PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

include(GNUInstallDirs)
install(TARGETS appBlendViewer
    BUNDLE  DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)