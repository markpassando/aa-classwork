export const getTodos = () => {
  return $.ajax({
      url: '/api/todos',
      method: 'GET',
    });
};

export const postTodos = (todo) => {
  return $.ajax({
      url: '/api/todos',
      method: 'POST',
      data: {todo}
    });
};
