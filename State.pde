class State {
  private Action action;
  private ArrayList<Transition> transitions;
  
  public State(Action a, Transition transition) {
    this.action = a;
    this.transitions = new ArrayList<Transition>();
    this.transitions.add(transition);
  }
  
  public State(Action a) {
    this.action = a;
    this.transitions = new ArrayList<Transition>();
  }
  
  public void transition(Transition transition) {
    this.transitions.add(transition);
  }
  
  public Action action() {
    return this.action;
  }
  
  public int numberOftransitions() {
    return this.transitions.size();
  }
  
  public Transition transition(int i) {
    return this.transitions.get(i);
  }
}
