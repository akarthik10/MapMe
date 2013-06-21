import QtQuick 1.0
Image{
    property bool hidden: false
    id:mimg
    height:300
    width:150

Image{
    id:peepbar
    height:300
    width:100
    source: "src/SidePeep.png"
    Text{
        id:mcchead
        text:"MCC"
        font.pixelSize: 18
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:parent.top
        anchors.topMargin: 25
    }
    Text{
        id:mcctext
        text:mcc
        font.pixelSize: 14
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:mcchead.bottom
        anchors.topMargin: 5
    }
    Text{
        id:mnchead
        text:"MNC"
        font.pixelSize: 18
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:mcctext.bottom
        anchors.topMargin: 15
    }
    Text{
        id:mnctext
        text:mnc
        font.pixelSize: 14
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:mnchead.bottom
        anchors.topMargin: 5
    }
    Text{
        id:lachead
        text:"LAC"
        font.pixelSize: 18
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:mnctext.bottom
        anchors.topMargin: 15
    }
    Text{
        id:lactext
        text:lac
        font.pixelSize: 14
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:lachead.bottom
        anchors.topMargin: 5
    }
    Text{
        id:cidhead
        text:"CID"
        font.pixelSize: 18
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:lactext.bottom
        anchors.topMargin: 15
    }
    Text{
        id:cidtext
        text:cid
        font.pixelSize: 14
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:cidhead.bottom
        anchors.topMargin: 5
    }

    states:
        State{
        name:"visible";when:hidden;
       PropertyChanges {target:peepbar;x:-peepbar.width}
    }
        State{
            name:"hidden";when:!hidden;
            PropertyChanges{target:peepbar;x:peepbar.width}
        }
        // MouseArea{id:marea;anchors.fill:peepbar;onClicked: if(hidden==true) hidden=false; else hidden=true}

        transitions: Transition {
                     from: ""; to: "visible"; reversible: true

                     ParallelAnimation {

                         NumberAnimation {target:peepbar; properties:"x"; duration: 500; easing.type:Easing.InBack}
                     }
                 }

}
}
