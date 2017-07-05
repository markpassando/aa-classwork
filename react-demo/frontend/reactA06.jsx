import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { HashRouter, Route, Link, Switch } from 'react-router-dom';

import configureStore from './store/store';
import PostIndexContainer from './components/PostIndexContainer';
import PostDetailContainer from './components/PostDetailContainer';
import EditPostContainer from './components/EditPostContainer';

import { fetchAllPosts } from './util/api_util';
import { requestAllPosts, requestSinglePost } from './actions/post_actions';


const Root = ({store}) => (
  <Provider store={store}>
    <HashRouter>
      <div className="container">
        <Link to='/'>Home</Link>
        <Route exact path="/" component={PostIndexContainer} />
        <Switch>
          <Route path="/post/edit/:postId" component={EditPostContainer} />
          <Route path="/post/:postId" component={PostDetailContainer} />
        </Switch>
      </div>
    </HashRouter>
  </Provider>
);

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();

  // window.fetchAllPosts = fetchAllPosts;
  // window.requestSinglePost = requestSinglePost;
  // window.getState = store.getState;
  // window.dispatch = store.dispatch;

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});

// const getSuccess = posts => console.log(receiveAllPosts(posts));
// fetchAllPosts().then(getSuccess);

// const getSuccess = posts => dispatch(receiveAllPosts(posts));
// fetchAllPosts().then(getSuccess);

// getState();
// dispatch(requestAllPosts());
// dispatch(requestSinglePost(1));
