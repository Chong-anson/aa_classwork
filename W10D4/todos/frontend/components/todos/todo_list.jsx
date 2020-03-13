import React from 'react';
import TodoListItem from "./todo_list_item"
import TodoForm from "./todo_form"

const TodoList = (props) => {
  const todos = props.todos.map( el=> {
    return(
      <TodoListItem 
        todo={el} 
        key={el.id} 
        removeTodo={props.removeTodo} 
        receiveTodo={props.receiveTodo}
        />
    )
  })

  console.log(props); 
  return(
    <div className="todos-list">

      <h3>Todo List goes here!!!</h3>
      <ul>
        {todos}
      </ul>
      <TodoForm receiveTodo={props.receiveTodo} />
    </div>
  )
}

export default TodoList;