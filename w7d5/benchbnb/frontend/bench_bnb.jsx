import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { requestSignUp, requestLogIn, requestLogOut } from './util/session_api_util';

import { login } from './actions/session_actions';

window.login = login;
window.signUp = requestSignUp;
// window.logIn = requestLogIn;
window.logOut = requestLogOut;

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();

  window.getState = store.getState;
  window.dispatch = store.dispatch;

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
