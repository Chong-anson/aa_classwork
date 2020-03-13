import React from 'react';

function uniqueID() {
  return new Date().getTime();
}

class TodoForm extends React.Component{
  constructor(props){
    super(props);
    this.state = { titleVal:"", bodyVal:"", tagsVal:""}
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
    this.updateTags = this.updateTags.bind(this);
  }
  updateTitle(e){
    this.setState({titleVal: e.currentTarget.value})
  }
  updateBody(e){
    this.setState({ bodyVal: e.currentTarget.value })

  }
  updateTags(e){
    this.setState({ tagsVal: e.currentTarget.value })
    
  }

  handleSubmit(e){
    e.preventDefault();
    console.log(this.props);
    const todo = {
      id: uniqueID(),
      title: this.state.titleVal,
      bodyVal: this.state.bodyVal,
      tagsVal: this.state.tagsVal
    }
    console.log(todo);
    this.props.receiveTodo(todo);
  }

  

  render(){

      return(
        <div className="todo-form">
        <form onSubmit={this.handleSubmit}>
          <label>Title:
            <input type="text" onChange={this.updateTitle} value={this.state.titleVal}/>
          </label>
          <br/>
          <label>Body:
            <input type="text" onChange={this.updateBody} value={this.state.bodyVal}/>
          </label>
          <br/>
          <label>Tags:
            <input type="text" onChange={this.updateTags} value={this.state.tagsVal}/>
          </label>
          <br/>
          <button>Submit</button>
        </form>
      </div>
    )
  }
}

export default TodoForm;