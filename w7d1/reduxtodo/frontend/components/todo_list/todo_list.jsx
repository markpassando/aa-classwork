import React from 'react';
import TodoListItem from './todo_list_item.jsx';
import TodoForm from './todo_form.jsx';
// import { allTodos } from '../../reducers/selectors.js';

class TodoList extends React.Component {
  componentDidMount() {
    this.props.fetchTodos();
  }

  render() {
    const list = this.props.todos.map((todo) => {
      return <TodoListItem key={todo.id} todo={todo} removeTodo={this.props.removeTodo} receiveTodo={this.props.receiveTodo}/>;
    });
    return (
      <div>
        <ul>{list}</ul>
        <TodoForm
          createTodo={this.props.createTodo}
          clearErrors={this.props.clearErrors}
          getErrors={this.props.getErrors} />
      </div>
    );
  }
}

export default TodoList;
