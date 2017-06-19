import * as APIUtil from '../util/bench_api_util';

export const UPDATE_BOUNDS = "UPDATE_BOUNDS";

export const updateBounds = (bounds) => {
  return ({
    type: UPDATE_BOUNDS,
    bounds
  });
};
