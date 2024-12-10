import L from 'leaflet'
import 'leaflet-control-geocoder'
import 'leaflet.markercluster'

import 'leaflet/dist/leaflet.css'
import 'leaflet-control-geocoder/dist/Control.Geocoder.css'

import inventory from 'url:../data/baumkataster_flensburg.updated.geojson'
import districts from 'url:../data/flensburg_stadtteile.geojson'

import markerDefault from 'url:../static/marker-laubbaum-default.webp'
import markerGefaelltDefault from 'url:../static/marker-gefaellt-default.webp'
import markerGefaelltSelected from 'url:../static/marker-gefaellt-selected.webp'
import markerSelected from 'url:../static/marker-laubbaum-selected.webp'

import { Env } from './env.js'


const env = new Env()
env.injectLinkContent('.contact-mail', 'mailto:', '', env.contactMail, 'E-Mail')


fetch(inventory, {
  method: 'GET'
}).then((response) => response.json()).then((data) => {
  renderPromise(data, 0, false)
}).catch(function (error) {
  console.log(error)
})

fetch(districts, {
  method: 'GET'
}).then((response) => response.json()).then((data) => {
  addDistrictsLayer(data)
}).catch(function (error) {
  console.log(error)
})

const defaultIcon = L.icon({
  iconUrl: markerDefault,
  iconSize: [30, 36],
  iconAnchor: [15, 36],
  tooltipAnchor: [0, -37]
})


const selectedIcon = L.icon({
  iconUrl: markerSelected,
  iconSize: [30, 36],
  iconAnchor: [15, 36],
  tooltipAnchor: [0, -37]
})


const gefaelltDefaultIcon = L.icon({
  iconUrl: markerGefaelltDefault,
  iconSize: [30, 36],
  iconAnchor: [15, 36],
  tooltipAnchor: [0, -37]
})


const gefaelltSelectedIcon = L.icon({
  iconUrl: markerGefaelltSelected,
  iconSize: [30, 36],
  iconAnchor: [15, 36],
  tooltipAnchor: [0, -37]
})


const layerStyle = {
  standard: {
    color: '#fff',
    fillColor: '#6ed0ef',
    fillOpacity: 0.4,
    opacity: 0.6,
    weight: 3
  }
}


const map = L.map('map').setView([54.79443515, 9.43205485], 13)

L.tileLayer('https://tiles.oklabflensburg.de/sgm/{z}/{x}/{y}.png', {
  maxZoom: 20,
  maxNativeZoom: 20,
  attribution: '&copy; <a href="https://www.openstreetmap.org/copyright" target="_blank" rel="dc:rights">OpenStreetMap</a> contributors'
}).addTo(map)

let geocoder = L.Control.Geocoder.nominatim()
let previousSelectedMarker = null
let dataObject = null
let cluster = null


if (typeof URLSearchParams !== 'undefined' && location.search) {
  // parse /?geocoder=nominatim from URL
  const params = new URLSearchParams(location.search)
  const geocoderString = params.get('geocoder')

  if (geocoderString && L.Control.Geocoder[geocoderString]) {
    console.log('Using geocoder', geocoderString)
    geocoder = L.Control.Geocoder[geocoderString]()
  }
  else if (geocoderString) {
    console.warn('Unsupported geocoder', geocoderString)
  }
}

const osmGeocoder = new L.Control.geocoder({
  query: 'Flensburg',
  position: 'topright',
  placeholder: 'Adresse oder Ort',
  defaultMarkGeocode: false
}).addTo(map)

osmGeocoder.on('markgeocode', (e) => {
  const bounds = L.latLngBounds(e.geocode.bbox._southWest, e.geocode.bbox._northEast)
  map.fitBounds(bounds)
})

function addDistrictsLayer(data) {
  L.geoJson(data, {
    style: layerStyle.standard
  }).addTo(map)
}

function formatAmountOfTrees(amountOfTrees) {
  const numberFormat = new Intl.NumberFormat('de-DE')
  const amountOfTreesFormatted = numberFormat.format(amountOfTrees)

  return amountOfTreesFormatted
}

function capitalizeEachWord(str) {
  return str.replace(/-/g, ' ').replace(/\w\S*/g, function (txt) {
    return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase()
  })
}

