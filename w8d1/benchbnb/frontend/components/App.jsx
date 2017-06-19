import React from 'react';
import GreetingContainer from './GreetingContainer';
import { Route, Link } from 'react-router-dom';
import SessionFormContainer from './SessionFormContainer';
import { AuthRoute } from '../util/route_util.jsx';

const App = () => (
  <div>
    <header>
      <Link to='/'>Home</Link>
      <h1>Bench BnB</h1>
      <GreetingContainer />
    </header>

  <AuthRoute path="/login" component={SessionFormContainer} />
  <AuthRoute path="/signup" component={SessionFormContainer} />

  </div>
);

export default App;
