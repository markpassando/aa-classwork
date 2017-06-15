import React from 'react';
import {connect} from 'react-redux';
import {selectPokemonItem} from '../../reducers/selectors';
import ItemDetail from './item_detail';

const mapStateToProps = (state, ownProps) => {
  return {
    currentItem: ownProps.match.params.itemId,
    allItems: state.current_poke_items.items
  };
};

const mapDispatchToProps = (dispatch) => {
  return ({
    selectPokemonItem: (id) => dispatch(selectPokemonItem(state, id)),
  });
};


export default connect(mapStateToProps, mapDispatchToProps)(ItemDetail);
