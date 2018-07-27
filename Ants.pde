class Ants {
  ArrayList<Ant> ants;
  
  public Ants() {
    ants = new ArrayList<Ant>();
  }
  
  public void spawnAnt() {
    ants.add(new Ant(terrains.home()));
  }
  
  public int size() {
    return this.ants.size();
  }
  
  public void updateAnts() {
    for(int i=0; i<this.size(); i++) {
      Ant ant = this.ants.get(i);
      
      // kill ant if it steps on a poison tile
      if(terrains.onPoison(ant.position()))
        this.ants.remove(ant);
      
      // execute the actions
      ArrayList<Action> actions = ant.behave();
      for(int j=0; j<actions.size(); j++)
        actions.get(j).execute(ant);
        
      this.drawAnt(ant);
    }
  }
  
  private void drawAnt(Ant ant) {
    stroke(ant.colour());
    fill(ant.colour());
    ellipseMode(CENTER);
    ellipse(ant.position().x, ant.position().y, 
            ant.size(), ant.size());
  }
}
