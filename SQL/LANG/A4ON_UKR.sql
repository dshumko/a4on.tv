SET NAMES WIN1251;
SET SQL DIALECT 3;
SET CLIENTLIB 'fbclient.dll';
CONNECT 'A4ON_DB.FDB' USER 'SYSDBA' PASSWORD 'masterkey';
SET AUTODDL ON;

DELETE FROM MONTH_NAME;
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (1, '�i����');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (2, '�����');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (3, '��������');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (4, '��i����');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (5, '�������');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (6, '�������');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (7, '������');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (8, '�������');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (9, '��������');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (10, '�������');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (11, '��������');
INSERT INTO MONTH_NAME (MID, MNAME) VALUES (12, '�������');

COMMIT;

ALTER TABLE STREET ADD IBE$$TEMP_COLUMN VARCHAR(1) DEFAULT '���.';
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
update STREET_TYPE set STRTYPE_SHORT = '���.' , STRTYPE_NAME = '������' where (STRTYPE_SHORT = '��.');
update STREET_TYPE set STRTYPE_SHORT = '����.', STRTYPE_NAME = '��������' where (STRTYPE_SHORT = '���.');
update STREET_TYPE set STRTYPE_SHORT = '��.'  , STRTYPE_NAME = '�����' where (STRTYPE_SHORT = '��.');
update STREET_TYPE set STRTYPE_SHORT = '���-�', STRTYPE_NAME = '�����' where (STRTYPE_SHORT = '��-�');
update STREET_TYPE set STRTYPE_SHORT = '��-�' , STRTYPE_NAME = '��������' where (STRTYPE_SHORT = '��-�');
commit;
update street s set s.street_short = '���.'  where (street_short = '��.');
update street s set s.street_short = '����.' where (street_short = '���.');
update street s set s.street_short = '��.'   where (street_short = '��.');
update street s set s.street_short = '���-�' where (street_short = '��-�');
update street s set s.street_short = '��-�'  where (street_short = '��-�');
commit;