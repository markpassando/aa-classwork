import { merge } from 'lodash';

import {
  RECEIVE_ALL_POSTS,
  RECEIVE_SINGLE_POST,
  REMOVE_POST
} from '../actions/post_actions';

const defaultState = () => ({
  entities: {},
  currentPost: null,
});

const PostReducer = (state = defaultState(), action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_ALL_POSTS:
      return merge({}, state, { entities: action.posts });

    case RECEIVE_SINGLE_POST:
      return merge({}, state, {
        entities: { [action.post.id]: action.post },
        currentPost: action.post
      });

    case REMOVE_POST:
      let nextState = merge({}, state);
      delete nextState.entities[action.post.id];
      return nextState;

    default:
      return state;
  }
};

export default PostReducer;
