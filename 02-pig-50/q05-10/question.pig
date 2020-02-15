--
-- Pregunta
-- ===========================================================================
--
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que
-- aparece cada letra minúscula en la columna 2.
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' AS (upper_letter:CHARARRAY, coldos:bag{t:TUPLE(letter:CHARARRAY)},col:CHARARRAY);
dataA = FOREACH data GENERATE FLATTEN(coldos) AS letter;
grouped = GROUP dataA BY letter;
C = FOREACH grouped GENERATE group, COUNT($1);

-- Escribe el archivo de salida
STORE C INTO 'output';
