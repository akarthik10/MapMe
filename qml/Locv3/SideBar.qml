import QtQuick 1.0

Image {
    id:mainimg
    property bool hidden: false
    width: 350
    height:350

    Image {
        width:320+60
        id: addressbar
        source: "src/SideInfo.png"
        height:latbar.height * 2.5
        Text {
            id: addresshead
            text: "Address:"
            font.pixelSize: 22
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.left: parent.left
            anchors.leftMargin: 35
            anchors.top:parent.top
            anchors.topMargin: 30

        }
        Text {
            id: addresstext
            text: address
            wrapMode: "WordWrap"
            font.pixelSize: 15
            anchors.left: parent.left
            anchors.leftMargin: 35
            anchors.top:addresshead.bottom
            anchors.bottom: addressbar.bottom
            anchors.right: parent.right
            anchors.rightMargin: 95

        }
    }


    Image{
        width:320+60
        id:latbar
        source: "src/SideInfo.png"
        anchors.top:addressbar.bottom

        Text {
            id: lathead
            text: "Lat:"
            font.pixelSize: 22
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 35
            anchors.top:parent.top
            anchors.topMargin: 16


        }
        Text{
            id:lattext
            text:lat
            font.pixelSize: 18
            anchors.left: lathead.left
            anchors.leftMargin: 50
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    Image{
        width: 320+60
        id:lonbar
        source: "src/SideInfo.png"
        anchors.top: latbar.bottom
        Text {
            id: lonhead
            text: "Lon:"
            font.pixelSize: 22
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 35
            anchors.top:parent.top
            anchors.topMargin: 16

        }
        Text{
            id:lontext
            text:lon
            font.pixelSize: 18
            anchors.left: lonhead.left
            anchors.leftMargin: 50
            anchors.verticalCenter: parent.verticalCenter
        }
    }


    states:
        State {
        name: "hidden"; when:hidden
        PropertyChanges {target:addressbar; x:360+addressbar.width}
        PropertyChanges {target:latbar; x:360+latbar.width }
        PropertyChanges {target:lonbar; x:360+lonbar.width }
    }
       State {
         name: "visible"; when:!hidden
          PropertyChanges {target:addressbar; x:360-addressbar.width}
          PropertyChanges {target:latbar; x:360-latbar.width}
          PropertyChanges {target:lonbar; x:360-lonbar.width}

}


      // MouseArea{id:tmparea; anchors.fill:addressbar; onClicked: if(hidden) hidden=false; else hidden=true}

       transitions: Transition {
                    from: ""; to: "hidden"; reversible: true

                    ParallelAnimation {

                        NumberAnimation {target:addressbar; properties:"x"; duration: 300; easing.type: Easing.InBack}
                        NumberAnimation {target:latbar; properties:"x"; duration: 600; easing.type:  Easing.InBack}
                        NumberAnimation {target:lonbar; properties:"x"; duration: 900; easing.type:  Easing.InBack}

                    }
                }



}
