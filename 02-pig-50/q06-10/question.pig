--
-- Pregunta
-- ===========================================================================
--
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave
-- `aaa`?
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' AS (upper_letter:CHARARRAY, coldos:bag{t:TUPLE(letter:CHARARRAY)},coltres:MAP []);

data1 = FOREACH data GENERATE FLATTEN(coltres) AS coltres;
grouped = GROUP data1 BY coltres;
C = FOREACH grouped GENERATE group, COUNT ($1);

-- Escribe el archivo de salida
STORE C INTO 'output' USING  PigStorage(',');