function renderFeatureDetails(feature) {
  const treeType = feature.properties.tree_type || '---'
  const treeSpecies = feature.properties.tree_species || '---'
  const trunkDiameter = feature.properties.trunk_diameter || '---'
  const crownDiameter = feature.properties.crown_diameter || '---'
  const wikipediaUrl = feature.properties.wikipedia_url || '---'
  const totalHeight = feature.properties.total_height || '---'
  const fellingYear = feature.properties.felling_year || '---'
  const plantYear = feature.properties.plant_year || '---'
  const topology = feature.properties.topology || '---'
  const place = feature.properties.place || '---'

  let detailOutput = ''

  detailOutput += `<li class="last-of-type:pb-2"><strong>Gebiet</strong><br> ${place}</li>`
  detailOutput += `<li class="last-of-type:pb-2 pt-2"><strong>Wissenschaftlicher Name</strong><br> ${treeSpecies}</li>`
  detailOutput += `<li class="last-of-type:pb-2 pt-2"><strong>Höhe über NHN</strong><br> ${topology}m</li>`
  detailOutput += `<li class="last-of-type:pb-2 pt-2"><strong>Pflanzjahr</strong><br> ${plantYear}</li>`
  detailOutput += `<li class="last-of-type:pb-2 pt-2"><strong>Stammumfang</strong><br> ${trunkDiameter}</li>`
  detailOutput += `<li class="last-of-type:pb-2 pt-2"><strong>Kronendurchmesser</strong><br> ${crownDiameter}</li>`
  detailOutput += `<li class="last-of-type:pb-2 pt-2"><strong>Baumhöhe</strong><br> ${totalHeight}</li>`
  detailOutput += `<li class="last-of-type:pb-2 pt-2"><strong>Wikipedia</strong><br> ${wikipediaUrl}</li>`
  detailOutput += '<li class="pt-2"><small>Alle Angaben ohne Gewähr</small></li>'

  document.querySelector('#about').classList.add('hidden')
  document.querySelector('#details').classList.remove('hidden')
  document.querySelector('#detailList').innerHTML = detailOutput
}

function renderPromise(data, districtId, onlyFellings) {
  document.querySelector('#details').classList.add('hidden')
  document.querySelector('#detailList').innerHTML = ''

  dataObject = data

  if (cluster) {
    map.removeLayer(cluster)
  }

  const geojsonGroup = L.geoJSON(data, {
    filter(feature) {
      if (districtId === 0 && onlyFellings === false) {
        return true
      }
      else if (districtId === 0 && onlyFellings === true && 'felling_year' in feature.properties) {
        return true
      }

      if (feature.properties.district_id === districtId && onlyFellings === false) {
        return true
      }
      else if (feature.properties.district_id === districtId && onlyFellings === true && 'felling_year' in feature.properties) {
        return true
      }

      return false
    },
    onEachFeature(feature, layer) {
      layer.on('click', function (e) {
        document.querySelector('#filter').scrollTo({
          top: 0,
          left: 0
        })

        map.setView(e.latlng, 19)
        renderFeatureDetails(e.target.feature)
      })
    },
    pointToLayer(feature, latlng) {
      let label = String(feature.properties.tree_species)
      let icon = defaultIcon

      if ('felling_year' in feature.properties) {
        const fellingYear = feature.properties.felling_year

        label = `Gefällt ${fellingYear}`
        icon = gefaelltDefaultIcon
      }

      return L.marker(latlng, { icon }).bindTooltip(label, {
        permanent: false,
        direction: 'top'
      }).openTooltip()
    }
  })

  cluster = L.markerClusterGroup({
    spiderfyOnMaxZoom: false,
    showCoverageOnHover: false,
    disableClusteringAtZoom: 19,
    maxClusterRadius: 50
  })

  cluster.on('click', function (a) {
    let iconNormal = defaultIcon
    let iconSelected = selectedIcon

    if ('felling_year' in a.layer.feature.properties) {
      iconNormal = gefaelltDefaultIcon
      iconSelected = gefaelltSelectedIcon
    }

    if (previousSelectedMarker !== null) {
      previousSelectedMarker.setIcon(iconNormal)
    }

    a.layer.setIcon(iconSelected)
    previousSelectedMarker = a.layer
  })

  cluster.addLayer(geojsonGroup)
  map.addLayer(cluster)

  map.fitBounds(cluster.getBounds(), { padding: [0, 0, 0, 0] })

  /*
  const lengthFacilities = geojsonGroup.getLayers().length
  const amountOfFacilities = formatAmountOfFacilities(lengthFacilities)
  let hintAmountOfFacilities = 'Keine Treffer gefunden'

  if (amountOfFacilities > 0) {
    hintAmountOfFacilities = `Anzahl angezeigter Schulen ${amountOfFacilities}`
  }

  document.querySelector('#amountFacilities').innerHTML = hintAmountOfFacilities
  */
}

const queryform = document.querySelector('#form')

if (queryform.length) {
  queryform.addEventListener('change', (e) => {
    e.preventDefault()

    let onlyFellings = false

    const data = new FormData(queryform)
    const districtId = parseInt(data.get('district'))
    onlyFellings = /^true$/i.test(data.get('onlyFellings'))

    renderPromise(dataObject, districtId, onlyFellings)
  })
}