import QtQuick 2.0

Item {
    Rectangle {
        anchors.fill: parent
        color: "#fafafa"
        Image {
            id: img_cd
            x: 100
            y: 110
            rotation: 0
            source: "qrc:/res/MusicView/cd.png"
            transformOrigin: Item.Center
        }
        Image {
            id: img_cdpin
            x: 245
            y: 55
            transformOrigin: Item.TopLeft
            source: "qrc:/res/MusicView/cd_pin.png"
        }
        RotationAnimation {
            id: anim_play
            target: img_cdpin
            to: 30
            duration: 350
            running: false
            onStarted: anim_cdplaying.start()
        }
        RotationAnimation {
            id: anim_pause
            target: img_cdpin
            to: 0
            duration: 350
            running: false
            onStarted: anim_cdplaying.stop()
        }
        RotationAnimation {
            id: anim_cdplaying
            target: img_cd
            loops: Animation.Infinite
            from: img_cd.rotation
            to: img_cd.rotation + 360
            duration: 6500
        }

/*        Rectangle {
            id: cd_pint
            width: 20
            height: 10
            x: 235
            y: 50
            color: "red"
        }*/
    }
    MouseArea {
        anchors.fill: parent
        onClicked: anim_play.start()
        onDoubleClicked: anim_pause.start()
    }
}
