import QtQuick 1.0
Image {
    property bool loading: !false
    id: spinbg
    source: "src/locationInput3.png"
    height: 100
    width: 350
    Image {
        id: spinner
        source: "src/sping.png"
        anchors.right:parent.right
        NumberAnimation on rotation {
            from:0; to:360
            duration: 700; loops: Animation.Infinite
        }
    }
    Text {
        id: statustext
        text: "    Posting Data.."
        font.pixelSize: 20
        anchors.verticalCenter: parent.verticalCenter

    }

    states: State {
                    name: "hidden"; when :!loading
                    PropertyChanges {target: spinbg; x:-spinbg.width; opacity:0}
                  }
            State {
                    name: "visible"; when: loading
                    PropertyChanges {target: spinbg; anchors.right: parent.left; opacity:1}
                   }


    transitions: Transition {
                 from: ""; to: "hidden"; reversible: true

                 ParallelAnimation {
                     NumberAnimation { properties: "x,opacity"; duration: 900; easing.type: Easing.InExpo}

                 }
             }


}

