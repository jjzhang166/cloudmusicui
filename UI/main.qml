import QtQuick 2.4
import QtQuick.Controls 1.4
import QtWebView 1.1
import QtQuick.Window 2.0
import QtQuick.Controls.Styles 1.4

Window {
    id: window
    visible: true
    minimumHeight: 670
    minimumWidth: 1022
    onWidthChanged:  bf.current_window_width = width
    //CanvasCxt {
    //    anchors.fill: parent
    //}

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
        //height: 511
        anchors.top: tf.bottom
        anchors.topMargin: 0
        anchors.bottom: mv.top
        anchors.bottomMargin: 0
        width: 210
        style: ScrollViewStyle {
            incrementControl: Rectangle {opacity: 0}
            decrementControl: Rectangle {opacity: 0}
            scrollBarBackground: Rectangle {
                implicitHeight: rf.height
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

        property var rf_view: _rf
        RightListFrame {
            id: _rf
            width: 198
            height: rf.height//511
            scroll_height: rf.height
            onHeightChanged:
                if(height > rf.height) {
                    width = 186
                    rf.width = 198
                }
                else {
                    width = 198
                    rf.width = 210
                }
        }
    }

    Connections {
        target: rf.rf_view
        onRightviewChanged:
            switch(rf.rf_view.rightview) {
            case 0:
                centerframe.source = "qrc:/UI/CenterView/FindmusicView.qml"
                break
            case 4:
                centerframe.source = "qrc:/UI/CenterView/LocalmusicView.qml"
                break
            case 5:
                centerframe.source = "qrc:/UI/CenterView/DownloadmanagerView.qml"
                break
            }
    }

    Loader {
        id: centerframe
        x: 186
        y: tf.height
        width: parent.width - 186
        height: parent.height - tf.height - bf.height
        source: "qrc:/UI/CenterView/LocalmusicView.qml"
    }

    MusicView {
        z: 10
        x: 0
        id: mv
        width: 198//rf.width - 1
        height: 58
        anchors.bottom: bf.top
        anchors.bottomMargin: 0
        max_height: window.height - tf.height
        max_width: window.width
    }

    BottomFrame {
        id: bf
        z: 10
        width: parent.width
        height: 51
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        current_window_width: window.width
    }
}
