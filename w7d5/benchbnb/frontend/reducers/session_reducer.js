import merge from 'lodash/merge';
import { RECEIVE_ERRORS, RECEIVE_CURRENT_USER } from "../actions/session_actions";

const defaultState = {
    currentUser: null,
    errors: []
};


const sessionsReducer = (state = defaultState, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
    // debugger
      return merge({}, state, { currentUser: action.currentUser, errors: [] });
    case RECEIVE_ERRORS:
      return merge({}, state, { currentUser: null, errors: action.errors });
    default:
      return state;
  }
};

export default sessionsReducer;
