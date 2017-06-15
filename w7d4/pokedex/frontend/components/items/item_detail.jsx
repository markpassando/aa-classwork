import React from 'react';

class ItemDetail extends React.Component{
  constructor(props){
    super(props);
  }

  render(){
    // debugger

    const currItem = this.props.allItems.filter((item) => `${item.id}` === this.props.match.params.itemId);
    if (!currItem) return null;

    return(
      <div>
        <ul>
        <li>{currItem[0].happiness}</li>
        <li>{currItem[0].price}</li>
        </ul>
      </div>
    );
  }
}
export default ItemDetail;
