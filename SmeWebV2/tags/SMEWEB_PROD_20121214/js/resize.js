var activeElements = new Array();
var activeElementCount = 0;

var lTop, lLeft;

    doMove = false;
    doResize = true;
  

function mousedown() {
  var mp;

  mp = findMoveable(window.event.srcElement);

  if (!window.event.altKey) {
     for (i=0; i<activeElementCount; i++) {
        if (activeElements[i] != mp) {
          activeElements[i].style.borderWidth = "2px";
        }
     }
     if (mp) {
       activeElements[0] = mp;
       activeElementCount = 1;
       mp.style.borderWidth = "4px";
     } else {
       activeElementCount = 0;
     }
  } else {
     if (mp) {
       if (mp.style.borderWidth != "4px") {
         activeElements[activeElementCount] = mp;
         activeElementCount++;
         mp.style.borderWidth = "4px";
       }
     }
  }

  lLeft = window.event.x;
  lTop = window.event.y;
}

document.onmousedown = mousedown;

function mousemove() {
  var i, dLeft, dTop;

  if (window.event.button == 1) {

    sx = window.event.x;
    sy = window.event.y;

    dLeft = sx - lLeft;
    dTop = sy - lTop;

    for (i=0; i<activeElementCount; i++) {
    
      if (doResize)
        resizeElement(activeElements[i], dLeft, dTop);
    }

    lLeft = sx;
    lTop = sy;

    return false;
  }

}



function resizeElement(mp, dLeft, dTop) {
    var e;
    e = mp;
    e.style.posHeight += dTop;
    e.style.posWidth += dLeft;

}

function findMoveable(e) {
  if (e.moveable == 'true')
    return e;

  if (e.tagName == "BODY")
    return null;

  return findMoveable(e.parentElement);
}



function rfalse() {
  return false;
}

document.onmousemove = mousemove;
document.onselectstart = rfalse;