// draw the grid
void drawTerrain() {
  rectMode(CENTER);
  stroke(0);

  for (int i=0; i<terrains.size (); i++) {
    Terrain t = terrains.get(i);

    fill(WHITE);
    rect(t.position().x, t.position().y, TERRAIN_SIZE, TERRAIN_SIZE);

    if (t.type() == "Home") {
      imageMode(CENTER);
      image(terrains.homeImage(), t.position().x, t.position().y, TERRAIN_SIZE * 0.9, TERRAIN_SIZE * 0.9);
    } else if (t.type() == "Food") {
      imageMode(CENTER);
      image(terrains.foodImage(), t.position().x, t.position().y, TERRAIN_SIZE * 0.9, TERRAIN_SIZE * 0.9);
    } else if (t.type() == "Water") {
      imageMode(CENTER);
      image(terrains.waterImage(), t.position().x, t.position().y, TERRAIN_SIZE * 0.9, TERRAIN_SIZE * 0.9);
    } else if (t.type() == "Poison") {
      imageMode(CENTER);
      image(terrains.poisonImage(), t.position().x, t.position().y, TERRAIN_SIZE * 0.9, TERRAIN_SIZE * 0.9);
    }
  }
}

// ant number display
void drawText() {
    fill(BLACK);
    textSize(22);
    textAlign(CENTER);
    text("Number Of Ants: " + ants.size(), SCREEN_WIDTH/2, 40);
}

