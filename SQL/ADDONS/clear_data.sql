set names Utf8;
set Sql Dialect 3;

ALTER TRIGGER CUSTOMER_AU_MONEY INACTIVE;
ALTER TRIGGER DISCOUNT_FACTOR_AD INACTIVE;
ALTER TRIGGER DISCOUNT_FACTOR_AI INACTIVE;
ALTER TRIGGER DISCOUNT_FACTOR_AU INACTIVE;
ALTER TRIGGER MONTHLY_FEE_AD_0 INACTIVE;
ALTER TRIGGER MONTHLY_FEE_AI_0 INACTIVE;
ALTER TRIGGER MONTHLY_FEE_AU_0 INACTIVE;

DELETE FROM BILLING; commit;
DELETE FROM WORKER; commit;
DELETE FROM CUSTLETTER; commit;
DELETE FROM CUSTOMER_ACCOUNTS; commit;
DELETE FROM CUSTOMER_ATTRIBUTES; commit;
DELETE FROM CUSTOMER_BONUSES; commit;
DELETE FROM CUSTOMER_CONTACTS; commit;
DELETE FROM CUSTOMER_DECODERS; commit;
DELETE FROM CUSTOMER_FILES; commit;
DELETE FROM Equipment; commit;
DELETE FROM EQUIPMENT_HISTORY; commit;
DELETE FROM MESSAGES; commit;
DELETE FROM MONTHLY_FEE; commit;
DELETE FROM MONTHLY_FREEZE; commit;
DELETE FROM OTHER_FEE; commit;
DELETE FROM PAYMENT; commit;
DELETE FROM PERSONAL_TARIF; commit;
DELETE FROM PREPAY_DETAIL; commit;
DELETE FROM RECOURSE; commit;
DELETE FROM SINGLE_SERV; commit;
DELETE FROM SUBSCR_HIST; commit;
DELETE FROM SUBSCR_SERV; commit;
DELETE FROM TV_LAN; commit;
DELETE FROM DISCOUNT_FACTOR; commit;  
DELETE FROM CUSTOMER; commit;
DELETE FROM REQUEST; commit;
DELETE FROM HOUSEWORKS; commit;
DELETE FROM HOUSE; commit;
DELETE FROM STREET; commit;
DELETE FROM SUBAREA; commit;
DELETE FROM AREA; commit;
DELETE FROM SERVICES_LINKS; commit;
DELETE FROM Connect_Log; commit;
DELETE FROM Gps_Log; commit;
DELETE FROM Equipment_Log; commit;
DELETE FROM Operation_Log; commit;
DELETE FROM Payment_Deleted; commit;
DELETE FROM tarif; commit;
DELETE FROM SERVICES where SERVICE_ID>10; commit;
DELETE FROM SERVICES_LINKS; commit;
DELETE FROM tarif; commit;
DELETE FROM SYS$USER; commit;
DELETE FROM Changelog; commit;

DELETE FROM RATES; commit;
DELETE FROM SYS$GROUP_RIGHTS; commit;
DELETE FROM REPORTS; commit;
DELETE FROM DEVPROFILES; commit;
DELETE FROM DEVPORTS; commit;
DELETE FROM FREQPLAN; commit;
DELETE FROM PAY_DOC; commit;
DELETE FROM MAP_XY; commit;
DELETE FROM ORDERS_TP; commit;
DELETE FROM MATERIALS_IN_DOC; commit;
DELETE FROM TASKMSG; commit;
DELETE FROM EQUIPMENT_DVB; commit;
DELETE FROM TASKLIST; commit;
DELETE FROM TQUEUE; commit;
DELETE FROM TASKUSER; commit;
DELETE FROM MATERIAL_DOCS; commit;
DELETE FROM PORT; commit;
DELETE FROM MAP; commit;
DELETE FROM NODE_LAYOUT; commit;
DELETE FROM BCISSUE; commit;
DELETE FROM MATERIALS_REMAIN; commit;
DELETE FROM BCI_CHANNELS; commit;
DELETE FROM DISTRIB_CONTRACT_REPORTS; commit;
DELETE FROM OBJECTS_COVERAGE; commit;
DELETE FROM SERVICES_ATTRIBUTES; commit;
DELETE FROM DEVICES; commit;
DELETE FROM HOUSES_ATTRIBUTES; commit;
DELETE FROM NODES; commit;
DELETE FROM REQUEST_PHOTOS; commit;
DELETE FROM REQUEST_TEMPLATES; commit;
DELETE FROM WIRE; commit;
DELETE FROM BLOB_TBL; commit;
DELETE FROM DISTRIB_CONTRACT_REPORTS_CH; commit;
DELETE FROM HOUSE_CIRCUIT; commit;
DELETE FROM MATERIALS; commit;
DELETE FROM NPS; commit;
DELETE FROM WORKGROUPS; commit;
DELETE FROM JOURNAL; commit;
DELETE FROM NODES_ATTRIBUTES; commit;
DELETE FROM RECOURSE_TEMPLATES; commit;
DELETE FROM SYS$GROUP; commit;
DELETE FROM WORKS; commit;
DELETE FROM APPLIANCE; commit;
DELETE FROM BONUS_RATE; commit;
DELETE FROM EPG_AD_CHANNELS; commit;
DELETE FROM IPTV_GROUP; commit;
DELETE FROM IPTV_GROUP_ATTRIBUTES; commit;
DELETE FROM NODE_FLATS; commit;
DELETE FROM ATTRIBUTE; commit;
DELETE FROM CHANNEL_SRC; commit;
DELETE FROM DISTRIB_CONTRACTS; commit;
DELETE FROM EQUIPMENT_ATTRIBUTES; commit;
DELETE FROM EQUIPMENT_CMD_GRP; commit;
DELETE FROM EQUIPMENT_COVERAGE; commit;
DELETE FROM MATERIALS_GROUP; commit;
DELETE FROM SYS$USER_WH; commit;
DELETE FROM VLANS; commit;
DELETE FROM BLB_GZIP; commit;
DELETE FROM DISTRIBUTOR; commit;
DELETE FROM DISTRIB_CARDS; commit;
DELETE FROM EPG_AD; commit;
DELETE FROM EXPORTTYPES; commit;
DELETE FROM HEADEND; commit;
DELETE FROM HOUSEFLATS; commit;
DELETE FROM INVENTORY; commit;
DELETE FROM NODE_FILES; commit;
DELETE FROM ORGANIZATION; commit;
DELETE FROM QUEUE_SWITCH_SRV; commit;
DELETE FROM SYS$USER_AREAS; commit;
DELETE FROM WORKAREA; commit;


ALTER TRIGGER CUSTOMER_AU_MONEY  ACTIVE;
ALTER TRIGGER DISCOUNT_FACTOR_AD ACTIVE;
ALTER TRIGGER DISCOUNT_FACTOR_AI ACTIVE;
ALTER TRIGGER DISCOUNT_FACTOR_AU ACTIVE;
ALTER TRIGGER MONTHLY_FEE_AD_0 ACTIVE;
ALTER TRIGGER MONTHLY_FEE_AI_0 ACTIVE;
ALTER TRIGGER MONTHLY_FEE_AU_0 ACTIVE;