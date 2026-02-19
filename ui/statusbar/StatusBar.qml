import QtQuick

// Info Bar
Rectangle
{
    id: infoBar
    anchors
    {
        bottom: parent.bottom
        right: parent.right
        left: sideBar.right
    }
    height: parent.width * 1/80 + 1
    color: "#101921"

    // Right Side Border
    Rectangle
    {
        id: infoBarRightBorder
        
        anchors
        {
            bottom: parent.bottom
            top: parent.top
            right: parent.right
        }

        color: "#2A3B4F"
        width: 1
    }
    // - Right Side Border

    // Top Side Border
    Rectangle
    {
        id: infoBarTopBorder
        anchors
        {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        color: "#2A3B4F"
        height: 1
    }
    // - Top Side Border

}
// - Info Bar