import QtQuick

// Info Bar
Rectangle
{
    id: infoBar

    height: Math.max(parent.height * 1 / 43, 15)
    color: "#101921"

    anchors
    {
        bottom: parent.bottom
        right: parent.right
        left: sideBar.right
    }

    // Right Side Border
    Rectangle
    {
        id: infoBarRightBorder
        
        color: "#2A3B4F"
        width: 1

        anchors
        {
            bottom: parent.bottom
            top: parent.top
            right: parent.right
        }
    }
    // - Right Side Border

    // Top Side Border
    Rectangle
    {
        id: infoBarTopBorder

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