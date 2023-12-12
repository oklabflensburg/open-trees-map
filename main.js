let dataObject = null
let cluster = null

fetch('./data/baumkataster_flensburg.updated.geojson', {
  method: 'GET'
})
.then((response) => {
  return response.json()
})
.then((data) => {
  renderPromise(data, 0)
})
.catch(function (error) {
  console.log(error)
})

fetch('./data/flensburg_stadtteile.geojson', {
    method: 'GET'
})
.then((response) => {
    return response.json()
})
.then((data) => {
    addDistrictsLayer(data)
})
.catch(function (error) {
    console.log(error)
})

const map = L.map('map').setView([54.7836, 9.4321], 13)

L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map)

let geocoder = L.Control.Geocoder.nominatim()

if (typeof URLSearchParams !== 'undefined' && location.search) {
    // parse /?geocoder=nominatim from URL
    let params = new URLSearchParams(location.search)
    let geocoderString = params.get('geocoder')

    if (geocoderString && L.Control.Geocoder[geocoderString]) {
        console.log('Using geocoder', geocoderString)
        geocoder = L.Control.Geocoder[geocoderString]()
    } else if (geocoderString) {
        console.warn('Unsupported geocoder', geocoderString)
    }
}

const osmGeocoder = new L.Control.geocoder({
    query: 'Flensburg',
    position: 'topright',
    placeholder: 'Adresse oder Ort',
    defaultMarkGeocode: false
}).addTo(map)

osmGeocoder.on('markgeocode', e => {
    const bounds = L.latLngBounds(e.geocode.bbox._southWest, e.geocode.bbox._northEast)
    map.fitBounds(bounds)
})


const customIcon = L.icon({
    iconUrl: './static/marker-icon-green.png',
    shadowUrl: './static/marker-shadow.png',
    iconSize: [31, 41],
    iconAnchor: [12, 41],
    tooltipAnchor: [4, -41],
    shadowSize: [45, 41]
})


const blackIcon = L.icon({
    iconUrl: './static/marker-icon-black.png',
    shadowUrl: './static/marker-shadow.png',
    iconSize: [25, 41],
    iconAnchor: [12, 41],
    tooltipAnchor: [2, -41],
    shadowSize: [45, 41]
})


const queryform = document.querySelector('#form')

if (queryform.length) {
    queryform.addEventListener('change', (e) => {
        e.preventDefault()

        const data = new FormData(queryform)
        const districtId = parseInt(data.get('district'))

        renderPromise(dataObject, districtId)
    })
}


function addDistrictsLayer(data) {
    L.geoJson(data, {
      style: {
        color: '#fff',
        fillColor: '#185a44',
        fillOpacity: 0.4,
        opacity: 0.6,
        weight: 1
    }
    }).addTo(map)
}


function renderPromise(data, districtId) {
    dataObject = data

    if (cluster) {
        map.removeLayer(cluster)
    }

    const geojsonGroup = L.geoJSON(data, {
        filter: function (feature) {
            if (districtId === 0) {
                return true
            }

            if (feature.properties.district_id === districtId) {
                return true
            }   
        },
        onEachFeature: function (feature, layer) {
            layer.on('click', function (e) {
                document.querySelector('#filter').scrollTo({
                    top: 0,
                    left: 0
                })

                map.setView(e.latlng, 19)

                document.querySelector('#details').classList.remove('hidden')
                document.querySelector('#fellingYear').innerHTML = ''

                if ('tree_type' in e.target.feature.properties) {
                    document.querySelector('#treeType').innerHTML = e.target.feature.properties.tree_type
                }

                if ('tree_species' in e.target.feature.properties) {
                    document.querySelector('#treeSpecies').innerHTML = e.target.feature.properties.tree_species
                }

                if ('trunk_diameter' in e.target.feature.properties) {
                    document.querySelector('#trunkDiameter').innerHTML = e.target.feature.properties.trunk_diameter
                }

                if ('crown_diameter' in e.target.feature.properties) {
                    document.querySelector('#crownDiameter').innerHTML = e.target.feature.properties.crown_diameter
                }

                if ('total_height' in e.target.feature.properties) {
                    document.querySelector('#totalHeight').innerHTML = e.target.feature.properties.total_height
                }

                if ('felling_year' in e.target.feature.properties) {
                    const fellingYear = e.target.feature.properties.felling_year
                    document.querySelector('#fellingYear').innerHTML = `Hinweis: Gefällt ${fellingYear}`
                }

                if ('plant_year' in e.target.feature.properties) {
                    document.querySelector('#plantYear').innerHTML = e.target.feature.properties.plant_year
                }

                if ('place' in e.target.feature.properties) {
                    document.querySelector('#place').innerHTML = e.target.feature.properties.place
                }

                if ('wikipedia_url' in e.target.feature.properties) {
                    document.querySelector('#wikipediaUrl').innerHTML = e.target.feature.properties.wikipedia_url
                }
            })
        },
        pointToLayer: function (feature, latlng) {
            let label = String(feature.properties.tree_species)
            let icon = customIcon

            if ('felling_year' in feature.properties) {
                const fellingYear = feature.properties.felling_year

                label = `Gefällt ${fellingYear}`
                icon = blackIcon
            }

            return L.marker(latlng, {icon: icon}).bindTooltip(label, {
                permanent: false,
                direction: 'top'
            }).openTooltip()
        }
    })

    cluster = L.markerClusterGroup({
	      spiderfyOnMaxZoom: false,
	      showCoverageOnHover: false,
        disableClusteringAtZoom: 19,
        maxClusterRadius: 40
    })
    cluster.addLayer(geojsonGroup)
    map.addLayer(cluster)

    map.fitBounds(cluster.getBounds(), {padding: [0, 0, 0, 0]})
}
