INSTALL spatial;
INSTALL httpfs;

LOAD spatial;
LOAD httpfs;

DROP TABLE IF EXISTS user_buildings;
CREATE TABLE user_buildings AS
SELECT *
FROM ST_Read('data/map.geojson')
WHERE ST_GeometryType(geom) = 'POLYGON';

DROP TABLE IF EXISTS overture_raw;
CREATE TABLE overture_raw AS
SELECT *
FROM read_parquet('https://overturemaps-us-west-2.s3.us-west-2.amazonaws.com/release/2026-04-15.0/theme=buildings/type=building/part-00444-4ebd20bb-df8b-51bf-bf04-9eca0f9b119c-c000.zstd.parquet')
WHERE ST_XMin(geometry) BETWEEN (SELECT MIN(ST_XMin(geom)) FROM user_buildings) AND (SELECT MAX(ST_XMax(geom)) FROM user_buildings)
  AND ST_YMin(geometry) BETWEEN (SELECT MIN(ST_YMin(geom)) FROM user_buildings) AND (SELECT MAX(ST_YMax(geom)) FROM user_buildings)
  AND try(ST_IsValid(geometry)) = true;

DROP TABLE IF EXISTS overture_with_source;
CREATE TABLE overture_with_source AS
WITH exploded AS (
    SELECT
        overture.*,
        unnest(sources) AS source_item
    FROM overture_raw overture
)
SELECT
    id,
    geometry,
    sources,
    CASE
        WHEN EXISTS (
            SELECT 1 FROM user_buildings ub
            WHERE ST_Intersects(ub.geom, ST_SetCRS(geometry, 'EPSG:4326'))
            AND ub.user = 'Miterev Dmitry'
        ) THEN 'my'
        WHEN source_item['dataset'] = 'OpenStreetMap' THEN 'osm'
        WHEN source_item['dataset'] LIKE '%Microsoft%'
            OR source_item['dataset'] LIKE '%Google%'
            OR source_item['dataset'] LIKE '%ML%' THEN 'ml'
        ELSE 'other'
    END AS source_type
FROM exploded;

COPY (
    SELECT
        json_object(
            'type', 'Feature',
            'geometry', ST_AsGeoJSON(geometry)::JSON,
            'properties', json_object(
                'source_type', source_type,
                'id', id
            )
        ) AS feature
    FROM overture_with_source
    WHERE source_type IN ('my', 'osm', 'ml')
) TO 'client/public/overture.geojson'
WITH (FORMAT CSV, HEADER false, QUOTE '', DELIMITER '|');

COPY (
    SELECT json_object(
        'type', 'FeatureCollection',
        'features', json_group_array(
            json_object(
                'type', 'Feature',
                'geometry', ST_AsGeoJSON(geometry)::JSON,
                'properties', json_object(
                    'source_type', source_type,
                    'id', id
                )
            )
        )
    ) AS geojson
    FROM overture_with_source
    WHERE source_type IN ('my', 'osm', 'ml')
) TO 'client/public/overture.geojson'
WITH (FORMAT CSV, HEADER false, QUOTE '');