class Terrains {
  private ArrayList<Terrain> terrains;
  private ArrayList<Terrain> foods;
  private ArrayList<Terrain> waters;
  private ArrayList<Terrain> poisons;
  Terrain home;
  
  PImage homeIcon;
  PImage foodIcon;
  PImage waterIcon;
  PImage poisonIcon;
  
  public Terrains() {
    this.terrains = new ArrayList<Terrain>();
    this.homeIcon = loadImage("resources/home.png");
    this.foodIcon = loadImage("resources/food.png");
    this.waterIcon = loadImage("resources/water.png");
    this.poisonIcon = loadImage("resources/poison.png");
    
    this.home = null;
    this.foods = new ArrayList<Terrain>();
    this.waters = new ArrayList<Terrain>();
    this.poisons = new ArrayList<Terrain>();
  }
  
  public Terrain get(int i) {
    return this.terrains.get(i);
  }
  
  public void add(Terrain t) {
    this.terrains.add(t);
  }
  
  public Terrain home() {
   return this.home;
  }
  
  public void home(Terrain terrain) {
    if(this.home != null) {
      this.home.type("Empty");
    }
    this.home = terrain;
    this.home.type("Home");
  }
  
  public int size() {
   return this.terrains.size();
  }
  
  public PImage homeImage() {
    return this.homeIcon;
  }
  
  public PImage foodImage() {
    return this.foodIcon;
  }
  
  public PImage waterImage() {
    return this.waterIcon;
  }
  
  public PImage poisonImage() {
    return this.poisonIcon;
  }
  
  public ArrayList<Terrain> getTerrains() {
    return this.terrains;
  }
  
  public Terrain randomTerrain() {
    int index = int(random(0, this.size()));
    
    return this.get(index);
  }
  
  public void addFoodTerrain(Terrain terrain) {
    this.foods.add(terrain);
  }

  public void addWaterTerrain(Terrain terrain) {
    this.waters.add(terrain);
  }
  
  public void addPoisonTerrain(Terrain terrain) {
    this.poisons.add(terrain);
  }

  // check if an ant is on a food tile
  public boolean onFood(PVector position) {
    for(int i=0; i<this.foods.size(); i++) {
      Terrain terrain = this.foods.get(i);
      if(PVector.dist(terrain.position(), position) < 0.1) {
        terrain.type("Empty");
        this.foods.remove(terrain);
        return true;
      }
    }
    
    return false;
  }
  
  // check if an ant is on a water tile
  public boolean onWater(PVector position) {
    for(int i=0; i<this.waters.size(); i++) {
      Terrain terrain = this.waters.get(i);
      if(PVector.dist(terrain.position(), position) < 0.1) {
        terrain.type("Empty");
        this.waters.remove(terrain);
        return true;
      }
    }
    
    return false;
  }
  
  // check if an ant is on a poison tile
  public boolean onPoison(PVector position) {
    for(int i=0; i<this.poisons.size(); i++) {
      Terrain terrain = this.poisons.get(i);
      if(PVector.dist(terrain.position(), position) < 0.1)
        return true;
    }
    
    return false;
  }
  
  // check if an ant is on the home tile
  public boolean AtHome(PVector position) {
    if(PVector.dist(this.home().position, position) < 0.1)
      return true;
    
    return false;
  }
}
