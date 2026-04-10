import './style.css';
import 'ol/ol.css';

import Map from 'ol/Map';
import View from 'ol/View';
import TileLayer from 'ol/layer/Tile';
import ImageLayer from 'ol/layer/Image';

import OSM from 'ol/source/OSM';
import ImageWMS from 'ol/source/ImageWMS';

import { fromLonLat } from 'ol/proj';

const wmsEndpoint = 'http://localhost:8080/geoserver/gis/wms';

const layersConfig = {
  buildings: {
    name: 'gis:buildings',
    opacity: 0.65,
    visible: true,
    color: '#e74c3c'
  },
  roads: {
    name: 'gis:roads',
    opacity: 0.8,
    visible: true,
    color: '#3498db'
  },
  poi: {
    name: 'gis:poi',
    opacity: 0.9,
    visible: true,
    color: '#2ecc71'
  }
};

function createWmsLayer(config) {
  return new ImageLayer({
    source: new ImageWMS({
      url: wmsEndpoint,
      params: {
        LAYERS: config.name,
        TILED: true,
        FORMAT: 'image/png',
        TRANSPARENT: true
      },
      ratio: 1,
      serverType: 'geoserver'
    }),
    opacity: config.opacity,
    visible: config.visible
  });
}

const layers = {};
Object.keys(layersConfig).forEach((key) => {
  layers[key] = createWmsLayer(layersConfig[key]);
});

const map = new Map({
  target: 'map',
  layers: [
    new TileLayer({
      source: new OSM(),
      opacity: 0.7
    }),
    layers.buildings,
    layers.roads,
    layers.poi
  ],
  view: new View({
    center: fromLonLat([49.389, 53.507]),
    zoom: 13,
    minZoom: 6,
    maxZoom: 18
  })
});

document.getElementById('buildings-toggle')
  ?.addEventListener('change', (e) => {
    layers.buildings.setVisible(e.target.checked);
  });

document.getElementById('roads-toggle')
  ?.addEventListener('change', (e) => {
    layers.roads.setVisible(e.target.checked);
  });

document.getElementById('poi-toggle')
  ?.addEventListener('change', (e) => {
    layers.poi.setVisible(e.target.checked);
  });

console.log('Карта инициализирована. Слои:', Object.keys(layers));