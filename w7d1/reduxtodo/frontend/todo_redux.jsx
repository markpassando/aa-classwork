import React from 'react';
import ReactDOM from 'react-dom';
import store from './store/store.js';
import selectors from './reducers/selectors';
import Root from './components/root.jsx';
import { fetchTodos } from './util/todo_api_util.js';

// window.store = store;

// class ToDo extends React.Component {
//   render(){
//     return (
//       <App />
//     );
//   }
// }

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Root store={store} />, document.getElementById('content'));
});
