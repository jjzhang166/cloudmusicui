import QtQuick 2.0

Item {
    signal viewSizeChanged(string dst)
    id: view_wrapper
    onViewSizeChanged: {
        if(dst == "max") {
            viewloader.source = "qrc:/UI/MusicView_Max.qml"
            anim_max.start()
        }
    }

    property int max_height
    property int max_width
    ParallelAnimation {
        id: anim_max
        running: false
        PropertyAnimation {
            target: view_wrapper
            property: "height"
            to: max_height
            duration: 380
            easing.type: Easing.OutCubic
        }
        PropertyAnimation {
            target: view_wrapper
            property: "width"
            to: max_width
            duration: 380
            easing.type: Easing.OutCubic
        }
        NumberAnimation {
            target: view_wrapper
            property: "opacity"
            from: 0
            to: 1
            duration: 1000
            easing.type: Easing.OutCubic
        }
    }

    property int min_height
    property int min_width
    ParallelAnimation {
        id: anim_min
        running: false
        PropertyAnimation {
            target: view_wrapper
            property: "height"
            to: min_height
            duration: 380
        }
        PropertyAnimation {
            target: view_wrapper
            property: "width"
            to: min_width
            duration: 380
        }
    }

    Loader {
        id: viewloader
        anchors.fill: parent
        sourceComponent: min_view
    }

    Component {
        id: min_view
        Rectangle {
            color: "#f5f5f7"
            border.width: 1
            border.color: "#e1e1e2"
            Image {
                id: cover
                x: -2
                y: 0
                source: "qrc:/res/MusicView/cover.png"
            }
            MouseArea {
                anchors.fill: cover
                hoverEnabled: true
                onEntered: {
                    cover.source = "qrc:/res/MusicView/cover_mask.png"
                    cursorShape = Qt.PointingHandCursor
                }
                onExited: {
                    cover.source = "qrc:/res/MusicView/cover.png"
                    cursorShape = Qt.ArrowCursor
                }
                onClicked: viewSizeChanged("max")
            }
        }
    }
}
