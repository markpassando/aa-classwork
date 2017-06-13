import { combineReducers }from 'redux';
import todosReducer from './todos_reducer.js';
import errorsReducer from './errors_reducer.js';

const rootReducer = combineReducers({
  todos: todosReducer,
  errors: errorsReducer
});

export default rootReducer;
