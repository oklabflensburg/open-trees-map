// fetch('/data/baumkataster_bonn.updated.geojson', {
fetch('/data/baumkataster_flensburg.updated.geojson', {
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


const customIcon = L.icon({
    iconUrl: '/static/marker-icon-green.png',
    shadowUrl: '/static/marker-shadow.png',
    iconSize: [31, 41],
    iconAnchor: [12, 41],
    tooltipAnchor: [4, -41],
    shadowSize: [45, 41]
});


const blackIcon = L.icon({
    iconUrl: '/static/marker-icon-black.png',
    shadowUrl: '/static/marker-shadow.png',
    iconSize: [31, 41],
    iconAnchor: [12, 41],
    tooltipAnchor: [4, -41],
    shadowSize: [45, 41]
});


function addData(data) {
    let markers = L.markerClusterGroup({
        zoomToBoundsOnClick: true,
        disableClusteringAtZoom: 19
    });

    const geojsonGroup = L.geoJSON(data, {
        onEachFeature: function (feature, layer) {
            layer.on('click', function (e) {
                document.querySelector('#filter').scrollTo({
                    top: 0,
                    left: 0
                });

                map.setView(e.latlng, 19)

                document.querySelector('#details').classList.remove('hidden');

                if ('tree_type' in e.target.feature.properties) {
                    document.querySelector('#place').innerHTML = e.target.feature.properties.tree_type
                }

                if ('tree_species' in e.target.feature.properties) {
                    document.querySelector('#type').innerHTML = e.target.feature.properties.tree_species
                }

                if ('trunk_diameter' in e.target.feature.properties) {
                    document.querySelector('#model').innerHTML = e.target.feature.properties.trunk_diameter
                }

                if ('crown_diameter' in e.target.feature.properties) {
                    document.querySelector('#plant').innerHTML = e.target.feature.properties.crown_diameter
                }

                if ('total_height' in e.target.feature.properties) {
                    document.querySelector('#scope').innerHTML = e.target.feature.properties.total_height
                }

                if ('felling_date' in e.target.feature.properties) {
                    document.querySelector('#crown').innerHTML = e.target.feature.properties.felling_date
                }

                if ('plant_year' in e.target.feature.properties) {
                    document.querySelector('#height').innerHTML = e.target.feature.properties.plant_year
                }

                if ('place' in e.target.feature.properties) {
                    document.querySelector('#place').innerHTML = e.target.feature.properties.place
                }
            })
        },
        pointToLayer: function (feature, latlng) {
            const label = String(feature.properties.tree_species)
            let icon = customIcon

            if ('felling_date' in feature.properties) {
                icon = blackIcon
            }

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
