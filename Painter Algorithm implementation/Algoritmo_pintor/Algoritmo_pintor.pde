import remixlab.proscene.*;
import remixlab.dandelion.core.*;
import remixlab.dandelion.geom.*;
import java.util.ArrayList;

Scene scene;

float e = 0.0;
float scaleImg =25 ;
PShape s;

ArrayList<PShape> superficies = new ArrayList<PShape>();
//datos superficies a mostar
ArrayList<Float> zmax = new ArrayList<Float>();
ArrayList<Float> zmin = new ArrayList<Float>();
ArrayList<Float> xmax = new ArrayList<Float>();
ArrayList<Float> xmin = new ArrayList<Float>();
ArrayList<Float> ymax = new ArrayList<Float>();
ArrayList<Float> ymin = new ArrayList<Float>();
//necesarios para la normal en caso de las resticciones
float a, b, c, d;

void mouseWheel(MouseEvent event) { 
  float e = event.getAmount();
  scaleImg += e *.1 ;
}

public void setup() {
  size(640, 460, P3D);

  scene = new Scene(this);  
  scene.setAxesVisualHint(false);
  scene.setDottedGrid(false);
  scene.setCameraType(Camera.Type.ORTHOGRAPHIC);
  //scene.camera().setFieldOfView(1.f);
  scene.camera().setPosition(new Vec(-20, 100, 230)); // move the camera
  //scene.camera().lookAt(new Vec(0, 0, 0)); // make the camera look at the center of the board
  scene.setRadius(420);
  scene.showAll();

  // creacion superficies, solo triangulos
  for (int i=0; i<10; i++) {
    s=createShape();
    s.beginShape(TRIANGLES);
    // +Z "front" face
    s.fill(random(255), random(255), 0 );
    s.vertex(-1+i, -1+i, 1+i );
    s.vertex( 1+i, -1+i, 1+i );
    s.vertex( 1+i, 1+i, 1+i );

    s.endShape();

    superficies.add(s);
    zmax.add(0.0);
    zmin.add(0.0);
    xmax.add(0.0);
    xmin.add(0.0);
    ymax.add(0.0);
    ymin.add(0.0);
  }

  for (int i=0; i<10; i++) {
    s=createShape();
    s.beginShape(TRIANGLES);
    // -Z "back" face
    s.fill(random(255), random(255), 0 );
    s.vertex( 1+i, -1+i, -1-i );
    s.vertex(-1+i, -1+i, -1-i );
    s.vertex(-1+i, 1+i, -1-i );

    s.endShape();

    superficies.add(s);
    zmax.add(0.0);
    zmin.add(0.0);
    xmax.add(0.0);
    xmin.add(0.0);
    ymax.add(0.0);
    ymin.add(0.0);
  }

  for (int i=0; i<10; i++) {
    s=createShape();
    s.beginShape(TRIANGLES);

    s.fill( random(255), 0, random(255) );  
    // +Y "bottom" face
    s.vertex(-1+i, 1+i, 1+i );
    s.vertex( 1+i, 1+i, 1+i );
    s.vertex( 1+i, 1+i, -1+i );
    s.endShape();
    superficies.add(s);
    zmax.add(0.0);
    zmin.add(0.0);
    xmax.add(0.0);
    xmin.add(0.0);
    ymax.add(0.0);
    ymin.add(0.0);
  }

  for (int i=0; i<10; i++) {
    s=createShape();
    s.beginShape(TRIANGLES);

    // -Y "top" face
    s.fill( random(255), 0, random(255) );  
    s.vertex(-1+i, -1-i, -1+i );
    s.vertex( 1+i, -1-i, -1+i );
    s.vertex( 1+i, -1-i, 1+i );
    s.endShape();

    superficies.add(s);
    zmax.add(0.0);
    zmin.add(0.0);
    xmax.add(0.0);
    xmin.add(0.0);
    ymax.add(0.0);
    ymin.add(0.0);
  }

  for (int i=0; i<10; i++) {
    s=createShape();
    s.beginShape(TRIANGLES);
    s.fill( 0, random(255), random(255));  
    // +X "right" face
    s.vertex( 1+i, -1+i, 1+i );
    s.vertex( 1+i, -1+i, -1+i );
    s.vertex( 1+i, 1+i, -1+i );
    s.endShape();
    superficies.add(s);
    zmax.add(0.0);
    zmin.add(0.0);
    xmax.add(0.0);
    xmin.add(0.0);
    ymax.add(0.0);
    ymin.add(0.0);
  }

  for (int i=0; i<10; i++) {
    s=createShape();
    s.beginShape(TRIANGLES);

    // -X "left" face
    s.fill( 0, random(255), random(255));  
    s.vertex(-1-i, -1+i, -1+i );
    s.vertex(-1-i, -1+i, 1+i );
    s.vertex(-1-i, 1+i, 1+i );

    s.endShape();
    superficies.add(s);
    zmax.add(0.0);
    zmin.add(0.0);
    xmax.add(0.0);
    xmin.add(0.0);
    ymax.add(0.0);
    ymin.add(0.0);
  }

  for (int i=0; i<10; i++) {
    s=createShape();
    s.beginShape(TRIANGLES);
    // +Z "front" face
    s.fill(random(255), random(255), 0 );
    s.vertex(-1+i, -10+i, 10+i );
    s.vertex( 1+i, -10+i, 10+i );
    s.vertex( 1+i, 10+i, 10+i );
    s.rotateZ(i);
    s.endShape();

    superficies.add(s);
    zmax.add(0.0);
    zmin.add(0.0);
    xmax.add(0.0);
    xmin.add(0.0);
    ymax.add(0.0);
    ymin.add(0.0);
  }

  for (int i=0; i<10; i++) {
    s=createShape();
    s.beginShape(TRIANGLES);
    // -Z "back" face
    s.fill(random(255), random(255), 0 );
    s.vertex( 10+i, -1+i, -10-i );
    s.vertex(-10+i, -1+i, -10-i );
    s.vertex(-10+i, 1+i, -10-i );

    s.endShape();

    superficies.add(s);
    zmax.add(0.0);
    zmin.add(0.0);
    xmax.add(0.0);
    xmin.add(0.0);
    ymax.add(0.0);
    ymin.add(0.0);
  }

  //anulacion del z buffer nativo usado en processing
  hint(DISABLE_DEPTH_TEST);
}

