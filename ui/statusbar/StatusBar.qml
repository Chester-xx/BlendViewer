import QtQuick
import QtQuick.Layouts

import BlendViewer

// Info Bar
Rectangle
{
    id: statusBar

    height: Properties.baseComponentH / 2
    color: "#101921"

    anchors
    {
        bottom: parent.bottom
        right: parent.right
        left: sideBar.right
    }

    // Status Items
    RowLayout
    {
        spacing: 0

        anchors
        {
            fill: parent

            leftMargin: Properties.marginM
            rightMargin: Properties.marginM
        }

        // Left Group | Mesh, Vertex, Material
        Row
        {
            spacing: Properties.marginM
            Layout.alignment: Qt.AlignVCenter

            // StatusLabel.qml
            // - Meshes
            StatusLabel { icon: Properties.iconSource + "mesh.svg"; value: "0"; label: "Meshes" }
            // - Vertices
            StatusLabel { icon: Properties.iconSource + "vertices.svg"; value: "0"; label: "Vertices" }
            // - Materials
            StatusLabel { icon: Properties.iconSource + "materials.svg"; value: "0"; label: "Materials" }
            // - StatusLabel.qml
        }
        // - Left Group

        // Spacer
        Item
        {
            Layout.fillWidth: true
        }
        // - Spacer

        // Right Group | FPS, RHI
        Row
        {
            spacing: Properties.marginM
            Layout.alignment: Qt.AlignVCenter
            // StatusLabel.qml
            // - FPS Counter
            StatusLabel { icon: ""; value: "--"; label: "FPS:"; isFPS: true }
            // - Spacer
            StatusLabel { icon: ""; value: "|"; label: "" }
            // - RHI Pipeline
            StatusLabel { icon: ""; value: Properties.rhi_pipeline; label: "" }
            // - StatusLabel.qml
        }
        // - Right Group

    }
    // - Status Items

    // Top Side Border
    Rectangle
    {
        id: statusBarTopBorder

        color: Properties.border
        height: 1

        anchors
        {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }
    // - Top Side Border
}
// - Info Bar