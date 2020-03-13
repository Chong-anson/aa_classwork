import {RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO} from "../actions/todo_actions";

const _defaultState = {
    1: {
      id: 1,
      title: "wash car",
      body: "with soap",
      done: false
    },
    2: {
      id: 2,
      title: "wash dog",
      body: "with shampoo",
      done: true
    }
}

const todosReducer = (state = _defaultState, action)=> {
  
  Object.freeze(state); 
  const nextState = Object.assign({}, state);

  switch (action.type) {
    case RECEIVE_TODOS:
      newState = {};
      action.todos.forEach( (todo) =>{
        newState[todo.id] = todo;
      })
      return newState;
    case RECEIVE_TODO:
      // debugger
      nextState[action.todo.id] = action.todo;
      return nextState;
    case REMOVE_TODO:
      delete nextState[action.id]
      return nextState;
    default:
        return state;
  }
}

export default todosReducer;