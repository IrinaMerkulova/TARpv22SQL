SELECT * FROM table_name
SELECT - выбрать
* - все
FROM - из откуда
table_name - имя таблицы

CREATE TABLE table_name(column1 dataType, ....)
CREATE TABLE - создать таблицу
table_name - имя таблицы
column1 - колонна 1
dataType - тип данных

INSERT INTO table_name(column_name1,...)
insert into добавить запись
table_name имя таблицы
column_name1 имя колонны

DROP TABLE table_name
DROP удалить
TABLE таблицу
table_name имя таблицы

UPDATE table_name SET column_name1=column_value1
UPDATE обновить
table_name имя таблицы
SET задания значения переменной
column_name1
column_value1

ALTER TABLE table_name ADD column_name datatype

DELETE FROM table_name WHERE [condition]

USE databasename;

ALTER TABLE table_name ADD FOREIGN KEY (column_name)
References table_name2(column_name2)
ALTER TABLE
table_name имя таблицы
ADD добавить
FOREIGN KEY вторичный ключ
column_name
References
