import React from 'react';
import TodoListItem from './todo_list_item.jsx';
import TodoForm from './todo_form.jsx';
// import { allTodos } from '../../reducers/selectors.js';

const TodoList = (props) => {
  // const list = props.todos.map((todo) => {
  //   return <li key={todo.id}>{todo.title}</li>;
  // });

  const list = props.todos.map((todo) => {
    return <TodoListItem key={todo.id} todo={todo}/>;
  });
  return (
    <div>
      <ul>{list}</ul>
      <TodoForm receiveTodo={props.receiveTodo}/>
    </div>
  );
};

export default TodoList;
