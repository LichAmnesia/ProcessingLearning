/*
* @Author: Lich_Amnesia
* @Date:   2016-05-30 10:04:13
* @Last Modified by:   Alwa
* @Last Modified time: 2016-05-30 10:24:31
*/
var y = 100

function setup() {
  createCanvas(640, 480);
  frameRate(20); // 刷新频率频率
}
// draw 函数会一直执行
function draw() {
  // Set the background to black and turn off the fill color
  background(0);
  noFill();

  y = y - 1;
  if (y < 0){
    y = height;
  }

  // The two parameters of the point() method each specify 
  // coordinates.
  // The first parameter is the x-coordinate and the second is the Y 
  stroke(255);
  point(width * 0.5, height * 0.5);
  point(width * 0.5, height * 0.25); 

  // Coordinates are used for drawing all shapes, not just points.
  // Parameters for different functions are used for different 
  // purposes. For example, the first two parameters to line()  
  // specify the coordinates of the first endpoint and the second  
  // two parameters specify the second endpoint
  
  strokeWeight(5);
  stroke(0, 153, 255);
  line(0, y*0.33, width, y*0.33);

  // By default, the first two parameters to rect() are the 
  // coordinates of the upper-left corner and the second pair
  // is the width and height
  strokeWeight(1);
  stroke(255, 153, 0);
  rect(width*0.25, height*0.1, width * 0.5, height * 0.8);
}