--1. ¿Cuál es el nombre aeropuerto que ha tenido mayor movimiento durante el año?
SELECT TOP 1 aeropuertos.nombre_aeropuerto, Count(aeropuertos.nombre_aeropuerto) AS cantidad
FROM movimientos INNER JOIN (aeropuertos INNER JOIN (aerolineas INNER JOIN vuelos ON aerolineas.id_aerolinea = vuelos.id_aerolinea) ON aeropuertos.id_aeropuerto=vuelos.[id_aeropuerto]) ON movimientos.id_movimientos = vuelos.id_movimiento
GROUP BY aeropuertos.nombre_aeropuerto
ORDER BY Count(aeropuertos.nombre_aeropuerto) DESC;

--2. ¿Cuál es el nombre aerolínea que ha realizado mayor número de vuelos durante el año?
SELECT TOP 1 aerolineas.nombre_aerolinea, Count(*) AS cantidad
FROM movimientos INNER JOIN (aeropuertos INNER JOIN (aerolineas INNER JOIN vuelos ON aerolineas.id_aerolinea = vuelos.id_aerolinea) ON aeropuertos.id_aeropuerto=vuelos.[id_aeropuerto]) ON movimientos.id_movimientos = vuelos.id_movimiento
WHERE vuelos.id_movimiento=1
GROUP BY aerolineas.nombre_aerolinea
ORDER BY Count(*) DESC;

--3. ¿En qué día se han tenido mayor número de vuelos?
SELECT TOP 1 vuelos.dia, Count(*) AS cantidad
FROM movimientos INNER JOIN (aeropuertos INNER JOIN (aerolineas INNER JOIN vuelos ON aerolineas.id_aerolinea = vuelos.id_aerolinea) ON aeropuertos.id_aeropuerto=vuelos.[id_aeropuerto]) ON movimientos.id_movimientos = vuelos.id_movimiento
GROUP BY vuelos.dia
ORDER BY Count(*) DESC;

--4. ¿Cuáles son las aerolíneas que tienen mas de 2 vuelos por día?
SELECT aerolineas.nombre_aerolinea, Count(*) AS cantidad
FROM movimientos INNER JOIN (aeropuertos INNER JOIN (aerolineas INNER JOIN vuelos ON aerolineas.id_aerolinea = vuelos.id_aerolinea) ON aeropuertos.id_aeropuerto=vuelos.[id_aeropuerto]) ON movimientos.id_movimientos = vuelos.id_movimiento
WHERE vuelos.id_movimiento=1
GROUP BY aerolineas.nombre_aerolinea
HAVING Count(*)>1
ORDER BY Count(*) DESC;
