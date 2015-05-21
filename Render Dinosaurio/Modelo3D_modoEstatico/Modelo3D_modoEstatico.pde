import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import remixlab.proscene.*; 
import remixlab.dandelion.core.*; 
import remixlab.dandelion.geom.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 



Scene scene;
InteractiveFrame f1, f2, f3, f4, f5,f0;
int ajuste=300;
BufferedReader reader;
String line;
ArrayList <float[]> cara1, cara2, cara3, cara4;

public void setup() {
  size(640, 360, P3D);
  scene = new Scene(this);
  scene.setVisualHints(Scene.AXES | Scene.PICKING);
  cara1=separacion("reconstruccionLomo.off");
  cara2=separacion("reconstruccionLomoFaces.off");
  //cara2=separacion("Im6.off");
//  cara3=separacion("Im7.off");
//  cara4=separacion("Im7.off");
  
  f0=new InteractiveFrame(scene);
  f0.translate(0,0,-310);
  f0.scale(1.1f);
  
//  f1 = new InteractiveFrame(scene);
//  f1.translate(320,0,0);
//  f1.rotate(new Quat(new Vec(0, 1, 0), -HALF_PI));
//  f1.scale(1.1);
//
//  f2 = new InteractiveFrame(scene);
//  f2.translate(20,0,330);
//  f2.rotate(new Quat(new Vec(0, 1, 0), -PI));
//  f2.scale(1.1);
//
//  f3 = new InteractiveFrame(scene);
//  f3.translate(-300,0,25);
//  f3.rotate(new Quat(new Vec(0, 1, 0), HALF_PI));
//  f3.scale(1.1);
//
//  f4 = new InteractiveFrame(scene, scene.eye().frame());
//  f4.translate(-100, 0, -250);

  scene.setRadius(200);
  scene.showAll();
  scene.eye().frame().setRotationSensitivity(1.9f);

}

public void draw() {
  background(150);
  //world:
  
  pushMatrix();
  scene.applyTransformation(f0);
  scene.drawAxes(40);
  graficacion(cara1);
  graficacion2(cara1, cara2);
  popMatrix();


//  pushMatrix();
//  scene.applyTransformation(f1);
//  scene.drawAxes(40);
//  graficacion(cara2);
//  popMatrix();
//  
//  pushMatrix();
//  scene.applyTransformation(f2);
//  scene.drawAxes(40);
//  graficacion(cara3);
//  popMatrix();
//  
//  pushMatrix();
//  scene.applyTransformation(f3);
//  scene.drawAxes(40);
//  graficacion(cara4);
//  popMatrix();
  
  //eye
//  pushMatrix();
//  scene.applyTransformation(scene.eye().frame());
//  pushMatrix();
//  scene.applyTransformation(f4);
//  scene.drawAxes(40);
//  popMatrix();
//  popMatrix();
  
}

public ArrayList<float[]> separacion(String archivo){
  reader = createReader(archivo);
  ArrayList<float[]> cara = new ArrayList<float[]>();
  int counter =0;
  try {
    while((line = reader.readLine())!=null){
      if (counter>=2){
        String numbers [] = split(line,' ');
        cara.add(float(numbers));
      }
      counter++;
    }
    return cara;
  }
  catch (IOException e) {
    e.printStackTrace();
    line = null;
    return cara;
  }
}

public void graficacion(ArrayList <float[]> cara){
  for (float[] s : cara){
    //if(int(numbers[3])<=255 || int(numbers[4])<=255 || int(numbers[5])<=255){
      pushStyle();
      stroke(int(s[3]),int(s[4]),int(s[5]));
      point(s[0]*ajuste,s[1]*ajuste,s[2]*ajuste);
      popStyle();
    //}
  }
}

public void graficacion2(ArrayList <float[]> caras, ArrayList <float[]> vertices ){
  for (float[] s : vertices){
    //if(int(numbers[3])<=255 || int(numbers[4])<=255 || int(numbers[5])<=255){
      pushStyle();
      beginShape(TRIANGLES);
      stroke(caras.get(int(s[1]))[3], caras.get(int(s[1]))[4], caras.get(int(s[1]))[5]);
      vertex(caras.get(int(s[1]))[0]*ajuste, caras.get(int(s[1]))[1]*ajuste, caras.get(int(s[1]))[2]*ajuste);
      vertex(caras.get(int(s[2]))[0]*ajuste, caras.get(int(s[2]))[1]*ajuste, caras.get(int(s[2]))[2]*ajuste);
      vertex(caras.get(int(s[3]))[0]*ajuste, caras.get(int(s[3]))[1]*ajuste, caras.get(int(s[3]))[2]*ajuste);
      endShape();
      //point(s[0]*ajuste,s[1]*ajuste,s[2]*ajuste);
      popStyle();
    //}
  }
}
  

