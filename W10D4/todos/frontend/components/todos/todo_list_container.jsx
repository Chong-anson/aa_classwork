import TodoList from './todo_list';
import {connect} from 'react-redux';
import allTodos from '../../reducers/selectors';
import {receiveTodo, removeTodo} from '../../actions/todo_actions';

const msp = (state) => {
  return {
    todos: allTodos(state)
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    receiveTodo: (todo) => {dispatch(receiveTodo(todo))},
    removeTodo: (todoID) => {dispatch(removeTodo(todoID))}
  }
};
// props.removeTodo(id) ==> 
export default connect(
  msp,
  mapDispatchToProps
)(TodoList);

// < todos=allTodos(state)   />
