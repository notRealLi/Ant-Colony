float  TERRAIN_SIZE            = 40;
float  TERRAIN_NEIGHBOR_RADIUS = 40;
int    FOOD_NUMBER             = 70;
int    WATER_NUMBER            = 80;
int    POISON_NUMBER           = 7;

int SCREEN_WIDTH = 1280;
int SCREEN_HEIGHT = 1050;
float GRID_START_X = 40 + TERRAIN_SIZE/2;
float GRID_START_Y = 90 + TERRAIN_SIZE/2;
int   NUMBER_ROW = 30;
int   NUMBER_COL = 23;

color WHITE = color(255);
color BLACK = color(0);
color GOLD = color(249, 163, 15);
color BLUE = color(116, 169, 176);

float ANT_SIZE = 20;

PVector copyPosition(PVector position) {
  return new PVector(position.x, position.y);
}

float getDistance(PVector pos1, PVector pos2) {
  return PVector.dist(pos1, pos2);
}
