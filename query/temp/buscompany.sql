DROP DATABASE IF EXISTS bus_company;
CREATE DATABASE bus_company;
USE bus_company;

-- Drivers have just a name
CREATE TABLE drivers (
  id   INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  name VARCHAR(255) UNIQUE            NOT NULL
);

-- Buses have a licence number and which model they belong to
CREATE TABLE buses (
  id             INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  licence_number VARCHAR(255)                   NOT NULL,
  model_id       INT                            NOT NULL
);

-- Bus models have a name and the capacity of people.
CREATE TABLE bus_models (
  id       INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  name     VARCHAR(255),
  capacity INT
);

-- A route will have a length that may be calculated by the application based on the real paths the buses take
CREATE TABLE routes (
  id     INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  name   VARCHAR(255),
  length DOUBLE
);
-- A city has just a name
CREATE TABLE cities (
  id   INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  name VARCHAR(255) UNIQUE            NOT NULL
);

-- Stops are associated with a city, they contain an address, a telephone number, and GPS coordinates.
CREATE TABLE stops (
  id        INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  city_id   INT                            NOT NULL,
  address   VARCHAR(255),
  telephone VARCHAR(255),
  langitude DOUBLE,
  latitude  DOUBLE
);

-- A pivot table that stores how routes are constructed.
-- The sequence number notates at which point of a route a stop will be.
CREATE TABLE routes_composition (
  id              INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  route_id        INT                            NOT NULL,
  stop_id         INT                            NOT NULL,
  sequence_number INT                            NOT NULL
);

-- A schedule stores which driver will drive with which bus at which part of a route.
CREATE TABLE schedules (
  id                   INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  routes_compostion_id INT,
  driver_id            INT,
  bus_id               INT
);

-- Add foreign key constraints


-- Each stop is located in exactly one city.
ALTER TABLE stops
  ADD CONSTRAINT stop_city_constraint FOREIGN KEY (city_id) REFERENCES cities (id);

-- The routes are composed using stops
ALTER TABLE routes_composition
  ADD CONSTRAINT routes_composition_stop_constraint FOREIGN KEY (stop_id) REFERENCES stops (id),
  ADD CONSTRAINT routes_composition_route_constraint FOREIGN KEY (route_id) REFERENCES routes (id);

-- Schedules have store which driver uses which bus on which part of a route.
ALTER TABLE schedules
  ADD CONSTRAINT schedules_routes_composition_constraint FOREIGN KEY (routes_compostion_id) REFERENCES routes_composition (id),
  ADD CONSTRAINT schedules_routes_driver_constraint FOREIGN KEY (driver_id) REFERENCES drivers (id),
  ADD CONSTRAINT schedules_routes_bus_constraint FOREIGN KEY (bus_id) REFERENCES buses (id);

ALTER TABLE buses
  ADD CONSTRAINT bus_model_constraint FOREIGN KEY (model_id) REFERENCES bus_models (id);

-- Add drivers
INSERT INTO drivers (name) VALUES ('Max Mustermann');
INSERT INTO drivers (name) VALUES ('Tom Turbo');
INSERT INTO drivers (name) VALUES ('Hugo Hallo');
INSERT INTO drivers (name) VALUES ('Slack Sloth');

-- Add cities
INSERT INTO cities (name) VALUES ('Vienna');
INSERT INTO cities (name) VALUES ('Budapest');
INSERT INTO cities (name) VALUES ('Bratislava');
INSERT INTO cities (name) VALUES ('Prague');
INSERT INTO cities (name) VALUES ('Munich');
INSERT INTO cities (name) VALUES ('Linz');
INSERT INTO cities (name) VALUES ('Graz');

-- add stop
INSERT INTO stops (city_id, address, telephone, langitude, latitude) VALUES (
  (SELECT id
   FROM cities
   WHERE name = 'Vienna'),
  'Am Hauptbahnhof 2, 1100 Vienna',
  '+43 1 999', 48.184252, 16.376564
);

INSERT INTO stops (city_id, address, telephone, langitude, latitude) VALUES (
  (SELECT id
   FROM cities
   WHERE name = 'Vienna'),
  'Felberstraße 6, 1150 Vienna',
  '+43 1 888', 48.197927, 16.337344
);

INSERT INTO stops (city_id, address, telephone, langitude, latitude) VALUES (
  (SELECT id AS city_id
   FROM cities
   WHERE name = 'Linz'),
  'Bahnhofpl. 6, 4020 Linz',
  '+43 4020 999', 48.293178, 14.292476
);

