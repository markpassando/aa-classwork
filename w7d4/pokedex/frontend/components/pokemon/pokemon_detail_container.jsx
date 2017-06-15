import React from 'react';
import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { requestOnePoke } from '../../actions/pokemon_actions';
const mapStateToProps = (state) => {
  // debugger
  return ({
    // currentPoke: state.pokemon.currentPoke,
    currentPoke: state.pokemon.entities[state.pokemon.currentPoke]
  });
};

const mapDispatchToProps = (dispatch) => {
  return {
    requestOnePoke: (id) => dispatch(requestOnePoke(id)),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);
