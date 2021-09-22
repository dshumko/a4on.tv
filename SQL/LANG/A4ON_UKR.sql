SET NAMES WIN1251;
SET SQL DIALECT 3;
SET CLIENTLIB 'fbclient.dll';
CONNECT 'A4ON_DB.FDB' USER 'SYSDBA' PASSWORD 'masterkey';
SET AUTODDL ON;

DELETE FROM MONTH_NAME;
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (1, 'Сiчень');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (2, 'Лютий');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (3, 'Березень');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (4, 'Квiтень');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (5, 'Травень');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (6, 'Червень');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (7, 'Липень');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (8, 'Серпень');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (9, 'Вересень');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (10, 'Жовтень');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (11, 'Листопад');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (12, 'Грудень');

COMMIT;

ALTER TABLE STREET ADD IBE$$TEMP_COLUMN VARCHAR(1) DEFAULT 'вул.';
UPDATE RDB$RELATION_FIELDS F1
SET
F1.RDB$DEFAULT_VALUE  = (SELECT F2.RDB$DEFAULT_VALUE
                         FROM RDB$RELATION_FIELDS F2
                         WHERE (F2.RDB$RELATION_NAME = 'STREET') AND
                               (F2.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN')),
F1.RDB$DEFAULT_SOURCE = (SELECT F3.RDB$DEFAULT_SOURCE FROM RDB$RELATION_FIELDS F3
                         WHERE (F3.RDB$RELATION_NAME = 'STREET') AND
                               (F3.RDB$FIELD_NAME = 'IBE$$TEMP_COLUMN'))
WHERE (F1.RDB$RELATION_NAME = 'STREET') AND
      (F1.RDB$FIELD_NAME = 'STREET_SHORT');
ALTER TABLE STREET DROP IBE$$TEMP_COLUMN;
COMMIT;
update STREET_TYPE set STRTYPE_SHORT = 'вул.' , STRTYPE_NAME = 'вулиця' where (STRTYPE_SHORT = 'ул.');
update STREET_TYPE set STRTYPE_SHORT = 'пров.', STRTYPE_NAME = 'провулок' where (STRTYPE_SHORT = 'пер.');
update STREET_TYPE set STRTYPE_SHORT = 'пл.'  , STRTYPE_NAME = 'площа' where (STRTYPE_SHORT = 'пл.');
update STREET_TYPE set STRTYPE_SHORT = 'про-д', STRTYPE_NAME = 'проїзд' where (STRTYPE_SHORT = 'пр-д');
update STREET_TYPE set STRTYPE_SHORT = 'пр-т' , STRTYPE_NAME = 'проспект' where (STRTYPE_SHORT = 'пр-т');
commit;
update street s set s.street_short = 'вул.'  where (street_short = 'ул.');
update street s set s.street_short = 'пров.' where (street_short = 'пер.');
update street s set s.street_short = 'пл.'   where (street_short = 'пл.');
update street s set s.street_short = 'про-д' where (street_short = 'пр-д');
update street s set s.street_short = 'пр-т'  where (street_short = 'пр-т');
commit;