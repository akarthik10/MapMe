import QtQuick 1.0
Rectangle{
    property bool click:false
    property bool spin:false
    id:cityquery
    height:640
    width: 360
    opacity:0



Image{
    id:cityqry2
    source:"src/SideInfo.png"
    anchors.verticalCenter: parent.verticalCenter
   // anchors.right: parent.right
    width:360
    height:100
    x:360+cityqry2.width
    opacity:0

    TextEdit{
       id:citytext
       width:320
       height:70
       anchors.verticalCenter: parent.verticalCenter
       anchors.horizontalCenter: parent.horizontalCenter
       anchors.horizontalCenterOffset: 10
       anchors.verticalCenterOffset: 25
       wrapMode: "WordWrap"
    }
}

Image{
    id:cityqry1
    source:"src/SideInfoInv.png"
    anchors.bottom:cityqry2.top
   // anchors.left: parent.left
    width:360
    height:100
    x:-cityqry1.width
    opacity:0

    Text{
        text:"  Enter Your City or Address"
        font.pixelSize: 25
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
Image{
    id:cityqry3
    source:"src/SideInfoInv.png"
    anchors.top:cityqry2.bottom
    //anchors.left: parent.left
    width:360
    height:100
    x:-cityqry2.width
    opacity:0

    Text{
        text:stext
        font.pixelSize: 25
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

    }

    MouseArea{
      id:citysubmit
      onClicked:
      {
          //out.show=true;
          console.log("clicked");
          console.log(show);
          //cityquery.click=true;
          console.log(cityquery.click);
          spin=true;
          stext="Loading.."
          xmlmodel.source="http://maps.googleapis.com/maps/api/geocode/xml?address="+citytext.text +"&sensor=true&bq=0.facebook.com/zout"
      }
      anchors.fill:parent
    }

}

Image{
    id:cityqry4
    source:"src/SideInfo.png"
    anchors.top:cityqry3.bottom
   // anchors.right: parent.right
    width:360
    height:100
    x:360+cityqry2.width
    opacity:0
    visible: (latp !="0" && lonp!="0")

    Text{
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 25
        anchors.horizontalCenterOffset: 50
        font.pixelSize: 20
        text:"Or, Detect Nearest Location"
        //wrapMode: "WordWrap"
        width:parent.width
        height:parent.height-20
    }

    MouseArea{
        anchors.fill:parent
        onClicked:
        {
            out.zoom=16;
            out.latitude=latp;
            out.longitude=lonp;
            click=!click;
            out.show=true;
            dummy.mapload();
    }
    }


}


states: State {
                name: "hidden"; when :!click
                PropertyChanges {target: cityqry1;x:0; opacity:0.9}
                PropertyChanges {target: cityqry2;x:0;opacity:0.9}
                PropertyChanges {target: cityqry3;x:0;opacity:0.9}
                PropertyChanges {target: cityqry4;x:0;opacity:0.9}
                PropertyChanges{target:cityquery;opacity:0.9}

              }



        transitions: Transition {
                     from: ""; to: "hidden"; reversible: true

                     ParallelAnimation {
                         NumberAnimation { properties: "x,opacity"; duration: 1000; easing.type: Easing.OutExpo}
                      /*   NumberAnimation { properties: "opacity"; duration: 1000; easing.type: Easing.InExpo}*/

                     }
                 }


        Image {
            id: spinner
            visible:spin
            source: "src/sping.png"
            anchors.right:parent.right
            NumberAnimation on rotation {
                from:0; to:360
                duration: 700; loops: Animation.Infinite
            }
        }

     Image{
         source:"src/RedCircle.png"
         opacity:0.5
         anchors.top:parent.top
         anchors.left: parent.left
         MouseArea{anchors.fill:parent;onClicked: {click=true;out.destroy(1000); }}
     }

}
