--
-- Pregunta
-- ===========================================================================
--
-- Para responder la pregunta use el archivo `data.csv`.
--
-- Cuente la cantidad de personas nacidas por año.
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
u = LOAD 'data.csv' USING PigStorage(',')
    AS (id:int,
        firstname:CHARARRAY,
        surname:CHARARRAY,
        birthday:CHARARRAY,
        color:CHARARRAY,
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = FOREACH u GENERATE SUBSTRING(birthday,0,4);
data = GROUP data BY ($0);
data =FOREACH data GENERATE group, COUNT($1);

-- Escribe el archivo de salida
STORE data INTO 'output' USING PigStorage(',');
