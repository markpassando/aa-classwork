export const RECEIVE_ERRORS = "RECEIVE_ERRORS";
export const CLEAR_ERRORS = "CLEAR_ERRORS";

export const receiveErrors = function (errors) {
  return ({
    type: RECEIVE_TODOS,
    errors: errors
  });
};

export const clearErrors = function (errors) {
  return ({
    type: CLEAR_TODOS,
    errors: []
  });
};
