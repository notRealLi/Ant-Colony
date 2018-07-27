class Node {
  private Connection connection;
  Terrain terrain;
  
  public Node(Terrain terrain) {
    this.terrain = terrain;
    this.connection = null;
  }
  
  public Connection connection() {
    return this.connection;
  }
  
  public Terrain terrain() {
    return this.terrain;
  }
  
  public void connection(Connection connection) {
    this.connection = connection;
  }
  
  public boolean ifNeighbor(Node target) {
    return this.terrain().ifNeighbor(target.terrain());  
  }
}
