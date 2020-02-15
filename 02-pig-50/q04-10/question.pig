--
-- Pregunta
-- ===========================================================================
--
-- El archivo `truck_event_text_partition.csv` tiene la siguiente estructura:
--
--   driverId       INT
--   truckId        INT
--   eventTime      STRING
--   eventType      STRING
--   longitude      DOUBLE
--   latitude       DOUBLE
--   eventKey       STRING
--   correlationId  STRING
--   driverName     STRING
--   routeId        BIGINT
--   routeName      STRING
--   eventDate      STRING
--
-- Escriba un script en Pig que carge los datos y obtenga los primeros 10
-- registros del archivo para las primeras tres columnas, y luego, ordenados
-- por driverId, truckId, y eventTime.
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
--  >>> Escriba su respuesta a partir de este punto <<<
--

data = LOAD 'truck_event_text_partition.csv' USING PigStorage(',')
        AS (driverId:INT,
            truckId:INT,
            eventTime:CHARARRAY,
            eventType:CHARARRAY,
            longitude:DOUBLE,
            latitude:DOUBLE,
            eventKey:CHARARRAY,
            correlationId:CHARARRAY,
            driverName:CHARARRAY,
            routeId:BIGINTEGER,
            routeName:CHARARRAY,
            eventDate:CHARARRAY);
A = LIMIT data 10;
B = FOREACH A GENERATE driverId,truckId,eventTime;
C = ORDER B BY driverId,truckId,eventTime;

-- Escribe el archivo de salida
STORE C INTO 'output' USING PigStorage(',');