public void draw() {
  background(255);  

  pushMatrix();

  //fases añgoritmo del pintor
  CalcularVertices();
  OrdenarSuperficies();
  if (key=='p') {
    Restricciones();
  }

  scale(scaleImg);
  //shape(s, 0, 0);
  for (int i=0; i<superficies.size (); i++) {
    shape(superficies.get(i));
  }

  popMatrix();
}

//primera fase, obtener valores de vertices de cada superficie com cirterio de ordenamiento
void CalcularVertices() {
  for (int i = 0; i < superficies.size (); i++) {
    PVector a1 = getPuntoCamara(superficies.get(i).getVertex(0));
    PVector a2 = getPuntoCamara(superficies.get(i).getVertex(1));
    PVector a3 = getPuntoCamara(superficies.get(i).getVertex(2));
    zmax.set(i, Math.abs(maxPuntos(a1, a2, a3))/1.0 );
    zmin.set(i, Math.abs(minPuntos(a1, a2, a3))/1.0 );
    xmax.set(i, Math.abs(maxPuntosX(a1, a2, a3))/1.0 );
    xmin.set(i, Math.abs(minPuntosX(a1, a2, a3))/1.0 );
    ymax.set(i, Math.abs(maxPuntosY(a1, a2, a3))/1.0 );
    ymin.set(i, Math.abs(minPuntosY(a1, a2, a3))/1.0 );
  }
}
//segunda fase, realizar ordenamiento en base al valor de zmax
void OrdenarSuperficies() {
  PShape aux;
  float za, zm;
  for (int i = 0; i < superficies.size (); i++) {
    for (int j = i; j < superficies.size (); j++) {

      if (zmax.get(i) < zmax.get(j)) {
        za=zmax.get(i);
        zm=zmin.get(i);
        aux = superficies.get(i);
        superficies.set(i, superficies.get(j));
        superficies.set(j, aux);
        zmax.set(i, zmax.get(j));
        zmax.set(j, za);
        zmin.set(i, zmin.get(j));
        zmin.set(j, zm);
      }
    }
  }
}

//distancia de una superficie especifica a la camara
PVector getPuntoCamara(PVector p) {
  Vec pV=new Vec();
  float x=p.get().x;
  float y=p.get().y;
  float z=p.get().z;
  pV.setX(x);
  pV.setY(y);
  pV.setZ(z);
  pV = scene.camera().frame().coordinatesOf(pV);
  return new PVector((int) pV.x(), (int) pV.y(), (int) pV.z());
}

//valores de zmin,xmin,ymin

float minPuntos(PVector p1, PVector p2, PVector p3) {

  if (p1.z <= p2.z && p1.z <= p3.z) {
    return p1.z;
  } else if (p2.z <= p1.z && p2.z <= p3.z) {
    return p2.z;
  } else {
    return p3.z;
  }
}

float minPuntosX(PVector p1, PVector p2, PVector p3) {

  if (p1.x <= p2.x && p1.x <= p3.x) {
    return p1.x;
  } else if (p2.x <= p1.x && p2.x <= p3.x) {
    return p2.x;
  } else {
    return p3.x;
  }
}

