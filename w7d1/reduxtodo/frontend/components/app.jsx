import React from 'react';
import TodoListContainer from './todo_list/todo_list_container.jsx';

const App = (props) => {
  return (
    <div>
      <h1>To Do App</h1>
      <TodoListContainer />
    </div>
  );
};

export default App;
