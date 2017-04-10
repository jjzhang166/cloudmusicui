import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Item {

    Rectangle {
        id: bframe
        anchors.fill: parent
        color: "#f6f6f8"
        border.color: "#e1e1e2"
        border.width: 1

        Rectangle {
            id: btn_prev
            width: 32
            height: 32
            color: "#e83c3c"
            radius: 16
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.verticalCenter: parent.verticalCenter
            border.width: 0
        }

        Rectangle {
            id: btn_next
            width: 32
            height: 32
            color: "#e83c3c"
            radius: 16
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: btn_play.right
            anchors.leftMargin: 24
            border.width: 0
        }

        Rectangle {
            id: btn_play
            width: 36
            height: 36
            color: "#e83c3c"
            radius: 18
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: btn_prev.right
            anchors.leftMargin: 24
            border.width: 0
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
            width: 487
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
            anchors.leftMargin: 9
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
        }

        Image {
            id: icon_vol
            anchors.left: total_time.right
            anchors.leftMargin: 24
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/res/bottom_frame/res/BottomFrame/icon_vol.png"
        }

        Slider {
            id: volSlider
            width: 100
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
}
