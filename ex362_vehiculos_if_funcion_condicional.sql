-- 1. Elimine la tabla, si existe:
DROP TABLE IF EXISTS vehiculos;

-- 2. Cree la tabla:
 create table vehiculos(
  patente CHAR(6) NOT NULL,
  tipo CHAR(4),
  horallegada TIME NOT NULL,
  horasalida TIME,
  PRIMARY KEY (patente,horallegada)
 );

-- 3. Ingrese algunos registros:
 INSERT INTO vehiculos (patente,tipo,horallegada,horasalida)
  VALUES ('ACD123','auto','8:30','9:40');
 INSERT INTO vehiculos (patente,tipo,horallegada,horasalida)
  VALUES ('AKL098','auto','8:45','15:10');
 INSERT INTO vehiculos (patente,tipo,horallegada,horasalida)
  VALUES ('HGF123','auto','9:30','18:40');
 INSERT INTO vehiculos (patente,tipo,horallegada,horasalida)
  VALUES ('DRT123','auto','15:30',NULL);
 INSERT INTO vehiculos (patente,tipo,horallegada,horasalida)
  VALUES ('FRT545','moto','19:45',NULL);
 INSERT INTO vehiculos (patente,tipo,horallegada,horasalida)
  VALUES ('GTY154','auto','20:30','21:00');

-- 4. Muestre la patente, la hora de llegada y de salida de todos los vehículos, más una columna que 
-- calcule la cantidad de horas que estuvo cada vehículo en la playa, sin considerar los que aún no se 
-- retiraron de la playa:
SELECT patente, horallegada, horasalida, 
LEFT(TIMEDIFF(horasalida, horallegada), 5) AS horas_minutos
FROM vehiculos 
WHERE horasalida IS NOT NULL;

-- 5. Se cobra 1 peso por hora. Pero si un vehículo permanece en la playa 4 horas, se le cobran 3 
-- pesos, es decir, no se le cobra la cuarta hora, si está 8 horas, se cobran 6 pesos, y así 
-- sucesivamente. Muestre la patente, la hora de llegada y de salida de todos los vehículos, más la 
-- columna que calcule la cantidad de horas que estuvo cada vehículo en la playa (sin considerar los 
-- que aún no se retiraron de la playa) y otra columna utilizando "if" que muestre la cantidad de 
-- horas gratis:
SELECT patente, horallegada, horasalida, 
LEFT(TIMEDIFF(horasalida, horallegada), 5) AS horas_minutos,
IF(HOUR(TIMEDIFF(horasalida, horallegada)) > 4, 
HOUR(TIMEDIFF(horasalida, horallegada)) DIV 4, 0) as hora_gratis 
FROM vehiculos 
WHERE horasalida IS NOT NULL;
