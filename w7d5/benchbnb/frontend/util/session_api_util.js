export const requestSignUp = (user) => {
  return $.ajax({
  method: 'POST',
  url: '/api/users/',
  data: { user: {
    username: user.username,
    password: user.password
    }}
  });
};

export const requestLogIn = (user) => {
  return $.ajax({
  method: 'POST',
  url: '/api/session/',
  data: { user: {
    username: user.username,
    password: user.password
    }}
  });
};

export const requestLogOut = () => {
  return $.ajax({
  method: 'DELETE',
  url: '/api/session/',
  });
};
