--
-- Pregunta
-- ===========================================================================
--
-- Realice una consulta que compute la cantidad de veces que aparece cada valor
-- de la columna `t0.c5`  por año.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
DROP TABLE IF EXISTS tbl0;
CREATE TABLE tbl0 (
    c1 INT,
    c2 STRING,
    c3 INT,
    c4 DATE,
    c5 ARRAY<CHAR(1)>,
    c6 MAP<STRING, INT>
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl0.csv' INTO TABLE tbl0;
--
DROP TABLE IF EXISTS tbl1;
CREATE TABLE tbl1 (
    c1 INT,
    c2 INT,
    c3 STRING,
    c4 MAP<STRING, INT>
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'tbl1.csv' INTO TABLE tbl1;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
LOAD DATA LOCAL INPATH "tbl0.csv" OVERWRITE INTO TABLE tbl0;
DROP TABLE IF EXISTS let_0;
CREATE TABLE let_0 AS SELECT c5, YEAR(c4) AS annio
 FROM tbl0;
SELECT * FROM let_0;
DROP TABLE IF EXISTS calculate;
CREATE TABLE calculate AS
SELECT annio, letter
FROM let_0 LATERAL VIEW explode(c5) let_0 AS letter;
SELECT * FROM calculate;
DROP TABLE IF EXISTS calculate1;
CREATE TABLE calculate1 AS
SELECT annio, letter, COUNT(*)
FROM calculate GROUP BY annio, letter;
SELECT * FROM calculate1;
INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT * FROM calculate1;