INSERT INTO stops (city_id, address, telephone, langitude, latitude) VALUES (
  (SELECT id AS city_id
   FROM cities
   WHERE name = 'Munich'),
  'Bürkleinstraße 17, 80538 Munich',
  '+49 089 999', 48.185568, 16.378242
);

INSERT INTO stops (city_id, address, telephone, langitude, latitude) VALUES (
  (SELECT id AS city_id
   FROM cities
   WHERE name = 'Bratislava'),
  'Kapucínska 336/5, 811 03 Bratislava',
  '+421 2 999', 48.144815, 17.104614
);

INSERT INTO stops (city_id, address, telephone, langitude, latitude) VALUES (
  (SELECT id AS city_id
   FROM cities
   WHERE name = 'Budapest'),
  'Javorinská 2-6, 1093 Budapest',
  '+36 1 999', 48.149444, 17.090436
);

INSERT INTO stops (city_id, address, telephone, langitude, latitude) VALUES (
  (SELECT id AS city_id
   FROM cities
   WHERE name = 'Bratislava'),
  'Lónyay u. 1, 811 03 Bratislava',
  '+421 2 888', 48.149444, 17.090436
);
-- add route
INSERT INTO routes (name, length) VALUES
  ('Vienna--Linz--Munich', 200.3),
  ('Vienna--Bratislava--Budapest', 200.3),
  ('Prague--Bratislava--Budapest', 200.3);

-- add route composition
INSERT INTO routes_composition (route_id, stop_id, sequence_number) VALUES (
  (SELECT id
   FROM routes
   WHERE name = 'Vienna--Linz--Munich'),
  (SELECT id
   FROM stops
   WHERE telephone = '+43 1 888'),
  0
);

INSERT INTO routes_composition (route_id, stop_id, sequence_number) VALUES (
  (SELECT id
   FROM routes
   WHERE name = 'Vienna--Linz--Munich'),
  (SELECT id
   FROM stops
   WHERE telephone = '+43 4020 999'),
  1
);

INSERT INTO routes_composition (route_id, stop_id, sequence_number) VALUES (
  (SELECT id
   FROM routes
   WHERE name = 'Vienna--Linz--Munich'),
  (SELECT id
   FROM stops
   WHERE telephone = '+49 089 999'),
  2
);


INSERT INTO routes_composition (route_id, stop_id, sequence_number) VALUES (
  (SELECT id
   FROM routes
   WHERE name = 'Vienna--Bratislava--Budapest'),
  (SELECT id
   FROM stops
   WHERE telephone = '+43 1 999'),
  0
);

INSERT INTO routes_composition (route_id, stop_id, sequence_number) VALUES (
  (SELECT id
   FROM routes
   WHERE name = 'Vienna--Bratislava--Budapest'),
  (SELECT id
   FROM stops
   WHERE telephone = '+421 2 999'),
  1
);

INSERT INTO routes_composition (route_id, stop_id, sequence_number) VALUES (
  (SELECT id
   FROM routes
   WHERE name = 'Vienna--Bratislava--Budapest'),
  (SELECT id
   FROM stops
   WHERE telephone = '+36 1 999'),
  2
);

-- add bus models
INSERT INTO bus_models (name, capacity) VALUES ('Superbus 90', 90);
INSERT INTO bus_models (name, capacity) VALUES ('Busbus A', 53);
INSERT INTO bus_models (name, capacity) VALUES ('Sloth Bus B', 20);

-- add bus
INSERT INTO buses (licence_number, model_id) VALUES ('1234', (SELECT id
                                                              FROM bus_models
                                                              WHERE name = 'Superbus 90'));
INSERT INTO buses (licence_number, model_id) VALUES ('9876', (SELECT id
                                                              FROM bus_models
                                                              WHERE name = 'Busbus A'));
INSERT INTO buses (licence_number, model_id) VALUES ('5555', (SELECT id
                                                              FROM bus_models
                                                              WHERE name = 'Sloth Bus B'));
-- link driver to for first part
INSERT INTO schedules (routes_compostion_id, driver_id, bus_id) VALUES (
  (
    SELECT id
    FROM routes_composition
    WHERE route_id =
          (SELECT id
           FROM routes
           WHERE name = 'Vienna--Linz--Munich')
          AND sequence_number = 0),
  (SELECT id
   FROM drivers
   WHERE name = 'Max Mustermann'),
  (SELECT id
   FROM buses
   WHERE licence_number = '1234')
);

