class Terrain {
  private String  type;
  private PVector position; // center position of terrain
  
  private float   size;
  
  public Terrain(String t, PVector p) {
    this.type(t);
    
    this.position = p;
    this.size = TERRAIN_SIZE;
  }
  
  public Terrain(PVector p) {
    this("Empty", p);
  }
  
  public void type(String t) {
    this.type = t;
  }
  
  public String type() {
    return this.type;
  }
  
  public PVector position() {
    return this.position;
  }
  
  public boolean ifNeighbor(Terrain target) {
    if(this != target && PVector.dist(this.position, target.position()) <= TERRAIN_NEIGHBOR_RADIUS)
      return true;
    
    return false;
  }
}
