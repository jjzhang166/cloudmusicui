import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {

    Rectangle {
        id: pop_window
        color: "#ffffff"
        anchors.fill: parent
    }

    DropShadow {
        id: win_shadow
        source: pop_window
        anchors.fill: pop_window
        horizontalOffset: 1
        verticalOffset: 1
        radius: 8.0
        samples: 16
        color: "#80000000"
    }

    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: -10
        source: "qrc:/res/TopWindowFrame/header_center.png"
    }
}
