import React from 'react';
import GreetingContainer from './GreetingContainer';
import { Route, Link } from 'react-router-dom';
import SessionFormContainer from './SessionFormContainer';
import SearchContainer from './search_container';
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
  <Route exact path="/" component={ SearchContainer } />
  </div>
);

export default App;
