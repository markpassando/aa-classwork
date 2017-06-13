import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from '../actions/todo_actions.js';
import merge from 'lodash/merge';


const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};

const todosReducer = (state = initialState, action) => {

  switch(action.type) {
    case RECEIVE_TODOS:
      return merge({}, state, action.todos);

    case RECEIVE_TODO:
    // case UPDATE_TODO:
      // const newState = merge({}, state);
      // newState[action.todo.id] = action.todo
      // return newState

      // const newTodo = { [action.todo.id]: action.todo };
      // return merge({}, state, newTodo);

      // Object.keys(state).forEach(key => state[key]something something)

      return merge({}, state, { [action.todo.id]: action.todo });

    case REMOVE_TODO:
      const newState = merge({}, state);
      delete newState[action.todo];
      return newState;
      // return merge({}, state, {});
    default:
      return state;
  }
};

export default todosReducer;
