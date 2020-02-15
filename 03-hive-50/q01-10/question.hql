--
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

DROP TABLE IF EXISTS data;
CREATE TABLE data (letras STRING, fecha STRING, valor INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
TBLPROPERTIES ("skip.header.line.count"="-1");
LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE data;
DROP TABLE IF EXISTS data1;
CREATE TABLE data1 AS SELECT letras, COUNT(letras) FROM data GROUP BY letras;
SELECT * FROM data1 LIMIT 5;
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT * FROM data1;
