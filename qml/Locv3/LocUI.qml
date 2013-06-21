import QtQuick 1.0

Rectangle {
    property string mcc: mccvar
    property string mnc: mncvar
    property string lac: lacvar
    property string cid: cidvar
    property string lat: latvar
    property string lon: lonvar
    property string address: addressvar
    property bool loader: loadervar
    property bool peepbar: peepbarvar
    property bool sbar: sidebarvar

    id:main
    width: 360
    height: 640
    property bool ld: true




    Rectangle{
        id:info
        color:"black"
        opacity:0
        width:300
        height:300
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -45

        Text{
            id:phead
            text:"Sending Data.."
            font.pixelSize: 25
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text{
           id:content
           anchors.verticalCenter: parent.verticalCenter
           anchors.horizontalCenter: parent.horizontalCenter
           font.pixelSize: 22
           color:"white"
           text:"MCC : "+mccvar+"\n\nMNC : "+mncvar+"\n\nLAC : "+lacvar+"\n\nCID : "+cidvar

        }

        states:State{

            name:"visible";when:(!peepbar && !sbar);
            PropertyChanges{target:info;opacity:0.7}
        }
        transitions: Transition {
                         from: ""; to: "visible"; reversible: true

                         ParallelAnimation {

                             NumberAnimation {target:info; properties:"opacity"; duration: 1000; easing.type:Easing.InBack}
                         }
                     }

    }





StatusBar{
    id:statusbar
    anchors.top:parent.top
    state:"hidden"
    loading:loader

}

Image{
    id:infobar
    source:"src/InfoBGI.png"
    width:main.width
    x:0
    y:0
    height:70
    Text {
        id: infotext
        text: infotxt
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        wrapMode: "WordWrap"
        font.pixelSize: 17
    }
    MouseArea{anchors.fill: parent;enabled:tapmode;onClicked: { var component = Qt.createComponent("Mapview.qml");var mapview = component.createObject(main, {"x": 0, "y": 0}); mapview.cidcalled = cid;}}
    states:
        State {
        name: "hidden"; when:loader
        PropertyChanges {target:infobar; y:-100;opacity:0}
    }
    transitions: Transition {
                 from: ""; to: "hidden"; reversible: true
                   NumberAnimation {target:infobar; properties:"y,opacity"; duration: 1300; easing.type: Easing.OutExpo}
                 }

}




SidePeep{
id:sidepeep
anchors.left: parent.left
anchors.leftMargin: -17
anchors.top:sidebar.top
hidden:!peepbar

}
SideBar{
    id:sidebar
    anchors.right: parent.right
    anchors.rightMargin: -60
    anchors.top:statusbar.bottom
    hidden: !sbar
}
Image{

id:codenotset
opacity:0
source:"src/Info.png"
anchors.top:info.bottom
anchors.topMargin: 10
Text{

    Timer {
             id:timer
             interval: 5000; running: false; repeat: false
             onTriggered:codenotset.state="";
         }
    id:codenottext
    text:codenotfound
    width:main.width-parent.width-30
    wrapMode: "WordWrap"
    anchors.left: parent.right
    anchors.leftMargin: 10
    anchors.verticalCenter: parent.verticalCenter
    font.pixelSize: 25
    onTextChanged: {timer.running=true;}
}
states:State{name:"shown"; when:shownocode;
    PropertyChanges{target:codenotset;opacity:1}
}
transitions:Transition{
    from:"";to:"shown";reversible: true
    NumberAnimation{target:codenotset; properties:"opacity";duration: 2000; easing.type: Easing.InExpo}
}
}

BottomBar{

}

/*Text{
    text:"Dummy"
    MouseArea{anchors.fill:parent;onClicked: { var component = Qt.createComponent("Mapview.qml");var mapview = component.createObject(main, {"x": 0, "y": 0}); mapview.cidcalled = cid;}}
}*/




}
