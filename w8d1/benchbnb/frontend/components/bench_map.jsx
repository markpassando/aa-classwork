import React from 'react';
import MarkerManager from '../util/marker_manager';

class BenchMap extends React.Component {

  componentDidMount() {
    // set the map to show SF
    const mapOptions = {
      center: { lat: 40.745428, lng: -73.991038 }, // this is SF
      zoom: 14
    };
    // wrap the mapDOMNode in a Google Map
    this.map = new google.maps.Map(this.mapNode, mapOptions);
    this.MarkerManager = new MarkerManager(this.map);
    this.MarkerManager.updateMarkers(this.props.benches);
    this.map.addListener('idle', () => {
      let coords = this.map.getBounds();
      let NE = coords.getNorthEast();
      let SW = coords.getSouthWest();
      debugger
      this.props.updateBounds();

    });
  }

  componentDidUpdate() {
    this.MarkerManager.updateMarkers(this.props.benches);
  }

  render() {

    return (
      <div id="map-container" ref={ map => this.mapNode = map }>

      </div>
    );
  }
}

export default BenchMap;
