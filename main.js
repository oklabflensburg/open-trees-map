// fetch('/data/baumkataster_bonn.updated.geojson', {
fetch('/data/baumkataster_flensburg.geojson', {
  method: 'GET'
})
.then((response) => {
  return response.json()
})
.then((data) => {
  addData(data)
})
.catch(function (error) {
  console.log(error)
});


const map = L.map('map').setView([54.7836, 9.4321], 13);

L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

let geocoder = L.Control.Geocoder.nominatim();

if (typeof URLSearchParams !== 'undefined' && location.search) {
    // parse /?geocoder=nominatim from URL
    let params = new URLSearchParams(location.search);
    let geocoderString = params.get('geocoder');

    if (geocoderString && L.Control.Geocoder[geocoderString]) {
        console.log('Using geocoder', geocoderString);
        geocoder = L.Control.Geocoder[geocoderString]();
    } else if (geocoderString) {
        console.warn('Unsupported geocoder', geocoderString);
    }
}

const osmGeocoder = new L.Control.geocoder({
    query: 'Flensburg',
    position: 'topright',
    placeholder: 'Adresse oder Ort',
    defaultMarkGeocode: false
}).addTo(map);

osmGeocoder.on('markgeocode', e => {
    const bounds = L.latLngBounds(e.geocode.bbox._southWest, e.geocode.bbox._northEast);
    map.fitBounds(bounds);
});


function addData(data) {
    let markers = L.markerClusterGroup({
        zoomToBoundsOnClick: true,
        disableClusteringAtZoom: 19
    });

    const geojsonGroup = L.geoJSON(data, {
        onEachFeature: function (feature, layer) {
            layer.on('click', function (e) {
                document.getElementById('filter').scrollTo({
                    top: 0,
                    left: 0
                });

                map.setView(e.latlng, 20);

                let place = e.target.feature.properties.place
                let type = e.target.feature.properties.type
                let model = e.target.feature.properties.model
                let plant = e.target.feature.properties.plant
                let scope = e.target.feature.properties.scope
                let crown = e.target.feature.properties.crown
                let height = e.target.feature.properties.height

                document.getElementById('details').classList.remove('hidden');
                document.getElementById('place').innerHTML = place || '---';
                document.getElementById('type').innerHTML = type || '---';
                document.getElementById('model').innerHTML = model || '---';
                document.getElementById('plant').innerHTML = plant || '---';
                document.getElementById('scope').innerHTML = scope || '---';
                document.getElementById('crown').innerHTML = crown || '---';
                document.getElementById('height').innerHTML = height || '---';
            })
        },
        pointToLayer: function (feature, latlng) {
            const label = String(feature.properties.type)

            const customIcon = L.icon({
                iconUrl: '/static/marker-icon-green.png',
                shadowUrl: '/static/marker-shadow.png',
                iconSize: [31, 41],
                iconAnchor: [12, 41],
                tooltipAnchor: [4, -41],
                shadowSize: [45, 41]
            });

            return L.marker(latlng, {icon: customIcon}).bindTooltip(label, {
                permanent: false,
                direction: 'top'
            }).openTooltip();
        }
    })

    markers.addLayer(geojsonGroup)
    map.addLayer(markers)
    map.fitBounds(markers.getBounds(), {padding: [0, 0, 0, 0]})
}
