import QtQuick 2.0

Item {
    id: rightframe
    property int scroll_height
    property int rightview: 4

    Rectangle {
        id: rectangle1
        anchors.fill: parent
        color: "#f5f5f7"
        Text {
            id: item_recommand
            width: parent.width
            height: 35
            text: qsTr("Recommand")
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 8
            color: "#7d7d7d"
            verticalAlignment: Text.AlignTop
            font.pixelSize: 13
        }

        ListView {
            id: view_recommand
            interactive: false
            currentIndex: -1
            width: parent.width
            height: 160
            anchors.top: item_recommand.bottom
            anchors.topMargin: -3
            model: ListModel {
                ListElement {
                    icon: "qrc:/res/RightListFrame/icon_findmusic.png"
                    icon_press: "qrc:/res/RightListFrame/icon_findmusic_pressed.png"
                    label: qsTr("FindMusic")
                }

                ListElement {
                    icon: "qrc:/res/RightListFrame/icon_fm.png"
                    icon_press: "qrc:/res/RightListFrame/icon_fm_pressed.png"
                    label: qsTr("PrivateFM")
                }

                ListElement {
                    icon: "qrc:/res/RightListFrame/icon_mv.png"
                    icon_press: "qrc:/res/RightListFrame/icon_mv_pressed.png"
                    label: qsTr("MV")
                }

                ListElement {
                    icon: "qrc:/res/RightListFrame/icon_friend.png"
                    icon_press: "qrc:/res/RightListFrame/icon_friend_pressed.png"
                    label: qsTr("Friend")
                }
            }
            delegate: Item {
                id: recommandview_wrapper
                width: parent.width
                height: 32
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        cursorShape = Qt.PointingHandCursor
                        recommandview_text.color = "black"
                    }
                    onExited: {
                        cursorShape = Qt.ArrowCursor
                        if(!recommandview_wrapper.ListView.isCurrentItem)
                            recommandview_text.color = "#5c5c5c"
                    }
                    onClicked: {
                        view_music.currentIndex = -1
                        rightframe.rightview = index
                        view_recommand.currentIndex = index
                    }
                }
                Rectangle {
                    id: recommandview_itembg
                    anchors.fill: parent
                    color: recommandview_wrapper.ListView.isCurrentItem? "#e6e7ea" : "transparent"
                    Rectangle {
                        height: parent.height
                        width: 3
                        anchors.left: parent.left
                        color: recommandview_wrapper.ListView.isCurrentItem? "#c62f2f" : "transparent"
                    }
                }
                Row {
                    spacing: 9
                    anchors.left: parent.left
                    anchors.leftMargin: 16
                    anchors.verticalCenter: recommandview_itembg.verticalCenter
                    Image {
                        id: img_icon
                        source: recommandview_wrapper.ListView.isCurrentItem? icon_press : icon
                    }
                    Text {
                        id: recommandview_text
                        text: label
                        height: img_icon.height
                        verticalAlignment: Text.AlignVCenter
                        color: recommandview_wrapper.ListView.isCurrentItem? "black" : "#5c5c5c"
                    }
                }
            }
        }

        Text {
            id: item_music
            width: parent.width
            height: 35
            text: qsTr("MyMusic")
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.top: view_recommand.bottom
            anchors.topMargin: -24
            color: "#7d7d7d"
            verticalAlignment: Text.AlignTop
            font.pixelSize: 13
        }

        ListView {
            id: view_music
            interactive: false
            width: parent.width
            height: 160
            anchors.top: item_music.bottom
            anchors.topMargin: -3
            model: ListModel {
                ListElement {
                    icon: "qrc:/res/RightListFrame/icon_localmusic.png"
                    icon_press: "qrc:/res/RightListFrame/icon_localmusic_pressed.png"
                    label: qsTr("LocalMusic")
                }

                ListElement {
                    icon: "qrc:/res/RightListFrame/icon_download.png"
                    icon_press: "qrc:/res/RightListFrame/icon_download_pressed.png"
                    label: qsTr("DownloadManager")
                }

                ListElement {
                    icon: "qrc:/res/RightListFrame/icon_clouddisk.png"
                    icon_press: "qrc:/res/RightListFrame/icon_clouddisk_pressed.png"
                    label: qsTr("CloudDisk")
                }

                ListElement {
                    icon: "qrc:/res/RightListFrame/icon_songer.png"
                    icon_press: "qrc:/res/RightListFrame/icon_songer_pressed.png"
                    label: qsTr("MySonger")
                }

                ListElement {
                    icon: "qrc:/res/RightListFrame/icon_station.png"
                    icon_press: "qrc:/res/RightListFrame/icon_station_pressed.png"
                    label: qsTr("MyStation")
                }
            }
            delegate: Item {
                id: musicview_wrapper
                width: parent.width
                height: 32
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        cursorShape = Qt.PointingHandCursor
                        musicview_text.color = "black"
                    }
                    onExited: {
                        cursorShape = Qt.ArrowCursor
                        if(!musicview_wrapper.ListView.isCurrentItem)
                            musicview_text.color = "#5c5c5c"
                    }
                    onClicked: {
                        view_recommand.currentIndex = -1
                        rightframe.rightview = index + 4
                        view_music.currentIndex = index
                    }
                }
                Rectangle {
                    id: musicview_itembg
                    anchors.fill: parent
                    color: musicview_wrapper.ListView.isCurrentItem? "#e6e7ea" : "transparent"
                    Rectangle {
                        height: parent.height
                        width: 3
                        anchors.left: parent.left
                        color: musicview_wrapper.ListView.isCurrentItem? "#c62f2f" : "transparent"
                    }
                }
                Row {
                    spacing: 9
                    anchors.left: parent.left
                    anchors.leftMargin: 16
                    anchors.verticalCenter: musicview_itembg.verticalCenter
                    Image {
                        id: musicview_icon
                        source: musicview_wrapper.ListView.isCurrentItem? icon_press : icon
                    }
                    Text {
                        id: musicview_text
                        text: label
                        height: musicview_icon.height
                        verticalAlignment: Text.AlignVCenter
                        color: "#5c5c5c"
                    }
                }
            }
        }

        Rectangle {
            id: item_songlist
            anchors.top: view_music.bottom
            anchors.topMargin: 0
            width: parent.width - 1
            height: 30
            color: "#f5f5f7"

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    if(view_songlist.height == -1) {
                        btn_list.source = "qrc:/res/RightListFrame/btn_list_hover.png"
                        var vheight = (model_songlist.rowCount()) * 30
                        if(item_songlist.y + vheight > rightframe.height){
                            rightframe.height = item_songlist.y + vheight + 60 + view_collection.height
                            view_songlist.height = vheight
                        }
                        else{
                            view_songlist.height = vheight
                            rightframe.height = scroll_height + view_collection.height
                        }
                    }
                    else{
                        btn_list.source = "qrc:/res/RightListFrame/btn_list.png"
                        view_songlist.height = -1
                        rightframe.height=(view_collection.y + view_collection.height -30) > scroll_height ?
                                    view_collection.y + view_collection.height - 30:scroll_height;
                    }
                }
            }

            Text {
                height: parent.height
                anchors.left: parent.left
                anchors.leftMargin: 8
                text: "SongList"
                verticalAlignment: Text.AlignVCenter
                color: "#7d7d7d"
            }

            Image {
                anchors.right: btn_list.left
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/res/RightListFrame/btn_add.png"
            }

            Image {
                id: btn_list
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10
                source: "qrc:/res/RightListFrame/btn_list.png"
            }
        }

        ListView {
            id: view_songlist
            interactive: false
            width: parent.width
            height: -1
            anchors.top: item_songlist.bottom
            anchors.topMargin: 0
            model: ListModel {
                id: model_songlist
                ListElement {
                    tag: qsTr("MyFavorite")
                    icon: "qrc:/res/RightListFrame/icon_heart.png"
                }

                ListElement {
                    tag: qsTr("list_item1")
                    icon: "qrc:/res/RightListFrame/icon_music.png"
                }

                ListElement {
                    tag: qsTr("list_item2")
                    icon: "qrc:/res/RightListFrame/icon_music.png"
                }

                ListElement {
                    tag: qsTr("list_item3")
                    icon: "qrc:/res/RightListFrame/icon_music.png"
                }

                ListElement {
                    tag: qsTr("list_item4")
                    icon: "qrc:/res/RightListFrame/icon_music.png"
                }

                ListElement {
                    tag: qsTr("list_item5")
                    icon: "qrc:/res/RightListFrame/icon_music.png"
                }
            }
            delegate: Item {
                x: 5
                width: rightframe.width
                height: 30
                Row {
                    Image {
                        source: icon
                    }

                    Text {
                        text: tag
                        color: "#5c5c5c"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    spacing: 5
                }
            }
        }

        Rectangle {
            id: item_collection
            width: parent.width - 1
            height: 30
            color: "#f5f5f7"
            anchors.top: view_songlist.bottom
            anchors.topMargin: 0
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    if(view_collection.height == -1) {
                        btn_collection.source  = "qrc:/res/RightListFrame/btn_list_hover.png"
                        var vheight = (model_collection.rowCount() + 1) * 30
                        if(item_collection.y+vheight > rightframe.height) {
                            rightframe.height = item_collection.y + vheight
                            view_collection.height = vheight
                        }
                        else {
                            view_collection.height = vheight
                            rightframe.height = scroll_height
                        }
                    }
                    else {
                        btn_collection.source = "qrc:/res/RightListFrame/btn_list.png"
                        view_collection.height = -1
                        rightframe.height=(view_songlist.y + view_songlist.height + 30) > scroll_height ?
                                    view_songlist.y + view_songlist.height + 30 : scroll_height;
                    }
                }
            }
            Text {
                height: parent.height
                anchors.left: parent.left
                anchors.leftMargin: 8
                text: qsTr("CollectionList")
                verticalAlignment: Text.AlignVCenter
                color: "#7d7d7d"
            }
            Image {
                id: btn_collection
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10
                source: "qrc:/res/RightListFrame/btn_list.png"
            }
        }

        ListView {
            id: view_collection
            interactive: false
            width: parent.width
            height: -1
            anchors.top: item_collection.bottom
            anchors.topMargin: 0
            model: ListModel {
                id: model_collection
                ListElement {
                    tag: qsTr("list_item1")
                    icon: "qrc:/res/RightListFrame/icon_music.png"
                }
                ListElement {
                    tag: qsTr("list_item2")
                    icon: "qrc:/res/RightListFrame/icon_music.png"
                }
                ListElement {
                    tag: qsTr("list_item3")
                    icon: "qrc:/res/RightListFrame/icon_music.png"
                }
            }

            delegate: Item {
                x: 5
                width: rightframe.width
                height: 30
                Row {
                    Image {
                        source: icon
                    }

                    Text {
                        text: tag
                        color: "#5c5c5c"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    spacing: 5
                }
            }
        }
    }
}
