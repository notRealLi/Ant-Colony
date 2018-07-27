interface Action {
  public void execute(Ant ant);
}

class LookingForFoodAction implements Action {
  public void execute(Ant ant) {
    ant.colour(BLACK);
    ant.setGoal(terrains);
    ant.steer();
  }
}

class GoingHomeAction implements Action {
  public void execute(Ant ant) {
    ant.colour(GOLD);
    ant.setHome(terrains);
    ant.steer();
  }
}

class LookingForWaterAction implements Action {
  public void execute(Ant ant) {
    ant.colour(BLUE);
    ant.setGoal(terrains);
    ant.steer();
  }
}

class ReachedHomeAction implements Action {
  public void execute(Ant ant) {
    ants.spawnAnt();
  }
}
