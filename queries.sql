SELECT name, ST_ASTEXT(ST_TRANSFORM(ST_CENTROID(pog.way), 4326)) as long_lat
FROM planet_osm_polygon as pog WHERE admin_level='4';

SELECT name, ST_AREA(ST_ASTEXT(ST_TRANSFORM(pog.way, 4326))::geography)/1000000 as st_area
FROM planet_osm_polygon as pog WHERE admin_level='4' ORDER BY st_area DESC;

48.160565443598855, 17.130872533522087

SELECT ST_TRANSFORM(way, 4326) FROM planet_osm_polygon as pog LIMIT 10;

INSERT INTO planet_osm_polygon(name, way) VALUES ('My house', ST_SetSRID(ST_MakePoint(17.130872533522087, 48.160565443598855), 3857));

INSERT INTO planet_osm_polygon(name, way) 
VALUES ('My house', ST_TRANSFORM(ST_GeometryFromText
('LINESTRING(17.1309460 48.1603847,
 17.1309425 48.1603855,
 17.1309527 48.160396417,
 17.1307946 48.1604638,
 17.1307520 48.1604824,
 17.1308327 48.1605805,
 17.1310462 48.1604876,
 17.1309460 48.1603847)', 4326), 3857));
 
SELECT x.name, y.name
FROM planet_osm_polygon x, planet_osm_polygon y
WHERE x.name = 'My house' AND ST_INTERSECTS(x.way, y.way) AND y.admin_level = '4';

DELETE FROM planet_osm_polygon WHERE name = 'My house';

SELECT ST_TRANSFORM(way, 4326) FROM planet_osm_polygon WHERE name = 'My house';



INSERT INTO planet_osm_point(name, way) 
VALUES ('My location', ST_TRANSFORM(ST_GeometryFromText('POINT(17.130874350242697 48.16061599691293)', 4326), 3857));

DELETE FROM planet_osm_point WHERE name = 'My location';

SELECT * FROM planet_osm_point WHERE name = 'My location';

SELECT ST_CONTAINS(ST_TRANSFORM(x.way, 4326), ST_TRANSFORM(y.way, 4326))
FROM planet_osm_polygon x, planet_osm_point y
WHERE x.name = 'My house' AND y.name = 'My location';

SELECT * from spatial_ref_sys;

SELECT ST_TRANSFORM(way, 4326) FROM planet_osm_polygon WHERE name = 'Fakulta informatiky a informačných technológií STU' OR name = 'My house';

SELECT ST_DISTANCE(x.way, y.way)/1000 as distance_in_km
FROM planet_osm_polygon x, planet_osm_point y
WHERE x.name = 'Fakulta informatiky a informačných technológií STU' AND y.name = 'My location';

SELECT name, ST_X(ST_TRANSFORM(ST_CENTROID(way), 4326)) as centroid_long, ST_Y(ST_TRANSFORM(ST_CENTROID(way), 4326)), ST_TRANSFORM(ST_CENTROID(way), 4326) as centroid_lat,
ST_AREA(ST_ASTEXT(ST_TRANSFORM(way, 4326))::geography)/1000000 as st_area
FROM planet_osm_polygon WHERE name ilike '%okres Bratislava%' ORDER BY st_area ASC LIMIT 1;

