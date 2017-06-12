import React from 'react';

// const TodoListItem = (props) => {
//   debugger
//   return (
//     <li key={props.todo.id}>{props.todo.title}</li>
//   );
// };
const TodoListItem = ({ todo }) => {
  return (
    <li>{todo.title}</li>
  );
};

export default TodoListItem;
