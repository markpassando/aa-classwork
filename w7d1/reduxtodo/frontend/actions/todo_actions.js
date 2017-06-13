import * as APIUtil from '../util/todo_api_util.js';

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

export const receiveTodos = function (todos) {
  return ({
    type: RECEIVE_TODOS,
    todos: todos
  });
};

export const receiveTodo = function (todo) {
  return ({
    type: RECEIVE_TODO,
    todo: todo
  });
};

export const removeTodo = function (todo) {
  return ({
    type: REMOVE_TODO,
    todo: todo
  });
};

export const fetchTodos = () => {
  return (dispatch) => {
    return APIUtil.getTodos()
      .then(
        (todos) => {
          return dispatch(receiveTodos(todos));
        },
        (error) => {
          console.log(error);
        }
      );
  };
};

export const createTodo = (todo) => {
  return (dispatch) => {
    return APIUtil.postTodos(todo)
      .then(todo => dispatch(receiveTodo(todo)),
            err => dispatch(receiveErrors(err.responseJSON))
      );
  };
};
//
// window.fetchTodos = fetchTodos;
