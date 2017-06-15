import * as APIUtil from '../util/api_util';
export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_ONE_POKE = "RECEIVE_ONE_POKE";

export const receiveAllPokemon = (pokemon) => {
  return {
    type: RECEIVE_ALL_POKEMON,
    pokemon,
  };
};

export const receiveOnePoke = (poke) => {
  return {
    type: RECEIVE_ONE_POKE,
    poke,
  };
};

export const requestAllPokemon = () => (dispatch) => {
  return APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)), console.error);
};

export const requestOnePoke = (id) => (dispatch) => {
  return APIUtil.fetchOnePoke(id)
    .then(poke => dispatch(receiveOnePoke(poke)), console.error);
};
