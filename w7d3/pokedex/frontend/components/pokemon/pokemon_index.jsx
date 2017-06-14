import React from 'react';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const allPokemon = this.props.pokemon.map((poke, i)=>{
      return(<li key={i}>
        {poke.name}
        <img src={poke.image_url} />
        </li>);
    });

    return (
      <ul>
        {allPokemon}
      </ul>
    );
  }

}

export default PokemonIndex;
