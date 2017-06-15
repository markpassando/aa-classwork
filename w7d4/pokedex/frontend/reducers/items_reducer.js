import merge from 'lodash/merge';
import { RECEIVE_ONE_POKE } from '../actions/pokemon_actions';

const itemsReducer = (state = [], action) => {
  let newState;
  switch(action.type){
    case(RECEIVE_ONE_POKE):
      newState = merge([], state, action.poke);
      return newState;
    default:
      return state;
  }
};

export default itemsReducer;
