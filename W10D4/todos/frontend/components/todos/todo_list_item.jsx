import React from 'react';
import TodoList from './todo_list';

class TodoListItem extends React.Component{
  constructor(props){
    super(props);
    const text = this.props.todo.done ? "Undone" : "Done"
    this.handleDeleteClick = this.handleDeleteClick.bind(this);
    this.handleDoneClick = this.handleDoneClick.bind(this);
    this.updateTodo = this.updateTodo.bind(this);
  }
  
  updateTodo(){
    let todo = Object.assign({}, this.props.todo)
    todo.done = todo.done ? false : true;
    this.props.receiveTodo(todo)
  }

  handleDeleteClick(e){
    e.preventDefault();
    this.props.removeTodo(this.props.todo.id);

  }

  handleDoneClick(e){
    e.preventDefault();
    this.updateTodo();

    this.setState({done})
  }

  render() {

    return (
      <div className="todos-items">

      <li key={this.props.id}>
        {this.props.todo.title}
          <button onClick={this.handleDoneClick}>{this.props.todo.done ? "Undone" : "Done"}</button>
        <button onClick={this.handleDeleteClick}>Delete</button>
      </li>
      </div>
    )
  }
}

export default TodoListItem; 