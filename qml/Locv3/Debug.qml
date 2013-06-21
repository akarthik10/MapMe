import QtQuick 1.0
Image{
    id:mainimage
    function fn(text){
        obj.debugfn(text);
    }

TextEdit{
    id:tbox
    text:"Hello"
    height: 10
    width: 50
}


MouseArea{
    width:20
    height: 20
    onClicked: {mainimage.fn(tbox.text)}
}
}
