-- Pregunta
-- ===========================================================================
--
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la
-- columna 3 es:
--
--   ((b,jjj), 216)
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' AS (letter:CHARARRAY,coldos:bag{t:TUPLE(letter:CHARARRAY)},coltres:MAP[]);
data = FOREACH data GENERATE FLATTEN(coldos), FLATTEN(coltres);
data = GROUP data BY ($0,$1);
data = FOREACH data GENERATE group, COUNT($1);

-- Escribe el archivo de salida
STORE data INTO 'output';
