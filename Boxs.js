/*
* @Author: Lich_Amnesia
* @Date:   2016-05-30 10:25:23
* @Last Modified by:   Alwa
* @Last Modified time: 2016-05-30 10:44:06
*/

/* 
Part of the ReCode Project (http://recodeproject.com)
Based on "Boxes I" by William Kolomyjec
Originally published in "Computer Graphics and Art" vol2 no3, 1977
Copyright (c) 2012 Sermad Buni - OSI/MIT license (http://recodeproject/license).
*/
var canvaswidth = 17;
var canvasheight = 10;
    
var square_size = 40;
    
var randomness = 0.03;
var iw, jh;
    
function setup() {
    // set the size of the canvas
    createCanvas( (canvaswidth+2)*square_size, (canvasheight+2)*square_size, P2D );
    
    frameRate(3); // 刷新频率频率
    // set the background of the canvas
    
    background(255);
}

function draw() {
        clear();
    // draw the squares
    
    // by default squares are drawn with a filled colour
    // so we need to turn this off 
    smooth(8);
    
    noFill();
    
    // we need to make a loop in a loop 
    
    for(var i=0; i < canvaswidth; i++) {
    
    for(var j=0; j < canvasheight; j++) {
    
        push();
    
        // move the origin to the pivot point        
        translate((square_size*i), (square_size*j));
    
    // simple algo to increase rotation towards
    // the middle of the grid
    // check for odd or even canvas size to slightly alter the algo
    
    if(canvasheight % 2 == 0) {
      iw = canvaswidth/2 - Math.abs(i - canvaswidth/2);
    } else {
      iw = canvaswidth/2 - 0.5 - Math.abs(i - canvaswidth/2 - 0.5);
    }
   
    if(canvasheight % 2 == 0) {
      jh = canvasheight/2 - 0.5 - Math.abs(j - canvasheight/2 + 0.5);
    } else {
      jh = canvasheight/2 - Math.abs(j - canvasheight/2);
    }
      
    // check if we are not drawing the outer edges
    if( jh != 0 || iw != 0) {
    
      // rotate the square
      rotate( radians(iw * iw * jh * jh * random(-randomness,randomness)) );
    
    }
    
    // draw the square at the origin
    rect(square_size, square_size, square_size, square_size);
    
    pop();
    
    }
 
  }

}