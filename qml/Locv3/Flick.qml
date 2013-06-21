import QtQuick 1.0

Flickable{
    property bool getmapme: false
    id:flickable
    width: 200; height: 200
    flickDeceleration: 120
    contentWidth: 1000;//mapme.width+settings.width; //contentHeight: image.height

    Image { id: mapme; source: "src/MapMe2.png";anchors.verticalCenter: parent.verticalCenter

        MouseArea{anchors.fill:parent;onClicked:{getmapme=!getmapme;}
        }




    }
    Image { id: settings; source: "src/Memo.png";anchors.left: mapme.right; anchors.leftMargin: 25;anchors.verticalCenter: parent.verticalCenter}
    Image { id: quit; source: "src/close.png";anchors.left: settings.right; anchors.leftMargin: 25;anchors.verticalCenter: parent.verticalCenter

        MouseArea{id:quiter; anchors.fill:parent;onClicked: {obj.quit();}}

                }




}


