import QtQuick

Rectangle
    {
        id: sideBar

        anchors
        {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }

        border
        {
            color: "#2A3B4F"
            width: 1
        }
    
        width: parent.width * 1/8
        height: parent.height
        color: "#111A22"

        Rectangle
        {
            id: appInfo

            anchors
            {
                top: parent.top
                left: parent.left
                right: parent.right
            }

            border
            {
                color: "#2A3B4F"
                width: 1
            }

            height: parent.height * 1/17
            color: "#0D141B"
        }

        Rectangle
        {
            id: cameraSpeed

            anchors
            {
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }

            border
            {
                color: "#2A3B4F"
                width: 1
            }

            height: parent.height * 1/17
            color: "#0D141B"
        }


    }