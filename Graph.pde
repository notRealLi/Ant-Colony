class Graph {
  private ArrayList<Node> nodes;
  
  public Graph(Terrains terrains) {
    nodes = new ArrayList<Node>();
    for(int i=0; i<terrains.size(); i++) 
      nodes.add(new Node(terrains.get(i)));
  }
  
  public ArrayList<Connection> getConnections(Node fromNode) {
    ArrayList<Connection> connections = new ArrayList<Connection>();
    
    for(int i=0; i<this.size(); i++) {
      Node toNode = this.get(i);
      
      if(fromNode != toNode && fromNode.ifNeighbor(toNode)) 
        connections.add(new Connection(fromNode, toNode));
    }
    
    return connections;
  }
  
  public int size() {
    return this.nodes.size();
  }
  
  public Node get(int i) {
    return this.nodes.get(i);
  }
  
  // find node with a terrain
  public Node findNode(Terrain terrain) {
    for(int i=0; i<this.size(); i++)
      if(this.get(i).terrain() == terrain) 
        return this.get(i);
    return null;
  }
  
  // find node with a position
  public Node findNode(PVector position) {
    for(int i=0; i<this.size(); i++)
      if(this.get(i).terrain().position().x == position.x &&
         this.get(i).terrain().position().y == position.y) 
        return this.get(i);
    return null;
  }
}