INSERT INTO schedules (routes_compostion_id, driver_id, bus_id) VALUES (
  (SELECT id
   FROM routes_composition
   WHERE route_id = (SELECT id
                     FROM routes
                     WHERE name = 'Vienna--Linz--Munich'
   ) AND sequence_number = 1),
  (SELECT id
   FROM drivers
   WHERE name = 'Max Mustermann'),
  (SELECT id
   FROM buses
   WHERE licence_number = '1234')
);

INSERT INTO schedules (routes_compostion_id, driver_id, bus_id) VALUES (
  (SELECT id
   FROM routes_composition
   WHERE route_id = (SELECT id
                     FROM routes
                     WHERE name = 'Vienna--Linz--Munich'
   ) AND sequence_number = 2),
  (SELECT id
   FROM drivers
   WHERE name = 'Hugo Hallo'),
  (SELECT id
   FROM buses
   WHERE licence_number = '1234')
);

INSERT INTO schedules (routes_compostion_id, driver_id, bus_id) VALUES (
  (
    SELECT id
    FROM routes_composition
    WHERE route_id =
          (SELECT id
           FROM routes
           WHERE name = 'Vienna--Bratislava--Budapest')
          AND sequence_number = 0),
  (SELECT id
   FROM drivers
   WHERE name = 'Tom Turbo'),
  (SELECT id
   FROM buses
   WHERE licence_number = '9876')
);

INSERT INTO schedules (routes_compostion_id, driver_id, bus_id) VALUES (
  (SELECT id
   FROM routes_composition
   WHERE route_id = (SELECT id
                     FROM routes
                     WHERE name = 'Vienna--Bratislava--Budapest'
   ) AND sequence_number = 1),
  (SELECT id
   FROM drivers
   WHERE name = 'Tom Turbo'),
  (SELECT id
   FROM buses
   WHERE licence_number = '9876')
);

INSERT INTO schedules (routes_compostion_id, driver_id, bus_id) VALUES (
  (SELECT id
   FROM routes_composition
   WHERE route_id = (SELECT id
                     FROM routes
                     WHERE name = 'Vienna--Bratislava--Budapest'
   ) AND sequence_number = 2),
  (SELECT id
   FROM drivers
   WHERE name = 'Tom Turbo'),
  (SELECT id
   FROM buses
   WHERE licence_number = '9876')
);

INSERT INTO schedules (driver_id, bus_id) VALUES (

  (SELECT id
   FROM drivers
   WHERE name = 'Slack Sloth'),
  (SELECT id
   FROM buses
   WHERE licence_number = '5555')
);


SELECT
  rc.sequence_number AS stop_nr,
  d.name             AS driver_name,
  bu.licence_number  AS bus_licence_number,
  bm.name            AS bus_type,
  bm.capacity        AS total_seats,
  ci.name            AS city,
  st.address         AS address,
  st.telephone       AS telephone
FROM routes AS ro
  INNER JOIN routes_composition AS rc ON rc.route_id = ro.id
  INNER JOIN schedules AS sc ON sc.routes_compostion_id = rc.id
  INNER JOIN drivers AS d ON sc.driver_id = d.id
  INNER JOIN buses AS bu ON sc.bus_id = bu.id
  INNER JOIN bus_models AS bm ON bu.model_id = bm.id
  INNER JOIN stops AS st ON rc.stop_id = st.id
  INNER JOIN cities AS ci ON st.city_id = ci.id
WHERE ro.name = 'Vienna--Bratislava--Budapest'
ORDER BY stop_nr;

SELECT
  ci.name      AS city,
  st.telephone AS telephone
FROM drivers AS dr
  LEFT JOIN schedules AS sc ON dr.id = sc.driver_id
  LEFT JOIN routes_composition AS rc ON sc.routes_compostion_id = rc.id
  LEFT JOIN stops AS st ON rc.stop_id = st.id
  LEFT JOIN cities AS ci ON st.city_id = ci.id
WHERE dr.name = 'Slack Sloth';

SELECT
  ro.name           AS route,
  dr.name           AS driver,
  bu.licence_number AS licence_number,
  bm.name           AS model
FROM bus_models AS bm
  INNER JOIN buses AS bu ON bu.model_id = bm.id
  RIGHT JOIN schedules AS sc ON bu.id = sc.bus_id
  RIGHT JOIN routes_composition AS rc ON sc.routes_compostion_id = rc.route_id
  RIGHT JOIN drivers AS dr ON sc.driver_id = dr.id
  RIGHT JOIN routes AS ro ON rc.route_id = ro.id
WHERE bm.capacity BETWEEN 20 AND 60;
;