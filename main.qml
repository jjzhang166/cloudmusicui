import QtQuick 2.4
import QtQuick.Controls 1.4
import QtWebView 1.1
import QtQuick.Window 2.0
import QtQuick.Controls.Styles 1.4

Window {
    id: window
    visible: true
    height: 670
    width: 1022

    CanvasCxt {
        anchors.fill: parent
    }

    TopWindowFrame {
        id: tf
        z: 999
        height: 50
        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: 0
    }

    ScrollView {
        id: rf
        z: 10
        height: 511
        anchors.top: tf.bottom
        anchors.topMargin: 0
        width: 210
        style: ScrollViewStyle {
            incrementControl: Rectangle {opacity: 0}
            decrementControl: Rectangle {opacity: 0}
            scrollBarBackground: Rectangle {
                implicitHeight: 511
                implicitWidth: 12
                color: "#f5f5f7"
            }
            handle: Rectangle {
                anchors.centerIn: parent
                implicitWidth: 10
                color:
                    (styleData.hovered || styleData.pressed)?
                        "#cfcfd1" : "#e1e1e2"
                radius: 5
            }
        }

        RightListFrame {
            width: 198
            height: 511
        }
    }

    MusicView {
        z: 10
        id: musicView1
        width: rf.width - 1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: rf.bottom
        anchors.topMargin: 0
    }

    BottomFrame {
        z: 10
        width: parent.width
        height: 48
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
    }
}
