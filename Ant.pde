import java.util.Collections;

class Ant {
  private float   size;
  private color   colour;

  private PVector position; // current terrain the ant is in
  private PVector target;
  private float speed;
  private ArrayList<Connection> path;
  
  private StateMachine stateMachine;

  public Ant(Terrain terrain) {
    this.position = copyPosition(terrain.position());
    this.size = ANT_SIZE;
    this.colour = GOLD;
    this.target = null;
    this.speed = 1;
    this.path = null;
    
    this.setUpStateMachine();
  }
  
  // set up the state machine
  public void setUpStateMachine() {
    
    // actions
    LookingForFoodAction  lookingForFoodAction  = new LookingForFoodAction();
    GoingHomeAction       goingHomeAction       = new GoingHomeAction();
    LookingForWaterAction lookingForWaterAction = new LookingForWaterAction();
    ReachedHomeAction     reachedHomeAction     = new ReachedHomeAction();
    
    // conditions
    Condition goingHomeCondition       = new GoingHomeCondition();
    Condition lookingForWaterCondition = new LookingForWaterCondition(); 
    Condition lookingForFoodCondition  = new LookingForFoodCondition(); 
    
    // states 
    State goingHomeState       = new State(goingHomeAction);
    State lookingForFoodState  = new State(lookingForFoodAction);
    State lookingForWaterState = new State(lookingForWaterAction);
    
    // transitions
    Transition goingHomeTransition = new Transition(goingHomeState,
                                                    goingHomeCondition);
   
    Transition lookingForFoodTransition = new Transition(lookingForFoodState,
                                                         lookingForFoodCondition);
    
    Transition lookingForWaterTransition = new Transition(lookingForWaterState,
                                                          lookingForWaterCondition);
    
    // assign action to transition                                                      
    lookingForWaterTransition.action(reachedHomeAction);
    
    // assign transitions to states     
    lookingForFoodState .transition(goingHomeTransition);
    goingHomeState      .transition(lookingForWaterTransition);
    lookingForWaterState.transition(lookingForFoodTransition);
    
    // generate a list of states
    ArrayList<State> states = new ArrayList<State>();
    states.add(lookingForFoodState);
    states.add(goingHomeState);
    states.add(lookingForWaterState);
   
    // initialize the state machine
    this.stateMachine = new StateMachine(states, lookingForFoodState);
  }
  
  // update the state machine 
  public ArrayList<Action> behave() {
    return this.stateMachine.update(this);
  }
  
  public PVector position() {
    return this.position;
  }
  
  public float size() {
    return this.size;
  }
  
  public color colour() {
    return this.colour;
  }
  
  public void colour(color col) {
    this.colour = col;
  }
  
  public void steer() {
    if(this.path != null) {
      if((target == null || PVector.dist(this.target, this.position) < 0.1) && !this.path.isEmpty()) {
        Connection next = this.path.remove(0);
        this.target = next.toNode().terrain().position();
      }
      
      // current target is not reached
      if(this.target != null && PVector.dist(this.target, this.position) >= 0.1) {
        PVector direction = PVector.sub(this.target, this.position);
        direction.normalize();
        this.position.add(PVector.mult(direction, this.speed));
      // 
      } else {
        this.path = null;
      }
    }
  }
  
  // randomly set a goal
  public void setGoal(Terrains terrains) {
    if(this.path == null) {
      Graph graph = new Graph(terrains);
      this.pathfind(graph, 
                    graph.findNode(this.position),
                    graph.findNode(terrains.randomTerrain()));
                    
    }
  }
  
  // set home tile as goal
  public void setHome(Terrains terrains) {
    if(this.path == null) {
      Graph graph = new Graph(terrains);
      this.pathfind(graph, 
                    graph.findNode(this.position),
                    graph.findNode(terrains.home()));
    }
  }
  
  // find a path to goal
  private void pathfind(Graph graph, Node startNode, Node goalNode) {
    Nodes open = new Nodes();
    Nodes closed = new Nodes();
    open.add(startNode);
    
    Node currentNode = null;
    
    while(open.size() > 0) {
      currentNode = open.randomNode();
     
      // goal node is reached
      if(currentNode.terrain() == goalNode.terrain()) 
        break;

      // get the outgoing connections of current node
      ArrayList<Connection> connections = graph.getConnections(currentNode);
      
      // loop through the connections
      for(int i=0; i<connections.size(); i++) {
        Connection connection = connections.get(i);
        Node endNode = connection.toNode();
        
        // if node is unvisited
        if(!closed.contains(endNode) && !open.contains(endNode)) {
          endNode.connection(connection);
          
          if(!open.contains(endNode))
            open.add(endNode);
        }
      }
      
      open.remove(currentNode);
      closed.add(currentNode);
    }
    
    // No path is found 
    if(currentNode.terrain() != goalNode.terrain())
      return;
      
    // A path is found
    else {
      ArrayList<Connection> path = new ArrayList<Connection>();
      
      while(currentNode.terrain() != startNode.terrain()) {
        path.add(currentNode.connection());
        currentNode = currentNode.connection().fromNode();
      }

      Collections.reverse(path);
      this.path = path;
    }
  }
}
