Terrains terrains;
Ants ants;

void setup() {
  frameRate(80);
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
  
  initTerrains();
  ants = new Ants();
}

void draw() {
  loop();
  background(255);
  
  drawText();
  drawTerrain();
  ants.updateAnts();  
}

void initTerrains() {
  terrains = new Terrains();
  
  for(int i=0; i<NUMBER_COL; i++) {
    for(int j=0; j<NUMBER_ROW; j++) {
      float x = GRID_START_X + j * TERRAIN_SIZE;
      float y = GRID_START_Y + i * TERRAIN_SIZE;
      
      Terrain t = new Terrain(new PVector(x, y));
      terrains.add(t);
    }
  }
  
  // set home tile
  terrains.home(terrains.randomTerrain());
  
  // set food tiles
  int counter = FOOD_NUMBER;
  while(counter > 0) {
    Terrain terrain = terrains.randomTerrain();
    
    if(terrain.type() == "Empty") {
      terrain.type("Food");
      terrains.addFoodTerrain(terrain);
      counter--;
    }
  }
  
  // set water tiles
  counter = WATER_NUMBER;
  while(counter > 0) {
    Terrain terrain = terrains.randomTerrain();
    
    if(terrain.type() == "Empty") {
      terrain.type("Water");
      terrains.addWaterTerrain(terrain);
      counter--;
    }
  }
  
  // set poison tiles
  counter = POISON_NUMBER;
  while(counter > 0) {
    Terrain terrain = terrains.randomTerrain();
    
    // make sure the poison tiles are not too close to home
    if(terrain.type() == "Empty" && getDistance(terrain.position(), terrains.home().position()) > TERRAIN_SIZE * 5) {
      terrain.type("Poison");
      terrains.addPoisonTerrain(terrain);
      counter--;
    }
  }
}

// click mouse to spawn ants
void mouseClicked() {
  int antNumber = 10;
  while(antNumber > 0) {
    ants.spawnAnt();
    antNumber--;
  }
}

void keyPressed() {
  if(key == ' ') {
    ants = new Ants();
    initTerrains();
  }
}
