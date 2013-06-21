import QtQuick 1.0

Rectangle {
    property bool show:false
    onShowChanged: {if(show==true)submit.text="<b>Save</b>"}
width:360
height:510
color:"transparent"
Rectangle{
    id:mrect
    width:360
    height:510
    color:"white"
    opacity:0
}

Image{
    id:b2
    source:"src/SideInfo.png"
    anchors.verticalCenter: parent.verticalCenter
    width:360
    height:100
    x:360
    opacity:0

    TextEdit{
       id:scode
       width:320
       height:70
       anchors.verticalCenter: parent.verticalCenter
       anchors.horizontalCenter: parent.horizontalCenter
       anchors.horizontalCenterOffset: 10
       anchors.verticalCenterOffset: 25
       wrapMode: "WordWrap"
       font.pixelSize: 25
       text:scodetext
    }

}
Image{
    id:b1
    source:"src/SideInfoInv.png"
    anchors.bottom: b2.top
    width:360
    height:100
    x:-width
    opacity:0
    Text{
        id:title
        text:"Enter your MapME Shortcode"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 24
    }

}
Image{
    id:b3
    source:"src/SideInfoInv.png"
    anchors.top:b2.bottom
    width:360
    height:100
    x:-width
    opacity:0

    Text{
        id:submit
        text:"<b>Save</b>"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 24
    }
    MouseArea{id:mse;anchors.fill:parent;onClicked: {if(scode.text.length!=8){submit.text="Enter 8 Characters Only"}else{submit.text="<b>Saved!</b>";flick.getmapme=!flick.getmapme;obj.savescode(scode.text)}}}
}
states: State{name:"visible";when:show
    PropertyChanges{target: mrect;opacity:0.6}
    PropertyChanges{target:b1;x:0;opacity:0.8}
    PropertyChanges{target:b2;x:0;opacity:0.8}
    PropertyChanges{target:b3;x:0;opacity:0.8}
    }

transitions: Transition {
             from: ""; to: "visible"; reversible: true

             ParallelAnimation {

                 NumberAnimation {target:mrect; properties:"opacity"; duration:1000; easing.type: Easing.OutExpo}
                 NumberAnimation {target:b1; properties:"x,opacity"; duration:1000; easing.type:  Easing.OutExpo}
                 NumberAnimation {target:b2; properties:"x,opacity"; duration:1000; easing.type:  Easing.OutExpo}
                 NumberAnimation {target:b3; properties:"x,opacity"; duration:1000; easing.type:  Easing.OutExpo}

             }
         }
}
