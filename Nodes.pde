class Nodes {
  ArrayList<Node> nodes;
  
  public Nodes() {
    this.nodes = new ArrayList<Node>();
  }
  
  public void add(Node node) {
    this.nodes.add(node);
  }
  
  public void remove(Node node) {
    this.nodes.remove(node);
  }
  
  public int size() {
    return this.nodes.size();
  }
  
  public Node get(int i) {
    return this.nodes.get(i);
  }
  
  public boolean contains(Node node) {
    return this.nodes.contains(node);
  }
  
  public Node find(Node node) {
    return nodes.get(nodes.indexOf(node));
  }
  
  // find a random node
  public Node randomNode() {
    int index = int(random(0, this.size()));
    return this.get(index);
  }
}
