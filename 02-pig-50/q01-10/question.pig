--
-- Pregunta
-- ===========================================================================
--
-- Para el archivo `data.tsv` compute la cantidad de registros por letra.
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

-- Carga de datos
A = LOAD 'data.tsv' AS
        (letras:CHARARRAY,
        fecha:CHARARRAY,
        valor:INT);
B = FOREACH A GENERATE letras;
C = GROUP B BY letras;
D = FOREACH C GENERATE group, COUNT(B);


-- Escribe el archivo de salida
STORE D INTO 'output';
