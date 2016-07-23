PFont font;
String[] words={"111","222","333","444"};

PGraphics[] wordPic=new PGraphics[words.length];
PImage pic;
int total=180;
PGraphics manyC,finalSave;

void setup(){
pic=loadImage("China.png");
pic.filter(THRESHOLD,0.99);
pic.resize(1800,0);

font=createFont("JOKERMAN.TTF",240);
textFont(font);
float strHt=textAscent()+textDescent();
println(strHt);

size(1000,662);
background(255);
manyC=createGraphics(pic.width,pic.height);
finalSave=createGraphics(pic.width,pic.height);
finalSave.smooth();

for(int i=0;i<wordPic.length;i++){
  wordPic[i]=createGraphics((int)textWidth(words[i]),(int)strHt);
  wordPic[i].beginDraw();
  wordPic[i].textFont(font);
  wordPic[i].textAlign(LEFT,TOP);
  wordPic[i].fill(color(0,0,255));
  wordPic[i].text(words[i],0,0);
  wordPic[i].endDraw();
 
  if(wordPic[i].width>=width){
    wordPic[i].resize(width*2/3,0);
  }
}

for(int i=0;i<total;i++){
 
  getOut:
 
  while(wordPic[i%wordPic.length].width>10){
    int tryTimes=150;
    float shrinkFactor=0.7;
    for(int j=0;j<tryTimes;j++){
      int xstart=int(random(width-wordPic[i%wordPic.length].width));
      int ystart=int(random(height-wordPic[i%wordPic.length].height));
      if(fitPic(wordPic[i%wordPic.length],xstart,ystart)){
        if(fitCube(wordPic[i%wordPic.length],xstart,ystart)){
          image(wordPic[i%wordPic.length],xstart,ystart);
          finalSave.image(wordPic[i%wordPic.length],xstart,ystart);
          manyC.beginDraw();
          manyC.fill(0);
          manyC.rect(xstart,ystart,wordPic[i%wordPic.length].width,wordPic[i%wordPic.length].height);
          manyC.endDraw();
          break getOut;
        }
      }
    }
    wordPic[i%wordPic.length].resize(int(wordPic[i%wordPic.length].width*shrinkFactor),0);
  }
}
//saveFrame("Chelsea.jpg");
finalSave.save("mosiac.png");
}

boolean fitPic(PGraphics cube,int xstart,int ystart){
  boolean fitPic=true;
  getOut:
  for (int m=0;m<cube.width;m++){
    for (int n=0;n<cube.height;n++){
      if(pic.get(xstart+m,ystart+n)!=color(0)){
        fitPic=false;
        break getOut;
      }
    }
  }
  return fitPic;
}

boolean fitCube(PGraphics cube,int xstart,int ystart){
  boolean fit=true;

  getOut:
  for (int m=0;m<cube.width;m++){
    for (int n=0;n<cube.height;n++){
      if(manyC.get(xstart+m,ystart+n)==color(0)){
        fit=false;
        break getOut;
      }
    }
  }
  return fit;
}