import QtQuick 1.0




Image {
    id: infobg
    property bool hidden: true
    source: "src/infobgc2.png"
    Text{
        text:"Position Updated"
        color:"white"
        font.pixelSize:30
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Text{
        id:infotext
        width:infobg.width-100
        wrapMode: "WordWrap"
        text:"Your New location is as follows as given"
        anchors.top:infobg.top
        anchors.topMargin: 70
        anchors.left: infobg.left
        anchors.leftMargin: 50
        font.pixelSize: 20

    }
    states:
        State {
        name: "up";when:hidden
        PropertyChanges {
            target: infobg
            y:-infobg.height
            opacity:0
        }
    }
    State {
        name: "down";when:!hidden
        PropertyChanges {
            target: infobg
            y:infobg.height
            opacity:1
        }
    }
  transitions:

        Transition { from: ""; to: "up";reversible:true
        ParallelAnimation {
            NumberAnimation { properties: "y,opacity"; duration: 1000; easing.type: Easing.InQuad}


        }
    }





}
