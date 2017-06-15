import values from 'lodash/values';

export const selectAllPokemon = (state) => {
  return values(state.pokemon.entities);
};

export const selectPokemonItem = (state, itemId) => {
  return state.current_poke_items[itemId];
};
