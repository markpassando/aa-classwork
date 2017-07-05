export const RECEIVE_ALL_POSTS = 'RECEIVE_ALL_POSTS';
export const RECEIVE_SINGLE_POST = 'RECEIVE_SINGLE_POST';
export const REMOVE_POST = 'REMOVE_POST';

import * as APIUtil from '../util/api_util';

export const receiveAllPosts = posts => ({
  type: RECEIVE_ALL_POSTS,
  posts
});

export const receiveSinglePost = post => ({
  type: RECEIVE_SINGLE_POST,
  post
});

export const removeSinglePost = post => ({
  type: REMOVE_POST,
  post
});

export const requestAllPosts = () => (dispatch) => {
  return APIUtil.fetchAllPosts()
    .then(posts => dispatch(receiveAllPosts(posts)), console.error);
};

export const requestSinglePost = (id) => (dispatch) => {
  return APIUtil.fetchSinglePost(id)
    .then(post => dispatch(receiveSinglePost(post)), console.error);
};

export const createPost = (post) => (dispatch) => {
  return APIUtil.postSinglePost(post)
    .then(post => dispatch(receiveSinglePost(post)), console.error);
};

export const editPost = (post) => (dispatch) => {
  return APIUtil.editSinglePost(post)
    .then(post => dispatch(receiveSinglePost(post)), console.error);
};

export const deletePost = (postId) => (dispatch) => {
  return APIUtil.deleteSinglePost(postId)
    .then(post => dispatch(removeSinglePost(post)), console.error);
};
