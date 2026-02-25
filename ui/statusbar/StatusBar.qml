import QtQuick
import QtQuick.Layouts

// Info Bar
Rectangle
{
    id: statusBar

    height: Math.max(parent.height * 1 / 43, 15)
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
            leftMargin: 12
            rightMargin: 12
        }

        // Left Group | Mesh, Vertex, Material
        Row
        {
            spacing: 16
            Layout.alignment: Qt.AlignVCenter

            // StatusLabel.qml
            // - Meshes
            StatusLabel { icon: "qrc:/qt/qml/BlendViewer/assets/icons/mesh.svg"; value: "0"; label: "Meshes" }
            // - Vertices
            StatusLabel { icon: "qrc:/qt/qml/BlendViewer/assets/icons/vertices.svg"; value: "0"; label: "Vertices" }
            // - Materials
            StatusLabel { icon: "qrc:/qt/qml/BlendViewer/assets/icons/materials.svg"; value: "0"; label: "Materials" }
            // - StatusLabel.qml
        }
        // - Left Group

        // Spacer
        Item
        {
            Layout.fillWidth: true
            Layout.minimumWidth: 8
        }
        // - Spacer

        // Right Group | FPS, RHI
        Row
        {
            spacing: 16
            Layout.alignment: Qt.AlignVCenter
            // StatusLabel.qml
            // - FPS Counter
            StatusLabel { icon: ""; value: "--"; label: "FPS:"; isFPS: true }
            // - Spacer
            StatusLabel { icon: ""; value: "|"; label: "" }
            // - RHI Pipeline
            StatusLabel { icon: ""; value: "D3D11"; label: "" }
            // - StatusLabel.qml
        }
        // - Right Group

    }
    // - Status Items

    // Top Side Border
    Rectangle
    {
        id: statusBarTopBorder

        color: "#2A3B4F"
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