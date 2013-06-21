import QtQuick 1.0

Image{
    width:360
    Image{
        source: "src/Button.png"
        id:manual
        Text{
            text:"Manual Update"
            font.pixelSize: 18
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea{ id:manualarea; anchors.fill:manual;onPressed: manual.source="src/ButtonPressed.png";onReleased:manual.source="src/Button.png"; }
    }
    Image{
        source: "src/Button.png"
        id:quit
        width:155
        anchors.left: manual.right
        Text{
            text:"Quit"
            font.pixelSize: 18
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea{ id:quitarea; anchors.fill:quit;onPressed: quit.source="src/ButtonPressed.png";onReleased:quit.source="src/Button.png"; onClicked: Qt.quit }
    }
}
