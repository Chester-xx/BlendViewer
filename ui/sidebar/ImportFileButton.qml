import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

// Import File Button
Button
{
    id: importFileButton
    
    flat: true
    width: parent.width * 9 / 10
    height: parent.height * 1 / 30
    scale: importFileButton.pressed ? 0.98 : 1

    anchors
    {
        top: appInfo.bottom
        horizontalCenter: parent.horizontalCenter
        topMargin: parent.height * 1 / 100
    }

    ToolTip
    {
        visible: importFileButton.hovered
        text: qsTr("Import a glTF model file into the viewer")
        delay: 1000
        timeout: 3000
    }

    // Scale Effect
    Behavior on scale
    {
        NumberAnimation
        {
            duration: 100
            easing.type: Easing.InOutQuad
        }
    }
    // - Scale Effect
        
    // Button Background
    background: Rectangle
    {
        color: importFileButton.pressed ? "#1A52C7" : importFileButton.hovered ? "#2563EB" : "#137FEC"
        radius: 7
        layer.enabled: true

        // Hover Effect
        Behavior on color
        {
            ColorAnimation
            {
                duration: 150
                easing.type: Easing.InOutQuad
            }
        }
        // - Hover Effect
    }
    // - Button Background

    // Button Label
    contentItem: Item
    {
        opacity: 1

        // Collection of Icon and Text
        Row
        {
            spacing: importFileButton.height * 1 / 10
            anchors.centerIn: parent

            // Icon
            Image
            {
                id: importIcon

                source: "qrc:/qt/qml/BlendViewer/assets/icons/import.svg"
                width: importFileButton.height * 7 / 12
                height: importFileButton.height * 7 / 12
                fillMode: Image.PreserveAspectFit
                mipmap: true

                anchors
                {
                    verticalCenter: parent.verticalCenter
                }
            }
            // - Icon

            // Label
            Text
            {
                text: qsTr("Import glTF Model")
                font.pixelSize: importFileButton.height * 1 / 3
                font.bold: true
                color: "#ffffff"

                anchors
                {
                    verticalCenter: parent.verticalCenter
                }
            }
            // - Label
        }
        // - Collection of Icon and Text
    }
    // - Button Label
}
// - Import File Button