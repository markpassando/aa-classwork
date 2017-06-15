import React from 'react';
import { Route, Link } from 'react-router-dom';
import PokemonDetailContainer from './pokemon_detail_container';

const PokemonIndexItem = (props) => {
  const { poke } = props;
  return (
    <li key={poke.id}>
      <Link to={`/pokemon/${poke.id}`}>
        {poke.name}
        <img src={poke.image_url} />
      </Link>
    </li>
  );
};

export default PokemonIndexItem;
