import React from 'react';
import { Route, Link } from 'react-router-dom';
import ItemDetailContainer from '../items/item_detail_container';
class PokemonDetail extends React.Component {
  constructor(props){
    super(props);
  }

  componentDidMount(){
    // debugger
    this.props.requestOnePoke(this.props.match.params.pokemonId);
  }


  componentWillReceiveProps(newProps){

    // debugger
    if(this.props.match.params.pokemonId !== newProps.match.params.pokemonId){
      this.props.requestOnePoke(newProps.match.params.pokemonId);
    }
  }

  render(){
    const currentPoke = this.props.currentPoke;

    if (!currentPoke) return null;


    const items = currentPoke.items.map((item)=>{
      return (<Link key={item.id} to ={`/pokemon/${currentPoke.id}/item/${item.id}`}>
        <p>{item.name}</p>
        <img src={`${item.image_url}`}/>
        </Link>);
      });


    return (
      <div>
        <h1>Pokemon Details</h1>
        <p>{currentPoke.name}</p>
        <figure>
          <img src={currentPoke.image_url}/>
        </figure>
        <ul>
          <li>Type: {currentPoke.type}</li>
          <li>Defense: {currentPoke.defense}</li>
          <li>Attack: {currentPoke.attack}</li>
          <li>Moves: {currentPoke.moves.join(", ")}</li>
          <li>Items: {items} </li>
        </ul>
        <Route path="/pokemon/:pokemonId/item/:itemId" component={ItemDetailContainer} />
      </div>
    );
  }
}

export default PokemonDetail;
