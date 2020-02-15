-- Pregunta
-- ===========================================================================
--
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la
-- columna 3 separados por coma. La tabla debe estar ordenada por las
-- columnas 1, 2 y 3.
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' AS (letter:CHARARRAY,coldos:bag{t:TUPLE(letter:CHARARRAY)},coltres:MAP[]);
data = FOREACH data GENERATE letter, COUNT ($1), SIZE ($2);
order_data = ORDER data BY letter,$1,$2;


-- Escribe el archivo de salida
STORE order_data INTO 'output' USING  PigStorage(',');
