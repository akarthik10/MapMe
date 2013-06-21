import QtQuick 1.0
Rectangle{
    width:360
    height:640
    color:"transparent"
property bool showmenu:false
    //property bool showmapmein:false

    Image{
        id:menubar
        source: "src/locationInput.png"
        width:360
        height:150
        y:parent.height
    }
   /* Image{
        id:setbar
        source:"src/SideInfoInv.png"
        width:180
        y:parent.height-height
        Text{
            text:"Settings"
            font.pixelSize: 23
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -10
        }
        MouseArea{anchors.fill:parent;onClicked: showmenu=true}
    }*/
    Image{
        id:setbar
        source:"src/Settings.png"
        y:parent.height-height;
        MouseArea{anchors.fill:parent;onClicked: showmenu=true}
    }

   /* Image{
        id:backimage
        source:"src/SideInfo.png"
        width:250
        y:menubar.y-height
        x:parent.width+width-100
        opacity:0
        MouseArea{anchors.fill:parent;onClicked: showmenu=false}

        Text{
            text:"Back"
            font.pixelSize: 23
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -30
        }

    }*/
    Image{
        id:backimage
        y:menubar.y-height
        x:parent.width+width//-100
        opacity:1
        source:"src/Back.png"
        MouseArea{anchors.fill:parent;onClicked: showmenu=false}

    }

   /* Image{
        id:manualupd
        source:"src/Button.png"
        width:500
        y:parent.height+height
        x:-50
        opacity:0
        MouseArea{anchors.fill:parent;}

        Text{
            text:"Manual Update"
            font.pixelSize: 23
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

    }*/
   /* Image{
        id:menutitle
        source:"src/SideInfoInv.png"
        width:300
        x:-width
        opacity:0
        anchors.top:backimage.top
    }*/

    Flick{
        id:flick
anchors.verticalCenter: menubar.verticalCenter
    }



MapMeIn{
    id:mapmein
    show: flick.getmapme

}





       states:
        State{
            name:"showmenu";when:showmenu;
            PropertyChanges{target:menubar;y:parent.height-height;opacity:0.8}
            PropertyChanges{target:setbar; x:-width ;opacity:0}
            //PropertyChanges{target:backimage;x:parent.width-width+100;opacity:0.8}
            PropertyChanges{target:backimage;x:parent.width-width;opacity:0.8}
            //PropertyChanges{target:manualupd;y:parent.height-menubar.height-height;opacity:0.8}
            //PropertyChanges{target:menutitle;x:0;opacity:0.8}
        }


        transitions: Transition {
                     from: ""; to: "showmenu"; reversible: true

                     ParallelAnimation {

                         NumberAnimation {target:menubar; properties:"y,opacity"; duration: 1500; easing.type:Easing.InOutExpo}
                         //NumberAnimation {target:manualupd; properties:"y,opacity"; duration: 1400; easing.type:Easing.InOutExpo}
                         NumberAnimation {target:setbar; properties:"x,opacity"; duration: 1500; easing.type:Easing.OutExpo}
                         NumberAnimation {target:backimage; properties:"x,opacity"; duration: 500; easing.type:Easing.InExpo}
                         //NumberAnimation {target:menutitle; properties:"x,opacity"; duration: 1500; easing.type:Easing.InCurve}


                     }
                 }







}
