import QtQuick 1.0
import "LatLng.js" as JS
Rectangle{
    id:out
    width:360
    height:640
    property bool destroy :false
    onDestroyChanged: {if(destroy==true){destroy=false; out.destroy()} console.log("destd")}
    property bool show: false
    property bool saved:false
    property bool ask:false
    property int zoom: 14
    property double latitude: 0
    property double longitude : 0
    property string cidcalled:"0"
    function clickd(t1,t2){

        longitude=longitude-JS.getx(180,((t2-1)*60)+30,zoom);
        var n=JS.getx(320,((t1-1)*64)+32,zoom);
        latitude=latitude+n;
        if(zoom<17){
        zoom++;

        }
        //mainmap.mapload();
        dummy.mapload();
    }


Image {
    id: mainmap
    visible:show
    //source: "http://maps.googleapis.com/maps/api/staticmap?center="+latitude+","+longitude+"&zoom="+zoom+"&size=360x640&maptype=roadmap&sensor=false&bq=0.facebook.com/zout"
  /*  function mapload()
    {
        if(zoom==17)
     source= "http://maps.googleapis.com/maps/api/staticmap?center="+latitude+","+longitude+"&zoom="+zoom+"&size=360x640&maptype=roadmap&sensor=false&bq=0.facebook.com/zout&markers="+latitude+","+longitude;
        else
      source= "http://maps.googleapis.com/maps/api/staticmap?center="+latitude+","+longitude+"&zoom="+zoom+"&size=360x640&maptype=roadmap&sensor=false&bq=0.facebook.com/zout";
    }*/


Image{
    id:dummy
    visible:false
    function mapload()
    {
        if(zoom==17)
     source= "http://maps.googleapis.com/maps/api/staticmap?center="+latitude+","+longitude+"&zoom="+zoom+"&size=360x640&maptype=roadmap&sensor=false&bq=0.facebook.com/zout&markers="+latitude+","+longitude;
        else
      source= "http://maps.googleapis.com/maps/api/staticmap?center="+latitude+","+longitude+"&zoom="+zoom+"&size=360x640&maptype=roadmap&sensor=false&bq=0.facebook.com/zout";
    }
    onStatusChanged: {if(dummy.status==Image.Ready){mainmap.source=source;}
}
}








}




Column{
    id:c1
    Repeater{
        model:10
        Image{width:60;height:64;
            MouseArea{anchors.fill:parent; onClicked: clickd(index+1,"1");enabled:show}
        }

    }


}
Column{
    id:c2
    anchors.left: c1.right
    Repeater{
        model:10
        Image{width:60;height:64;
        MouseArea{anchors.fill:parent; onClicked: clickd(index+1,"2");enabled:show}}

    }


}
Column{
    id:c3
    anchors.left: c2.right
    Repeater{
        model:10
        Image{width:60;height:64;
        MouseArea{anchors.fill:parent; onClicked: clickd(index+1,"3");enabled:show}}

    }



}
Column{
    id:c4
    anchors.left: c3.right
    Repeater{
        model:10
        Image{width:60;height:64;
        MouseArea{anchors.fill:parent; onClicked: clickd(index+1,"4");enabled:show}}

    }


}
Column{
    id:c5
    anchors.left: c4.right
    Repeater{
        model:10
        Image{width:60;height:64;
        MouseArea{anchors.fill:parent; onClicked: clickd(index+1,"5");enabled:show}}

    }


}
Column{
    id:c6
    anchors.left: c5.right
    Repeater{
        model:10
        Image{width:60;height:64;
            MouseArea{anchors.fill:parent; onClicked: clickd(index+1,"6");enabled:show}
            }

    }


}


Text{
    id:zoomtext
    anchors.bottom: parent.bottom
    text:zoom
}



Image{
    id:zoombar
    enabled:show
    visible:show
    source:"src/ZoomBar.png"
    opacity:0.7
    anchors.bottom: parent.bottom
    MouseArea{anchors.fill:parent}
    Text{
        text:"  +  "
        font.pixelSize: 25
        anchors.verticalCenter: parent.verticalCenter
        anchors.left:parent.left
        anchors.leftMargin: 15
       MouseArea{anchors.fill:parent;onClicked: {if(zoom<17)zoom++;/*mainmap*/dummy.mapload();}}
    }

    Text{
        text:"  _  "
        font.pixelSize: 30
        anchors.verticalCenter: parent.verticalCenter
        anchors.right:parent.right
        anchors.rightMargin: 15
        anchors.verticalCenterOffset: -14
        MouseArea{anchors.fill:parent;onClicked: {zoom--;/*mainmap*/dummy.mapload();}}
    }
}/*
Rectangle{
    width:128
    height:60
    anchors.bottom:parent.bottom
    color:"black"
    opacity: 0.3
}

Image{
    id:zoomin
    source:"src/Zoom-in.png"
    anchors.bottom: parent.bottom
}
Image{
    id:zoomout
    source:"src/Zoom-out.png"
    anchors.left:zoomin.right
    anchors.bottom:parent.bottom
}*/

Image{
    id:pbar
   // visible:(/*mainmap*/dummy.progress!=0 && /*mainmap*/dummy.progress!=1)
    width:350
    source:"src/prbg.png"
    anchors.horizontalCenter: parent.horizontalCenter
    /**/opacity: 0
    Image{
        source: "src/prfg.png"
        width:parent.width*/*mainmap*/dummy.progress

    }
    states:State{name:"visible";when:dummy.progress!=0 && dummy.progress!=1
        PropertyChanges {target:pbar;opacity:0.8}
    }

    transitions: Transition {
                 from: ""; to: "visible"; reversible: true

                 ParallelAnimation {

                     NumberAnimation {target:pbar; properties:"opacity"; duration: 500; easing.type:Easing.InCurve}
                 }
             }

}
Image{
    source:"src/Search.png"
    visible:show
    opacity:0.7
    MouseArea{anchors.fill:parent;onClicked: cityqry()}
    anchors.left:zoombar.right
    anchors.verticalCenter: zoombar.verticalCenter

}

XmlListModel {
    id: xmlmodel
    source:"xml"

    query: "/GeocodeResponse/result"

    XmlRole { name: "lat"; query: "geometry/location/lat/string()" }
    XmlRole { name: "lng"; query: "geometry/location/lng/string()" }
    onStatusChanged: {
        if (xmlmodel.status == XmlListModel.Ready)
        {
          cityquery.spin=false;

            if(xmlmodel.count!=0){
            cityquery.spin=false;
            out.latitude=xmlmodel.get(0).lat
            out.longitude=xmlmodel.get(0).lng
            console.log (out.latitude)
            console.log (out.longitude)
            out.show=true;
            cityquery.click=true;
            out.zoom=14;
            //mainmap.mapload();
                dummy.mapload();
            delete cityquery
       }
            else
            {
                cityquery.stext="Error, <b>Try Again.<b>"
                cityquery.spin=false;
                xmlmodel.source="xml";
            }


    }
  }
}

CityQuery{
    id:cityquery
    property string stext:"<b>Submit<b>"


}

function cityqry(){
    xmlmodel.source="xml";
    out.show=false;
    cityquery.click=false;
    cityquery.stext="<b>Submit</b>"
}







Rectangle{
    id:simplysave
    width:300
    height:100
    color:"black"
    opacity:0
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter

    states:State{name:"shownsd"; when:saved
        PropertyChanges{target: simplysave;opacity:0.7}
    }
    transitions: Transition {
                 from: ""; to: "shownsd"; reversible: true

                 ParallelAnimation {

                     NumberAnimation {target:simplysave; properties:"opacity"; duration: 1000; easing.type:Easing.InBack}
                 }
             }

    Image{
        id:iicon
        source:"src/Info.png"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
    }
    Text{
        text:"Saved!"
        color:"white"
        font.pixelSize: 25
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: iicon.right
        anchors.leftMargin: 50
    }


}

Rectangle{
    id:saveornot
    width:300
    height:250
    color:"black"
    opacity:0
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter
    Image{
        id:srniicon
        source:"src/Info.png"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
    }
    Text{
        text:"CellID already exists, Overwrite?"
        color:"white"
        font.pixelSize: 25
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: srniicon.right
        anchors.leftMargin:8
        wrapMode: "WordWrap"
        width:parent.width
    }
    Text{
        text:"Yes"
        anchors.bottom: parent.bottom
        anchors.left: srniicon.left
        anchors.leftMargin: 20
        font.pixelSize:25
        color:"white"
        anchors.bottomMargin: 20
    }
    MouseArea{

        id:yes;width:150;height:70;
        anchors.bottom: parent.bottom;anchors.left: parent.left
        onClicked:{
            obj.overWrite(cidcalled,latitude,longitude);
            console.log("Called Overwrite"+cidcalled+latitude+longitude);
            ask=false;
            saved=true;
            out.destroy(2500);
            obj.onCid(cidcalled);
        }

    }
    Text{
        text:"No"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 30
        font.pixelSize:25
        color:"white"
        anchors.bottomMargin: 20
    }
    MouseArea{

        id:no;width:150;height:70;
        anchors.bottom: parent.bottom;anchors.right: parent.right
        onClicked:{
            ask=false;

        }

    }

    states:State{name:"shownsrn";when:ask
        PropertyChanges{target:saveornot;opacity:0.7}
    }

    transitions: Transition {
                 from: ""; to: "shownsrn"; reversible: true

                 ParallelAnimation {
                     NumberAnimation { properties: "opacity"; duration: 1000; easing.type: Easing.OutExpo}

                 }
             }

}
Image{
    id:tick
    source:"src/Tick.png"
    opacity:0
    visible:show
    anchors.top: mainmap.top
    anchors.left: mainmap.left
    MouseArea{
        id:tickclik;anchors.fill: parent;
        onClicked: {
            console.log("CID Save call function"+cidcalled+"-"+latitude+"-"+longitude);
            if(!obj.isSaved(cidcalled)){
            obj.saveLoc(cidcalled,latitude,longitude);
            obj.onCid(cidcalled);
            saved=true;
            out.destroy(2500);

            }
           else{
                  ask=true;
            }



        }


    }
    states:State{name:"visible";when:(zoom==17&& dummy.status!=Image.Loading)
        PropertyChanges{target:tick;opacity:0.8}
    }
    transitions: Transition{
        NumberAnimation{target:tick;properties:"opacity";duration:500;easing.type: Easing.InExpo}
    }

}

Image{
    visible:show
    source:"src/RedCircle.png"
    opacity:0.3
    anchors.top:parent.top
    anchors.right: parent.right
    MouseArea{anchors.fill:parent;onClicked: {out.destroy(); }}
}





}
