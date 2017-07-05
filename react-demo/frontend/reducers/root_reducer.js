import { combineReducers } from 'redux';
import postReducer from './post_reducer';

const rootReducer = combineReducers({
  posts: postReducer,
});

export default rootReducer;
