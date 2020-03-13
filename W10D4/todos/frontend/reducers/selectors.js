const allTodos = (state) => {
  let keys = Object.keys(state.todos);
  return keys.map(el => state.todos[el]);
};

export default allTodos;

