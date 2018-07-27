class StateMachine {
  ArrayList<State> states;
  State initialState;
  State currentState;
  
  public StateMachine(ArrayList<State> states, State initialState) {
    this.states = states;
    this. currentState = this.initialState = initialState;
  }
  
  public ArrayList<Action> update(Ant ant) {
    Transition triggeredTransition = null;
    ArrayList<Action> actions = new ArrayList<Action>();
    
    for(int i=0; i<currentState.numberOftransitions(); i++) {
      Transition transition = currentState.transition(i);
      if(transition.isTriggered(ant.position())) {
        triggeredTransition = transition;
        break;
      } 
    }
    
    if(triggeredTransition != null) {
      ant.path = null;
      
      // get the transition action if there is one
      if(triggeredTransition.action() != null)
        actions.add(triggeredTransition.action());
      currentState = triggeredTransition.targetState();
    }
      
    actions.add(currentState.action());
    return actions;
  }
}
