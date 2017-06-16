import React from 'react';
import GreetingContainer from './GreetingContainer';
import { Route } from 'react-router-dom';
import SessionFormContainer from './SessionFormContainer';

const App = () => (
  <div>
    <header>
      <h1>Bench BnB</h1>
      <GreetingContainer />
    </header>

  <Route path="/login" component={SessionFormContainer} />
  <Route path="/signup" component={SessionFormContainer} />

  </div>
);

export default App;
