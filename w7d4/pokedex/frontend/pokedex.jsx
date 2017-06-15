import React from 'react';
import ReactDOM from 'react-dom';
import { HashRouter, Route } from 'react-router-dom';
import configureStore from './store/store';
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';
import { fetchAllPokemon, fetchOnePoke } from './util/api_util';
import { selectAllPokemon } from './reducers/selectors';
import Root from './components/root';


document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  // window.receiveAllPokemon = receiveAllPokemon;
  // window.requestAllPokemon = requestAllPokemon;
  // window.fetchAllPokemon = fetchAllPokemon;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  // window.selectAllPokemon = selectAllPokemon;
  window.fetchOnePoke = fetchOnePoke;
  ReactDOM.render(<Root store={store}/>, rootEl);
});
