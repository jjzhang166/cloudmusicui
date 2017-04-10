import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Item {
    property int base_window_width: 1022
    property int current_window_width

    Rectangle {
        id: bframe
        anchors.fill: parent
        color: "#f6f6f8"
        border.color: "#e1e1e2"
        border.width: 1

        Rectangle {
            id: btn_prev
            width: 30
            height: 30
            color: "#e83c3c"
            radius: 16
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.verticalCenter: parent.verticalCenter
            border.width: 0
            Image {
                id: btn_prev_icon
                anchors.centerIn: parent
                source: "qrc:/res/BottomFrame/btn_presong.png"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    cursorShape = Qt.PointingHandCursor
                    parent.color = "#d33030"
                }
                onExited: {
                    cursorShape = Qt.ArrowCursor
                    parent.color = "#e83c3c"
                }
            }
        }

        Rectangle {
            id: btn_next
            width: 30
            height: 30
            color: "#e83c3c"
            radius: 16
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: btn_play.right
            anchors.leftMargin: 24
            border.width: 0
            Image {
                id: btn_next_icon
                anchors.centerIn: parent
                source: "qrc:/res/BottomFrame/btn_nextsong.png"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    cursorShape = Qt.PointingHandCursor
                    parent.color = "#d33030"
                }
                onExited: {
                    cursorShape = Qt.ArrowCursor
                    parent.color = "#e83c3c"
                }
            }
        }

        Rectangle {
            id: btn_play
            width: 33
            height: 33
            color: "#e83c3c"
            radius: 18
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: btn_prev.right
            anchors.leftMargin: 24
            border.width: 0
            Image {
                id: btn_play_icon
                anchors.centerIn: parent
                source: "qrc:/res/BottomFrame/btn_play.png"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    cursorShape = Qt.PointingHandCursor
                    parent.color = "#d33030"
                }
                onExited: {
                    cursorShape = Qt.ArrowCursor
                    parent.color = "#e83c3c"
                }
            }
        }

        Text {
            id: cur_time
            text: qsTr("00:00")
            color: "#333333"
            anchors.left: btn_next.right
            anchors.leftMargin: 32
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
        }

        Slider {
            id: playSlider
            width: 438 + (current_window_width - base_window_width)
            height: 22
            anchors.left: cur_time.right
            anchors.leftMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            style: SliderStyle {
                handle: Item {
                    implicitWidth: 14
                    implicitHeight: 14
                    Rectangle {
                        id: _handle
                        anchors.centerIn: parent
                        color: "#ffffff"
                        border.width: 1
                        border.color: "#c6c6c6"
                        implicitWidth: parent.implicitWidth
                        implicitHeight: parent.implicitHeight
                        radius: 10
                        Rectangle {
                            anchors.centerIn: parent
                            color: "#e83c3c"
                            radius: 5
                            implicitHeight: 4
                            implicitWidth: 4
                        }
                    }

                    Glow {
                        anchors.fill: _handle
                        enabled: false
                        spread: 0.0
                        visible: control.hovered ?
                                     true : false
                        fast: true
                        color: "gray"
                        source: _handle
                    }
                }
                groove: Rectangle {
                    implicitWidth: playSlider.width
                    implicitHeight: 5
                    color: "#c2c2c4"
                    radius: 3
                    Rectangle {
                        implicitWidth: styleData.handlePosition
                        implicitHeight: 5
                        color: "#e83c3c"
                        radius: 3
                    }
                }
            }

            MouseArea {
                anchors.fill: parent
                enabled: false
                cursorShape: playSlider.hovered ?
                                 Qt.PointingHandCursor : Qt.ArrowCursor
            }
        }

        Text {
            id: total_time
            text: qsTr("99:99")
            color: "#333333"
            anchors.left: playSlider.right
            anchors.leftMargin: 11
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
        }

        Image {
            id: icon_vol
            anchors.left: total_time.right
            anchors.leftMargin: 24
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/res/BottomFrame/icon_vol.png"
        }

        Slider {
            id: volSlider
            width: 98
            height: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: icon_vol.right
            anchors.leftMargin: 5
            style: SliderStyle {
                handle: Rectangle {
                    id: vol_handle
                    anchors.centerIn: parent
                    //color: "#ffffff"
                    //border.width: 1
                    border.color: "#c6c6c6"
                    state: ma1.containsMouse?"normal_handle":"hide_handle"
                    //implicitWidth: 12
                    //implicitHeight: 12
                    radius: 10
                    Rectangle {
                        anchors.centerIn: parent
                        color: "#e83c3c"
                        radius: 5
                        implicitHeight: 4
                        implicitWidth: 4
                    }
                    states: [
                        State {
                            name: "normal_handle"
                            changes: PropertyChanges {
                                target: vol_handle
                                color: "#ffffff"
                                border.width: 1
                                implicitHeight: 12
                                implicitWidth: 12
                            }
                        },
                        State {
                          name: "hide_handle"
                          changes: PropertyChanges {
                              target: vol_handle
                              visible: control.value===0?false:true
                              color: "#e83c3c"
                              border.width: 0
                              implicitWidth: 0
                              implicitHeight: 12
                          }
                        }
                    ]
                }
                groove: Rectangle {
                    implicitWidth: volSlider.width
                    implicitHeight: 4
                    color: "#e6e6e8"
                    Rectangle {
                        implicitWidth: styleData.handlePosition
                        implicitHeight: 4
                        color: "#e83c3c"
                        radius: 3
                    }
                }
            }
            MouseArea {
                id: ma1
                anchors.fill: parent
                acceptedButtons: Qt.NoButton
                hoverEnabled: true
            }
        }
    }

    Image {
        id: songlist
        anchors.right: parent.right
        anchors.rightMargin:14
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/res/BottomFrame/songlist.png"
    }

    Image {
        id: lyric
        anchors.right: songlist.left
        anchors.rightMargin: 16
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/res/BottomFrame/lyric.png"
    }

    Image {
        id: playcontrol
        anchors.right: lyric.left
        anchors.rightMargin: 18
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/res/BottomFrame/listcycle.png"
    }
}
