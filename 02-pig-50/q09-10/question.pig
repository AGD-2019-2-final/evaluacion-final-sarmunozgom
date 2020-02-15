-- Pregunta
-- ===========================================================================
--
-- Para el archivo `data.csv` escriba una consulta en Pig que genere la
-- siguiente salida:
--
--   Vivian@Hamilton
--   Karen@Holcomb
--   Cody@Garrett
--   Roth@Fry
--   Zoe@Conway
--   Gretchen@Kinney
--   Driscoll@Klein
--   Karyn@Diaz
--   Merritt@Guy
--   Kylan@Sexton
--   Jordan@Estes
--   Hope@Coffey
--   Vivian@Crane
--   Clio@Noel
--   Hope@Silva
--   Ayanna@Jarvis
--   Chanda@Boyer
--   Chadwick@Knight
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
data = LOAD 'data.csv' USING PigStorage (',') AS (id: INT, firstname:CHARARRAY,surname:CHARARRAY,date:CHARARRAY,color:CHARARRAY,quantity:INT);
data = FOREACH data GENERATE $1,$2;


-- Escribe el archivo de salida
STORE data INTO 'output' USING PigStorage ('@');
