import mapboxgl from 'mapbox-gl';


const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {

    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    // Create a HTML element for your custom marker
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '45px';
    element.style.height = '45px';

    // Pass the element as an argument to the new marker
    new mapboxgl.Marker(element)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });

};


const initMapbox = () => {

  if (mapElement) {



    var hoveredStateId =  null;
    const map = buildMap();


    fetch("https://opendata.bordeaux-metropole.fr/api/records/1.0/search/?dataset=en_frcol_s&rows=100&facet=passage&facet=jour_col&facet=type&facet=commune")
      .then(response => response.json())
      .then((data) => {
        let i = 1;
        const test = {
            "type": "FeatureCollection",
            "features": []
        }

         data.records.forEach((record) => {
          let testi = {
            "type": "Feature",
            "geometry": record.fields.geo_shape,
            "id": i
          }
          test.features.push(testi);
          i = i + 1;
        });

        map.on('load', function () {
          map.addLayer({
            'id': 'layer-state',
            'type': 'fill',
            'source': {
              "type": "geojson",
              "data": test
            },
            'paint': {
            'fill-color': 'rgba(96, 54, 94, 0)',
            'fill-outline-color': 'rgba(200, 100, 240, 0)'
            }
          })
          .addSource("states", {
            "type": "geojson",
            "data": test
          });

          let communes = []
          data.records.forEach(record => { communes.push(record.fields.commune) })
          let collects = []
          data.records.forEach(record => { collects.push(record.fields.jour_col) })
          let types = []
          data.records.forEach(record => { types.push(record.fields.type) })

            // console.log(types);
          map.on('click', 'layer-state', function (e) {
            let commune = communes[e.features[0].id - 1]
            let collect = collects[e.features[0].id - 1]
            let type = types[e.features[0].id - 1]

              // console.log(collect);

            new mapboxgl.Popup()
              .setLngLat(e.lngLat)
              .setHTML(commune +'('+ collect +')' + ' ' + type)
              // .setHTML(collect)
              .addTo(map);
          });

          // The feature-state dependent fill-opacity expression will render the hover effect
          // when a feature's hover state is set to true.
          map.addLayer({
          "id": "state-fills",
          "type": "fill",
          "source": "states",
          "layout": {},
          "paint": {
          "fill-color": "#60365e",
          "fill-opacity": ["case",
          ["boolean", ["feature-state", "hover"], false],
          1,
          0.4
          ]
          }
          });

          map.addLayer({
          "id": "state-borders",
          "type": "line",
          "source": "states",
          "layout": {},
          "paint": {
          "line-color": "#60365e",
          "line-width": 2
          }
          });

          // When the user moves their mouse over the state-fill layer, we'll update the
          // feature state for the feature under the mouse.
          map.on("mousemove", "state-fills", function(e) {
          if (e.features.length > 0) {
          if (hoveredStateId) {
          map.setFeatureState({source: 'states', id: hoveredStateId}, { hover: false});
          }
          hoveredStateId = e.features[0].id;
          map.setFeatureState({source: 'states', id: hoveredStateId}, { hover: true});
          }
          });

          // When the mouse leaves the state-fill layer, update the feature state of the
          // previously hovered feature.
          map.on("mouseleave", "state-fills", function() {
          if (hoveredStateId) {
          map.setFeatureState({source: 'states', id: hoveredStateId}, { hover: false});
          }
          hoveredStateId =  null;
          });
        });

      });

    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    addGeoloc(map);
  }
};

 const addGeoloc = (map) => {
  // mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  map.addControl(new mapboxgl.GeolocateControl({
    positionOptions: {
      enableHighAccuracy: true
    },
    trackUserLocation: true
    })
  );
}


export { initMapbox };




























