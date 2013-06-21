
var offset=268435456;
var radius=offset/Math.PI;

function getx(basex,x,zoom) {

    x = x<<(21-zoom);
    var ln = ((x - offset )*180/(radius * 3.1416));



    basex = basex<<(21-zoom);

    var baseln = ((basex - offset )*180/(radius * 3.1416));



   return baseln-ln;

}

function gety(basey,y,zoom){
y = y<<(21-zoom);
//var lt = (180/Math.PI)*(Math.atan(Math.exp((((offset-2*y)/radius)-1)/2)));
 var lt = ((y - offset )*180/(radius * 3.1416));
basey = basey<<(21-zoom);
//var baselt = (180/Math.PI)*(Math.atan(Math.exp((((offset-2*basey)/radius)-1)/2)));
 var baselt = ((basey - offset )*180/(radius * 3.1416));
return baselt-lt;
}
