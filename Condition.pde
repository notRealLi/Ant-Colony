interface Condition {
  public boolean test(PVector position);
}

class GoingHomeCondition implements Condition {
  public boolean test(PVector position) {
    return terrains.onFood(position);
  }
}

class LookingForWaterCondition implements Condition {
  public boolean test(PVector position) {
    return terrains.AtHome(position);
  }
}

class LookingForFoodCondition implements Condition {
  public boolean test(PVector position) {
    return terrains.onWater(position);
  }
}

