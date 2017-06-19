export default class MarkerManager {
  constructor(map) {
    this.map = map;
    this.markers = {};
  }

  updateMarkers(benches) {
    console.log('time to update');
    benches.forEach((bench) => {
      if (!this.markers.hasOwnProperty(bench.id)) {
        this.markers[bench.id] = bench;
        this.createMarkerFromBench(bench);
      }
    });
    // debugger
  }

  createMarkerFromBench(bench) {
    new google.maps.Marker({
    position: { lat: bench.lat, lng: bench.long },
    map: this.map,
    title: bench.description
  });
  }
}
