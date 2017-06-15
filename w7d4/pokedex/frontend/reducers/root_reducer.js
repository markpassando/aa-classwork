import { combineReducers } from 'redux';
import pokemonReducer from './pokemon_reducer';
import itemsReducer from './items_reducer';


const rootReducer = combineReducers({
  pokemon: pokemonReducer,
  current_poke_items: itemsReducer
});

export default rootReducer;
