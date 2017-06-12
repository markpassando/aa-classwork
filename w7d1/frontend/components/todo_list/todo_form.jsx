import React from 'react';
import merge from 'lodash/merge';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {title: "", body: "", done: false};

    this.handleTitle = this.handleTitle.bind(this);
    this.handleBody = this.handleBody.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  uniqueId() {
    return new Date().getTime();
  }

  handleTitle(e) {
    this.setState({ title: e.currentTarget.value });
  }

  handleBody(e) {
    this.setState({ body: e.currentTarget.value });
  }

  handleSubmit(e){
    e.preventDefault();
    let newTodo = merge({}, this.state);
    newTodo.id = this.uniqueId();
    // debugger
    this.props.receiveTodo(newTodo);
    // call the dispatch
    // pass in all the props and unique id to redux
  }

  render(){

    return (
      <form>
        <label>Title:
          <input type="text" onChange={ this.handleTitle } value={this.state.title} />
        </label>

        <br />

        <label>Body:
          <input type="text" onChange={ this.handleBody } value={this.state.body} />
        </label>

        <br />

      <button onClick={this.handleSubmit} >Submit Todo</button>
      </form>
    );
  }
}

export default TodoForm;
