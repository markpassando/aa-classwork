import React from 'react';

// const TodoListItem = (props) => {
//   debugger
//   return (
//     <li key={props.todo.id}>{props.todo.title}</li>
//   );
// };
// const TodoListItem = ({ todo, removeTodo, recieveTodo }) => {
//   return (
//     <div>
//       <button onClick={() => { removeTodo(todo.id)} }>Delete</button>
//       <li>{todo.title}</li>
//       <button></button>
//     </div>
//   );
// };


class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.state = { done: this.props.todo.done };

    this.handleUpdate = this.handleUpdate.bind(this);
  }

  handleUpdate(e) {
    e.preventDefault();
    this.setState({ done: !(this.state.done) });
    this.props.receiveTodo(Object.assign({}, this.props.todo, this.state));
  }

  render() {
    // { todo, removeTodo, recieveTodo } = { }
    let { todo, removeTodo, receiveTodo } = this.props;
    return (
      <div>
        <button onClick={() => { removeTodo(todo.id);} }>Delete</button>
        <li>{todo.title}</li>
        <button onClick={ this.handleUpdate }>{this.state.done ? "Mark Incomplete" : "Mark Complete"}</button>
      </div>
    );
  }
}
export default TodoListItem;
