set names Utf8;
set Sql Dialect 3;

ALTER TRIGGER CUSTOMER_AU_MONEY INACTIVE;
ALTER TRIGGER DISCOUNT_FACTOR_AD INACTIVE;
ALTER TRIGGER DISCOUNT_FACTOR_AI INACTIVE;
ALTER TRIGGER DISCOUNT_FACTOR_AU INACTIVE;
ALTER TRIGGER MONTHLY_FEE_AD_0 INACTIVE;
ALTER TRIGGER MONTHLY_FEE_AI_0 INACTIVE;
ALTER TRIGGER MONTHLY_FEE_AU_0 INACTIVE;
ALTER TRIGGER MATERIAL_DOCS_BD INACTIVE;
ALTER TRIGGER EQUIPMENT_AD0 INACTIVE;

DELETE FROM BILLING; commit;
DELETE FROM WORKER; commit;
DELETE FROM CUSTLETTER; commit;
DELETE FROM CUSTOMER_ACCOUNTS; commit;
DELETE FROM CUSTOMER_ATTRIBUTES; commit;
DELETE FROM CUSTOMER_BONUSES; commit;
DELETE FROM CUSTOMER_CONTACTS; commit;
DELETE FROM CUSTOMER_DECODERS; commit;
DELETE FROM CUSTOMER_FILES; commit;
DELETE FROM PORT; commit;
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
ALTER TRIGGER MATERIAL_DOCS_BD ACTIVE;
ALTER TRIGGER EQUIPMENT_AD0 ACTIVE;

delete from Objects where O_Type = 1; -- Материалы Материалы
delete from Objects where O_Type = 3; -- Тип заявок Тип заявок
delete from Objects where O_Type = 4; -- Атрибуты абонента Атрибуты абонента
delete from Objects where O_Type = 5; -- Атрибуты сетевого оборудования Атрибуты сетевого оборудования
delete from Objects where O_Type = 6; -- Атрибуты ТВ оборудования Атрибуты ТВ оборудования
delete from Objects where O_Type = 7; -- Группа сетевого оборудования Группа сетевого оборудования
delete from Objects where O_Type = 8; -- Тип обращения Тип обращения
delete from Objects where O_Type = 9; -- Тип ГС Тип головной станции
delete from Objects where O_Type = 10 and O_ID <> 1307; -- Склад Склад
delete from Objects where O_Type = 11; -- Банк Справочник банков
delete from Objects where O_Type = 12; -- Группа контрагенов Справочник групп контрагентов
delete from Objects where O_Type = 13; -- Группы НДС Справочник групп НДС
delete from Objects where O_Type = 14; -- Группы анализа заявок Группы анализа заявок
--delete from Objects where O_Type = 15; -- Вид услуг Цифра, СПД и т.д.
delete from Objects where O_Type = 16; -- Приходный документ Приход материала
delete from Objects where O_Type = 17; -- Расходный документ Расход материала
--delete from Objects where O_Type = 18; -- Производитель оборудования Производитель оборудования
--delete from Objects where O_Type = 19; -- Тип цифрового оборудования Тип цифрового оборудования
delete from Objects where O_Type = 20; -- IP Black list IP Black list
delete from Objects where O_Type = 21; -- MAC Black list MAC Black list
delete from Objects where O_Type = 22; -- Тип стороннего заказа Тип стороннего заказа
--delete from Objects where O_Type = 23; -- Тип сообщения абоненту Тип сообщения абоненту
--delete from Objects where O_Type = 24; -- Ошибки рассылки сообщений Ошибки рассылки сообщений. Поле MES_RESULT таблицы MESSAGES
delete from Objects where O_Type = 25; -- Атрибуты услуг например скорость передачи
--delete from Objects where O_Type = 26; -- Статус сообщения
delete from Objects where O_Type = 27; -- Шаблон сообщений
--delete from Objects where O_Type = 28; -- Тип документов движ. материалов Тип документов движения материалов
delete from Objects where O_Type = 29; -- Поставщики Поставщики материалов и оборудования
--delete from Objects where O_Type = 30; -- Типы бонусов Зажиты жестко, менять нельзя
delete from Objects where O_Type = 31; -- Черный список абонентов Черный список абонентов. Смотрим на персональный номер паспорта
delete from Objects where O_Type = 32; -- Атрибуты IPTV групп
delete from Objects where O_Type = 33; -- Документ абонента Тип сохраненного документа абонента
delete from Objects where O_Type = 34; -- Новости Новости для отображения в ЛК абонента
delete from Objects where O_Type = 35; -- Акции Акции для отображения в ЛК абонента
--delete from Objects where O_Type = 36; -- Статус оборудования
delete from Objects where O_Type = 37; -- Атрибуты домов Атрибуты для домов
--delete from Objects where O_Type = 38; -- Типы узлов Типы узлов
delete from Objects where O_Type = 39; -- Атрибуты узлов Атрибуты узлов
delete from Objects where O_Type = 40; -- Файлы узла Тип сохраненного файла
--delete from Objects where O_Type = 41; -- Цифровой стандарт Стандарт источника сиганла
--delete from Objects where O_Type = 42; -- Видеокодек Тип видеокодека источника каналов
--delete from Objects where O_Type = 43; -- Кодировка сигнала Кодировка источника сигнала
delete from Objects where O_Type = 44; -- Декодеры каналов Карточки / приемкники для приема каналов оператром
delete from Objects where O_Type = 45 and O_ID > 10; -- Тип контакта абонентов phone / email / skype / telegram. Если у объекта O_Deleted = 1. занчит не отображать в карточке. в O_CHECK регулярка для проверки значения
delete from Objects where O_Type = 46; -- Тип платежа резерв. Не используеться.
--delete from Objects where O_Type = 47; -- Тематика каналов Справочник тематик каналов. хранится в каналах как текст
--delete from Objects where O_Type = 48; -- Тип материала/оборудования Справочник типов оборудования. используется в схемах узлов и оборудовании абонента
--delete from Objects where O_Type = 49; -- Тип суммы Тип суммы в балансе абонента
--delete from Objects where O_Type = 50; -- Атрибуты для типа оборудования
--delete from Objects where O_Type = 51; -- Владелец оборудования/материала Склад абонент узел
--delete from Objects where O_Type = 52; -- Тип события Тип события для EVENT_DETAIL
--delete from Objects where O_Type = 53; -- Тип проблем вещания Тип сбоев вещания сервисов в сети
--delete from Objects where O_Type = 54; -- Решение проблем Решение проблем вещания
commit;