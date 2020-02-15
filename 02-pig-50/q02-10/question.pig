-- Pregunta
-- ===========================================================================
--
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
--  >>> Escriba el codigo del mapper a partir de este punto <<<
--
data = LOAD 'data.tsv' AS
            (letter:CHARARRAY,
            date:CHARARRAY,
            value: INT);

A = ORDER data BY letter, value;

-- Escribe el archivo de salida
STORE A INTO 'output';
