export const fetchAllPosts = () => {
  return $.ajax({
    method: 'GET',
    url: 'api/posts'
  });
};

export const fetchSinglePost = (id) => {
  return $.ajax({
    method: 'GET',
    url: `api/posts/${id}`
  });
};

export const postSinglePost = (post) => {
  return $.ajax({
    method: 'POST',
    url: 'api/posts/',
    data: post
  });
};

export const deleteSinglePost = (postId) => {
  return $.ajax({
    method: 'DELETE',
    url: `api/posts/${postId}`
  });
};

export const editSinglePost = (post) => {
  return $.ajax({
    method: 'PATCH',
    url: `api/posts/${post.post.id}`,
    data: post
  });
};


// $.ajax({
//   method: 'POST',
//   url: 'api/posts/',
//   data: {post: "gg"}
// }).then((res)=>console.log(res), console.error);

// $.ajax({
//   method: 'PATCH',
//   url: `api/posts/13`,
//   data: { post: {title:"EDIT!!!", body:"yooooo"}}
// }).then((res)=>console.log(res), console.error);