float minPuntosY(PVector p1, PVector p2, PVector p3) {

  if (p1.y <= p2.y && p1.y <= p3.y) {
    return p1.y;
  } else if (p2.y <= p1.y && p2.y <= p3.y) {
    return p2.y;
  } else {
    return p3.y;
  }
}

//valores de zmax,xmax,ymax
float maxPuntos(PVector p1, PVector p2, PVector p3) {

  if (p1.z >= p2.z && p1.z >= p3.z) {
    return p1.z;
  } else if (p2.z >= p1.z && p2.z >= p3.z) {
    return p2.z;
  } else {
    return p3.z;
  }
}

float maxPuntosX(PVector p1, PVector p2, PVector p3) {

  if (p1.x >= p2.x && p1.x >= p3.x) {
    return p1.x;
  } else if (p2.x >= p1.x && p2.x >= p3.x) {
    return p2.x;
  } else {
    return p3.x;
  }
}

float maxPuntosY(PVector p1, PVector p2, PVector p3) {

  if (p1.y >= p2.y && p1.y >= p3.y) {
    return p1.y;
  } else if (p2.y >= p1.y && p2.y >= p3.y) {
    return p2.y;
  } else {
    return p3.y;
  }
}

//tercera fase, aplica las pruebas del algoritmo del pintor una vez ordenado las superficies
public void Restricciones() {
  PShape aux;
  boolean prueba;
  float za, xa, ya, zm, xm, ym;

  for (int i = 0; i < superficies.size (); i++) {
    for (int j = i; j < superficies.size (); j++) {
      prueba = false;

      //Restriccion 1 no se translapa en X
      if (xmax.get(i) <= xmin.get(j)) {
        prueba=true;
        //Restriccion 1 no se translapa en Y
      } else { 
        if (ymax.get(i) <= ymin.get(j)) {
          prueba = true;
          // restriccion 2 un plano S está detrás del plano de S'
        } else { 
          if (

          calcularNormal(superficies.get(j), superficies.get(i).getVertex(0), i) <= 0 &&

            calcularNormal(superficies.get(j), superficies.get(i).getVertex(1), i) <= 0 &&

            calcularNormal(superficies.get(j), superficies.get(i).getVertex(2), i) <= 0 

            )
          {
            prueba= true;
          }
          //restriccion 3 un plano S' está delante del plano de S
          else {
            if (
            calcularNormal(superficies.get(i), superficies.get(j).getVertex(0), i)>= 0 &&

              calcularNormal(superficies.get(i), superficies.get(j).getVertex(1), i) >= 0 &&

              calcularNormal(superficies.get(i), superficies.get(j).getVertex(2), i) >= 0 
              )
            {
              prueba = true;
            }
          }
        }
        println(prueba);
      }

      if (prueba==true ) {
        aux = superficies.get(i);
        za=zmax.get(i);
        xa=xmax.get(i);
        ya=ymax.get(i);

        zm=zmin.get(i);
        xm=xmin.get(i);
        ym=ymin.get(i);

        superficies.set(i, superficies.get(j));
        superficies.set(j, aux);

        zmax.set(i, zmax.get(j));
        zmax.set(j, za);
        xmax.set(i, xmax.get(j));
        xmax.set(j, xa);
        ymax.set(i, ymax.get(j));
        ymax.set(j, ya);

        zmin.set(i, zmin.get(j));
        zmin.set(j, zm);
        xmin.set(i, xmin.get(j));
        xmin.set(j, xm);
        ymin.set(i, ymin.get(j));
        ymin.set(j, ym);

        j=superficies.size();
      }
    }
  }
}

float calcularNormal(PShape sup, PVector supa, int p) {

  //Se construye el primer vector AB del plano
  PVector vectorAB = new PVector(
  sup.getVertex(1).x-sup.getVertex(0).x, 
  sup.getVertex(1).y-sup.getVertex(0).y, 
  sup.getVertex(1).z-sup.getVertex(0).z
    );
  //Se construye el segundo vector AC del plano
  PVector vectorAC = new PVector(
  sup.getVertex(2).x-sup.getVertex(0).x, 
  sup.getVertex(2).y-sup.getVertex(0).y, 
  sup.getVertex(2).z-sup.getVertex(0).z
    );

  //Se calcula la normal con un producto Cruz
  PVector normal = calcularProductoCruz(vectorAB, vectorAC);
  a = normal.x;
  b = normal.y;
  c = normal.z;
  //Se calcula el D
  d = -(a*(sup.getVertex(0).x) + b*(sup.getVertex(0).y) + c*(sup.getVertex(0).z));
  //se retorna el valor a comparar para la posicion de los planos
  return a * supa.x + b*supa.y + c* supa.z+d;
}

PVector calcularProductoCruz(PVector a, PVector b) {
  return new PVector(
  a.y*b.z - a.z*b.y, 
  a.z*b.x - a.x*b.z, 
  a.x*b.y - a.y*b.x
    );
}

