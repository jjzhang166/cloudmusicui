import QtQuick 2.0

FocusScope {
    id: wrapper

    property alias text: input.text
    property alias hint: hint.text
    property int font_size: 13
    property var window_loader: null

    signal accepted
    onFocusChanged: {
        if(focus) {
            hint.opacity = 0
            window_loader.source = "qrc:/PopWindow.qml"
        }
        else {
            hint.opacity = 1
            input.text = ""
            window_loader.source = ""
        }
    }

    Rectangle {
        id: rectangle1
        anchors.fill: parent
        border.color: "#a82828"
        color: "#a82828"
        radius: 4

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.IBeamCursor
        }

        Text {
            id: hint
            width: 180
            height: parent.height
            verticalAlignment: Text.AlignVCenter
            text: "Enter word"
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: font_size
            color: "#c77373"
        }

        TextInput {
            id: input
            width: 180
            height: parent.height
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: font_size
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            onAccepted: wrapper.accepted()
        }
    }
}
