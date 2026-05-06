import './style.css';
import 'ol/ol.css';

import Map from 'ol/Map';
import View from 'ol/View';
import TileLayer from 'ol/layer/Tile';
import ImageLayer from 'ol/layer/Image';
import VectorLayer from 'ol/layer/Vector';
import VectorSource from 'ol/source/Vector';
import GeoJSON from 'ol/format/GeoJSON';

import OSM from 'ol/source/OSM';
import ImageWMS from 'ol/source/ImageWMS';

import { fromLonLat } from 'ol/proj';
import { applyStyle } from 'ol-mapbox-style';

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

const wmsLayers = {};
Object.keys(layersConfig).forEach((key) => {
  wmsLayers[key] = createWmsLayer(layersConfig[key]);
});

const overtureSource = new VectorSource({
  url: '/overture.geojson',
  format: new GeoJSON()
});

const overtureLayer = new VectorLayer({
  source: overtureSource,
  visible: true
});

const map = new Map({
  target: 'map',
  layers: [
    new TileLayer({
      source: new OSM(),
      opacity: 0.7
    }),
    wmsLayers.buildings,
    wmsLayers.roads,
    wmsLayers.poi,
    overtureLayer
  ],
  view: new View({
    center: fromLonLat([49.276, 53.593]),
    zoom: 17,
    minZoom: 6,
    maxZoom: 20
  })
});

const overtureMapboxStyle = {
  version: 8,
  sources: {
    overture: {
      type: 'geojson',
      data: '/overture.geojson'
    }
  },
  layers: [
    {
      id: 'overture-my',
      type: 'fill',
      source: 'overture',
      filter: ['==', ['get', 'source_type'], 'my'],
      paint: {
        'fill-color': 'rgba(34, 197, 94, 0.7)',
        'fill-outline-color': '#15803d'
      }
    },
    {
      id: 'overture-osm',
      type: 'fill',
      source: 'overture',
      filter: ['==', ['get', 'source_type'], 'osm'],
      paint: {
        'fill-color': 'rgba(59, 130, 246, 0.7)',
        'fill-outline-color': '#1d4ed8'
      }
    },
    {
      id: 'overture-ml',
      type: 'fill',
      source: 'overture',
      filter: ['==', ['get', 'source_type'], 'ml'],
      paint: {
        'fill-color': 'rgba(249, 115, 22, 0.7)',
        'fill-outline-color': '#c2410c'
      }
    }
  ]
};

// Применяем стиль через ol-mapbox-style
applyStyle(overtureLayer, overtureMapboxStyle).then(() => {
  console.log('Overture слой стилизован через ol-mapbox-style');
}).catch(error => {
  console.error('Ошибка применения стиля:', error);
});

document.getElementById('buildings-toggle')
  ?.addEventListener('change', (e) => {
    wmsLayers.buildings.setVisible(e.target.checked);
  });

document.getElementById('roads-toggle')
  ?.addEventListener('change', (e) => {
    wmsLayers.roads.setVisible(e.target.checked);
  });

document.getElementById('poi-toggle')
  ?.addEventListener('change', (e) => {
    wmsLayers.poi.setVisible(e.target.checked);
  });

document.getElementById('overture-toggle')
  ?.addEventListener('change', (e) => {
    overtureLayer.setVisible(e.target.checked);
  });

overtureSource.on('featuresloadend', () => {
  const features = overtureSource.getFeatures();
  console.log(`Загружено ${features.length} объектов Overture`);
});

overtureSource.on('featuresloaderror', (error) => {
  console.error('Ошибка загрузки overture.geojson:', error);
});

console.log('Карта инициализирована');