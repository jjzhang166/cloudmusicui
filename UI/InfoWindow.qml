import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Item {
    signal closeWin
    Rectangle {
        id: info_window
        color: "#fafafa"
        anchors.fill: parent

        TabView {
            id: tabView1
            width: parent.width
            height: parent.height - 20
            anchors.top: parent.top
            anchors.topMargin: 20
            style: TabViewStyle {
                tabsAlignment: Qt.AlignHCenter
                tab: Rectangle {
                    id: tabItem
                    color : styleData.selected ? "#7c7d85" :
                            styleData.hovered ? "#f5f5f7" : "#ffffff"
                    border.color: "#e5e5e5"
                    implicitWidth: 60
                    implicitHeight: 30
                    Text {
                        anchors.centerIn: parent
                        text: styleData.title
                        color: styleData.selected ? "#e5e5e7" : "#666666"
                    }
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        enabled: false
                    }
                }
            }

            Tab {
                title: qsTr("@me")
                Rectangle {
                    color: "#fafafa"
                    Text {
                        anchors.centerIn: parent
                        anchors.verticalCenterOffset: -170
                        text: qsTr("tab1:no msg")
                    }
                }
            }
            Tab {
                title: qsTr("inbox")
                Rectangle {
                    color: "#fafafa"
                    Text {
                        anchors.centerIn: parent
                        anchors.verticalCenterOffset: -170
                        text: qsTr("tab2:no msg")
                    }
                }
            }
            Tab {
                title: qsTr("comment")
                Rectangle {
                    color: "#fafafa"
                    Text {
                        anchors.centerIn: parent
                        anchors.verticalCenterOffset: -170
                        text: qsTr("tab3:no msg")
                    }
                }
            }
            Tab {
                title: qsTr("info")
                Rectangle {
                    color: "#fafafa"
                    Text {
                        anchors.centerIn: parent
                        anchors.verticalCenterOffset: -170
                        text: qsTr("tab4:no msg")
                    }
                }
            }
        }

        Image {
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            source: "qrc:/res/TopWindowFrame/icon_infowin_close.png"
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onEntered: parent.source = "qrc:/res/TopWindowFrame/icon_infowin_close_hover.png"
                onExited: parent.source = "qrc:/res/TopWindowFrame/icon_infowin_close.png"
                onClicked: closeWin()
            }
        }
    }

    DropShadow {
        id: win_shadow
        source: info_window
        anchors.fill: info_window
        horizontalOffset: -0.3
        verticalOffset: 1.3
        radius: 8.0
        samples: 16
        color: "#80000000"
    }

    Image {
        anchors.horizontalCenterOffset: -4
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: -10
        source: "qrc:/res/TopWindowFrame/header_center.png"
    }
}
