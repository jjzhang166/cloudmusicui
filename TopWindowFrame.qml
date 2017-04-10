import QtQuick 2.0

Item {
    id: topframe

    MouseArea {
        anchors.fill: parent
        onClicked: {
            search_line.focus = false
        }
    }

    Loader {
        id: popwindow_loader
        z: 999
        width: 222
        height: 323
        anchors.left: parent.left
        anchors.leftMargin: 260
        anchors.top: parent.top
        anchors.topMargin: 50
    }

    Loader {
        id: infowindow_loader
        z: 999
        width: 360
        height: 580
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.right: parent.right
        anchors.rightMargin: 0
        Connections {
            target: infowindow_loader.item
            onCloseWin: {
                infowindow_loader.source = ""
            }
        }
    }

    Rectangle {
        id: rectangle1
        anchors.fill: parent
        color: "#c62f2f"

        Image {
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/res/top_frame/res/TopWindowFrame/Logo.png"
        }

        Image {
            id: btn_close
            anchors.right: parent.right
            anchors.rightMargin: 18
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/res/top_frame/res/TopWindowFrame/icon_close.png"
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onEntered: btn_close.source = "qrc:/res/top_frame/res/TopWindowFrame/icon_close_hover.png"
                onExited: btn_close.source = "qrc:/res/top_frame/res/TopWindowFrame/icon_close.png"
                onClicked: Qt.quit()
            }
        }

        Image {
            id: btn_max
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 40
            source: "qrc:/res/top_frame/res/TopWindowFrame/icon_max.png"
            MouseArea {
                property int max_winheight: -1
                id: maxmouse_area
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onEntered: btn_max.source = "qrc:/res/top_frame/res/TopWindowFrame/icon_max_hover.png"
                onExited: btn_max.source = "qrc:/res/top_frame/res/TopWindowFrame/icon_max.png"
                onClicked: {
                    if(max_winheight == -1) {
                        window.showMaximized()
                        max_winheight = window.height
                        return
                    }
                    if(window.height == max_winheight)
                        window.showNormal()
                    else
                        window.showMaximized()
                }
            }
        }

        Image {
            id: btn_min
            anchors.right: parent.right
            anchors.rightMargin: 62
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/res/top_frame/res/TopWindowFrame/icon_min.png"
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onEntered: btn_min.source = "qrc:/res/top_frame/res/TopWindowFrame/icon_min_hover.png"
                onExited: btn_min.source = "qrc:/res/top_frame/res/TopWindowFrame/icon_min.png"
                onClicked: window.showMinimized()
            }
        }

        Image {
            id: btn_cute
            anchors.right: parent.right
            anchors.rightMargin: 84
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/res/top_frame/res/TopWindowFrame/icon_cute.png"
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onEntered: btn_cute.source = "qrc:/res/top_frame/res/TopWindowFrame/icon_cute_hover.png"
                onExited: btn_cute.source = "qrc:/res/top_frame/res/TopWindowFrame/icon_cute.png"
            }
        }

        Rectangle {
            width: 50
            height: 20
            color: "#c62f2f"
            radius: 3
            anchors.left: parent.left
            anchors.leftMargin: 190
            border.width: 1
            border.color: "#a82828"
            anchors.verticalCenter: parent.verticalCenter

        }

        SearchLine {
            id: search_line
            width: 190
            height: 19
            z: 1
            window_loader: popwindow_loader
            anchors.left: parent.left
            anchors.leftMargin: 260
            anchors.verticalCenter: parent.verticalCenter
        }

        Rectangle {
            id: rectangle2
            width: 220
            height: 22
            color: "#a82828"
            radius: 11
            border.color: "#a82828"
            anchors.left: parent.left
            anchors.leftMargin: 255
            anchors.verticalCenter: parent.verticalCenter
        }

        Image {
            id: image1
            y: 0
            anchors.left: rectangle2.right
            anchors.leftMargin: -20
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/res/top_frame/res/TopWindowFrame/icon_search.png"
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
            }
        }

        Image {
            anchors.right: parent.right
            anchors.rightMargin: 117
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/res/top_frame/res/TopWindowFrame/SplitLine.png"
        }

        Image {
            id: btn_setting
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 135
            source: "qrc:/res/top_frame/res/TopWindowFrame/icon_Setting.png"
        }

        Image {
            id: btn_info
            anchors.right: btn_setting.left
            anchors.rightMargin: 25
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/res/top_frame/res/TopWindowFrame/icon_Info.png"
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true
                onEntered: btn_info.source = "qrc:/res/top_frame/res/TopWindowFrame/icon_Info_hover.png"
                onExited: btn_info.source = "qrc:/res/top_frame/res/TopWindowFrame/icon_Info.png"
                onClicked:  if(infowindow_loader.source=="")
                                infowindow_loader.source = "qrc:/InfoWindow.qml"
                            else
                                infowindow_loader.source = ""

            }
        }

        Image {
            id: btn_theme
            anchors.right: btn_info.left
            anchors.rightMargin: 25
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/res/top_frame/res/TopWindowFrame/icon_Theme.png"
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true
                onEntered: btn_theme.source = "qrc:/res/top_frame/res/TopWindowFrame/icon_Theme_hover.png"
                onExited: btn_theme.source = "qrc:/res/top_frame/res/TopWindowFrame/icon_Theme.png"
            }
        }
    }
}
