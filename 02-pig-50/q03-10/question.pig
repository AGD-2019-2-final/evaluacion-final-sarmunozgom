-- Pregunta
-- ===========================================================================
--
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' AS
            (letter:CHARARRAY,
            date:CHARARRAY,
            value: INT);

A = FOREACH data GENERATE value;
B = ORDER A BY value;
C = LIMIT B 5;
-- Escribe el archivo de salida
STORE C INTO 'output';
