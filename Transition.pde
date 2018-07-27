class Transition {
  State targetState;
  Condition condition;
  Action action;

  public Transition(State state, Condition condition) {
    this.targetState = state;
    this.condition = condition;
    this.action = null;
  }

  public State targetState() {
    return this.targetState;
  }
  
  public Action action() {
    return this.action;
  }
  
  public void action(Action action) {
    this.action = action;
  }

  public boolean isTriggered(PVector position) {
    return this.condition.test(position);
  }
}

