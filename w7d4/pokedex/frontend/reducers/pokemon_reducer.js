import merge from 'lodash/merge';
import { RECEIVE_ALL_POKEMON, RECEIVE_ONE_POKE } from '../actions/pokemon_actions';

const pokemonReducer = (state = {entities: {}, currentPoke: null}, action) => {
  Object.freeze(state);
  let newState;

  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      newState = merge({}, state, { entities: action.pokemon });
      return newState;

    case RECEIVE_ONE_POKE:
      newState = merge({}, state, { currentPoke: action.poke.id, entities: { [action.poke.id]: action.poke } });  
      return newState;
    default:
      return state;
  }
};

export default pokemonReducer;
