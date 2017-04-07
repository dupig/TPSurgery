
static class Face { 
  
  public Face(PVector p1, PVector p2, PVector p3) {
    this.p1 = p1;
    this.p2 = p2;
    this.p3 = p3;
  }
  
  public PVector p1, p2, p3;

}

static class Model {
  
  public Face[] faces = null;
  public color strokeColor = 0xffffff;
  public color fillColor = 0x000000;
  
  public static Model createModel(String plyFileName) {
    Face[] faces = loadModel(plyFileName);
    Model model = new Model();
    model.faces = faces;
    return model;
  }
  
  public static Face[] loadModel(String plyFileName) {
    File file = new File(plyFileName);
    String[] lines = loadStrings(file);
    int vertexCount, faceCount;
    String line = lines[3];
    vertexCount = Integer.parseInt(line.substring("element vertex ".length()));
    line = lines[7];
    faceCount = Integer.parseInt(line.substring("element face ".length()));
    int currentLine = 10;
    
    println("vertices: " + vertexCount + ", faces: " + faceCount);
    
    PVector[] points = new PVector[vertexCount];
    for (int i = 0; i < vertexCount; ++i, ++currentLine) {
      line = lines[currentLine];
      String[] vertices = line.split(" ");
      float x, y, z;
      x = Float.parseFloat(vertices[0]);
      y = Float.parseFloat(vertices[1]);
      z = Float.parseFloat(vertices[2]);
      PVector point = new PVector(x, y, z);
      points[i] = point;
    }
    
    ArrayList<Face> faces = new ArrayList<Face>();
    for (int i = 0; i < faceCount; ++i, ++currentLine) {
      line = lines[currentLine];
      String[] indices = line.split(" ");
      //int indexCount = Integer.parseInt(indices[0]);
      PVector p1, p2, p3;
      int i1, i2, i3;
      i1 = Integer.parseInt(indices[1]);
      i2 = Integer.parseInt(indices[2]);
      i3 = Integer.parseInt(indices[3]);
      p1 = points[i1];
      p2 = points[i2];
      p3 = points[i3];
      Face face = new Face(p1, p2, p3);
      faces.add(face);
    }
    
     println("actual faces: " + faces.size());
    
    return faces.toArray(new Face[faces.size()]);
  }
  
}