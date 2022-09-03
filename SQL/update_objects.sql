execute block as
declare variable v varchar(1000);
begin
  v = null;
  select VAR_VALUE from SETTINGS where upper(VAR_NAME) = 'STRICT_MODE'
  into :v;
  if (v is null) then begin
    update or insert into SETTINGS (VAR_NAME, VAR_VALUE, VAR_TYPE, VAR_CAPTION, VAR_NOTICE)
    values ('STRICT_MODE', '0', 'BOOLEAN', 'Строгий режим', 'Запрет изменений начислений и платежей в прошлых периодах')
    matching (VAR_NAME);
  end
  v = null;
  select VAR_VALUE from SETTINGS where upper(VAR_NAME) = 'AREA_LOCK'
  into :v;
  if (v is null) then begin
    update or insert into SETTINGS (VAR_NAME, VAR_VALUE, VAR_TYPE, VAR_CAPTION, VAR_NOTICE)
    values ('AREA_LOCK', '', 'STRING', NULL, 'список ид (1,2) райнов для которых можно принимать заявки и обращения')
    matching (VAR_NAME);
  end
end;
commit;

UPDATE OR INSERT INTO SERVICES (SERVICE_ID, SRV_TYPE_ID, SHIFT_MONTHS, NAME, DESCRIPTION, INET_SRV) VALUES (-1, -1, 0, NULL, 'служебная услуга, нужна для абонентской платы', 0) MATCHING (SERVICE_ID);
UPDATE OR INSERT INTO SERVICES (SERVICE_ID, SRV_TYPE_ID, SHIFT_MONTHS, NAME, DESCRIPTION, INET_SRV) VALUES (-2, -1, 0, 'Снятие блокировки', NULL, 0) MATCHING (SERVICE_ID);
UPDATE OR INSERT INTO SERVICES (SERVICE_ID, SRV_TYPE_ID, SHIFT_MONTHS, NAME, DESCRIPTION, INET_SRV) VALUES (-3, -1, 0, 'Автоблокировка', NULL, 0) MATCHING (SERVICE_ID);
commit;

UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (1, 'Материалы', 'Материалы') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (2, 'Вид платежа', 'Вид платежа для платежных систем') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (3, 'Тип заявок', 'Тип заявок') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (4, 'Атрибуты абонента', 'Атрибуты абонента') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (5, 'Атрибуты сетевого оборудования', 'Атрибуты сетевого оборудования') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (6, 'Атрибуты ТВ оборудования', 'Атрибуты ТВ оборудования') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (7, 'Группа сетевого оборудования', 'Группа сетевого оборудования') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (8, 'Тип обращения', 'Тип обращения') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (9, 'Тип ГС', 'Тип головной станции') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (10, 'Склад', 'Склад') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (11, 'Банк', 'Справочник банков') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (12, 'Группа контрагенов', 'Справочник групп контрагентов') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (13, 'Группы НДС', 'Справочник групп НДС') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (14, 'Группы анализа заявок', 'Группы анализа заявок') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (15, 'Вид услуг', 'Цифра, СПД и т.д.') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (16, 'Приходный документ', 'Приход материала') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (17, 'Расходный документ', 'Расход материала') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (18, 'Производитель оборудования', 'Производитель оборудования') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (19, 'Тип цифрового оборудования', 'Тип цифрового оборудования') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (20, 'IP Black list', 'IP Black list') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (21, 'MAC Black list', 'MAC Black list') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (22, 'Тип стороннего заказа', 'Тип стороннего заказа') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (23, 'Тип сообщения абоненту', 'Тип сообщения абоненту') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (24, 'Ошибки рассылки сообщений', 'Ошибки рассылки сообщений. Поле MES_RESULT таблицы MESSAGES') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (25, 'Атрибуты услуг', 'например скорость передачи') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (26, 'Статус сообщения', NULL) MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (27, 'Шаблон сообщений', NULL) MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (28, 'Тип документов движ. материалов', 'Тип документов движения материалов') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (29, 'Поставщики', 'Поставщики материалов и оборудования') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (30, 'Типы бонусов', 'Зажиты жестко, менять нельзя') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (31, 'Черный список абонентов', 'Черный список абонентов. Смотрим на персональный номер паспорта') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (32, 'Атрибуты IPTV групп', '') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (33, 'Документ абонента', 'Тип сохраненного документа абонента') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (34, 'Новости', 'Новости для отображения в ЛК абонента') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (35, 'Акции', 'Акции для отображения в ЛК абонента') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (36, 'Статус оборудования', NULL) MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (37, 'Атрибуты домов', 'Атрибуты для домов') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (38, 'Типы узлов', 'Типы узлов') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (39, 'Атрибуты узлов', 'Атрибуты узлов') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (40, 'Файлы узла', 'Тип сохраненного файла') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (41, 'Цифровой стандарт', 'Стандарт источника сиганла') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (42, 'Видеокодек', 'Тип видеокодека источника каналов') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (43, 'Кодировка сигнала', 'Кодировка источника сигнала') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (44, 'Декодеры каналов', 'Карточки / приемкники для приема каналов оператром') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (45, 'Тип контакта абонентов', 'phone / email / skype / telegram. Если у объекта O_Deleted = 1. занчит не отображать в карточке. в O_CHECK регулярка для проверки значения') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (46, 'Тип платежа', 'резерв. Не используеться.') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (47, 'Тематика каналов', 'Справочник тематик каналов. хранится в каналах как текст') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (48, 'Тип материала/оборудования', 'Справочник типов оборудования. используется в схемах узлов и оборудовании абонента') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (49, 'Тип суммы', 'Тип суммы в балансе абонента') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (50, 'Атрибуты для типа оборудования', NULL) MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (51, 'Владелец оборудования/материала', 'Склад абонент узел') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (52, 'Тип события', 'Тип события для EVENT_DETAIL') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (53, 'Тип проблем вещания', 'Тип сбоев вещания сервисов в сети') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (54, 'Решение проблем', 'Решение проблем вещания') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (55, 'Содержание блоба', 'к какому типу данных относится блоб') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (56, 'Тип кабеля', '') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (57, 'Тип порта', 'Тип порта коммутатора/устройства') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (58, 'Тип использования', 'Тип использования оборудования. служебный/абонентский') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (59, 'Вид коннектора', 'Вид коннектора кабеля') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (60, 'Состояние порта', '') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (61, 'Способ оплаты', 'Каким способом внесен платеж. нал. безнал.') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (62, 'Типы меток линий связи', 'нумерация жил на кабелях') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (63, 'Атрибуты сетей', 'Атрибуты сетей') MATCHING (OT_ID);
UPDATE OR INSERT INTO OBJECTS_TYPE (OT_ID, OT_NAME, OT_DESCRIPTION) VALUES (64, 'Тип проч. начислений', 'Тип прочих начислений (OTHER_FEE)') MATCHING (OT_ID);
commit;

-- Владелец оборудования/материала 51
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES (0, 51, 'Склад', 'Жестко прошит в коде', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES (1, 51, 'Абонент', 'Жестко прошит в коде', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES (2, 51, 'Узел', 'Жестко прошит в коде', 0) MATCHING (O_ID, O_TYPE);
commit;
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES (1, 55, 'Абонент', 'блобы абонента', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES (2, 55, 'Заявка', 'блобы заявки', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES (3, 55, 'Мат. документ', 'блобы материального документа', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES (4, 55, 'Материал', 'блобы материала', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (0, 45, 'тел.', '', 0, 'Жестко прошит в коде', NULL, NULL, NULL, NULL, '') MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (1, 28, 'Приход материалов', NULL, 0, NULL, 'АКТ-ПРИХОД', NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (1, 41, 'ATSC', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (1, 42, 'MPEG-2', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (1, 43, 'ADEC', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (1, 45, 'моб.', '', 0, 'Жестко прошит в коде', NULL, NULL, NULL, NULL, '') MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (2, 28, 'Перемещение по складам', NULL, 0, NULL, 'АКТ-ПЕРЕМЕЩЕНИЕ', NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (2, 41, 'DVB-ASI', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (2, 42, 'MPEG-4', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (2, 43, 'Betacrypt', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (2, 45, 'email', '', 0, 'Жестко прошит в коде', NULL, NULL, NULL, NULL, '(([0-9A-Za-z]{1}[-0-9A-z\.]*[0-9A-Za-z]{1})|([0-9А-Яа-я]{1}[-0-9А-я\.]*[0-9А-Яа-я]{1}))@((([-0-9A-Za-z]+\.){1,2}[-A-Za-z]{2,})|(([-0-9А-Яа-я]+\.){1,2}[-А-Яа-я]{2,}))') MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (3, 28, 'Списание материалов', NULL, 0, NULL, 'АКТ-СПИСАНИЯ', NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (3, 41, 'DVB-C', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (3, 42, 'H.265', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (3, 43, 'BISS', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (3, 45, 'skype', '', 0, NULL, NULL, NULL, NULL, NULL, '') MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (4, 28, 'Коррекция', NULL, 0, NULL, 'АКТ-ИНВЕНТАРИЗАЦИЯ', NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (4, 41, 'DVB-S', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (4, 42, 'HEVC', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (4, 43, 'Bulcrypt', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (4, 45, 'icq', '', 0, NULL, NULL, NULL, NULL, NULL, '') MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (5, 28, 'Инвентаризация', NULL, 0, NULL, 'АКТ-ИНВЕНТАРИЗАЦИЯ', NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (5, 41, 'DVB-S2', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (5, 43, 'Codicrypt', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (5, 45, 'Android', '', 1, 'Жестко прошит в коде. ИД Android клиента', NULL, NULL, NULL, NULL, '') MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (6, 41, 'DVB-T', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (6, 43, 'Conax', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (6, 45, 'iOS', '', 1, 'Жестко прошит в коде. ИД iOS клиента', NULL, NULL, NULL, NULL, '') MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (7, 41, 'DVB-T2', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (7, 43, 'Cryptoworks', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (7, 45, 'telegram', '', 1, 'Жестко прошит в коде. ИД Telegram клиента', NULL, NULL, NULL, NULL, '') MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (8, 41, 'ISDB-T', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (8, 43, 'Dreamcrypt', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (9, 43, 'DRECrypt', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (10, 43, 'EXSET', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (11, 43, 'Irdeto', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (12, 43, 'Mediaguard', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (13, 43, 'Nagravision', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (14, 43, 'Neotion SHL', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (15, 43, 'Omnicrypt', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (16, 43, 'PowerVu', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (17, 43, 'Roscrypt-M', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (18, 43, 'SkyPilot', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (19, 43, 'Verimatrix', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (20, 43, 'Viaccess', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (21, 43, 'Videoguard', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (22, 43, 'FTA', 'FTA', 0, NULL, NULL, NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (1, 28, 'Приход материалов', NULL, 0, NULL, 'АКТ-ПРИХОД', NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (2, 28, 'Перемещение по складам', NULL, 0, NULL, 'АКТ-ПЕРЕМЕЩЕНИЕ', NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (3, 28, 'Списание материалов', NULL, 0, NULL, 'АКТ-СПИСАНИЯ', NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (4, 28, 'Коррекция', NULL, 0, NULL, 'АКТ-ИНВЕНТАРИЗАЦИЯ', NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CHARFIELD, O_NUMERICFIELD, O_DATEFILED, O_DATEEND, O_CHECK) VALUES (5, 28, 'Инвентаризация', NULL, 0, NULL, 'АКТ-ИНВЕНТАРИЗАЦИЯ', NULL, NULL, NULL, NULL) MATCHING (O_ID, O_TYPE);
-- Тип кабеля 56 
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 1, 56, 'RG', 'Коаксиальный кабель', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES (20, 56, 'UTP', 'незащищенная витая пара', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES (21, 56, 'F/UTP', 'фольгированная витая пара', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES (22, 56, 'STP', 'защищенная витая пара', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES (23, 56, 'S/FTP', 'фольгированная экранированная витая пара', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES (24, 56, 'SF/UTP', 'незащищенная экранированная витая пара', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES (30, 56, 'FC', 'ВОЛС', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES (40, 56, 'WI-FI', 'Беспроводная сеть', 0) MATCHING (O_ID, O_TYPE);
-- Тип порта 57
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 0, 57, 'RJ-45', '', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 1, 57, 'SFP', '', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 2, 57, 'SFP+', '', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 3, 57, 'QSFP+', '', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 4, 57, 'QSFP28', '', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 5, 57, 'COMBO', '', 0) MATCHING (O_ID, O_TYPE);
-- Тип использования 58 
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 0, 58, 'универсальный', '', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 1, 58, 'абонентский', '', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 2, 58, 'служебный', '', 0) MATCHING (O_ID, O_TYPE);
-- Вид коннектора 59 
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 0, 59, 'RJ-45', '', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 1, 59, 'BNC', '', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 2, 59, 'SC', '', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 3, 59, 'ST', '', 0) MATCHING (O_ID, O_TYPE); 
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 4, 59, 'FC', '', 0) MATCHING (O_ID, O_TYPE); 
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 5, 59, 'LC', '', 0) MATCHING (O_ID, O_TYPE); 
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 6, 59, 'MU', '', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 7, 59, 'F-3000', '', 0) MATCHING (O_ID, O_TYPE); 
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 8, 59, 'E-2000', '', 0) MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION, O_DELETED) VALUES ( 9, 59, 'FJ', '', 0) MATCHING (O_ID, O_TYPE);
-- Состояние порта 60 
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION) VALUES (0, 60, 'Нерабочий', '') MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION) VALUES (1, 60, 'Исправен', '') MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION) VALUES (2, 60, 'Отключен', '') MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION) VALUES (3, 60, 'Служебный', '') MATCHING (O_ID, O_TYPE);
-- Способ оплаты 61 
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION) VALUES (0, 61, 'CASH', '') MATCHING (O_ID, O_TYPE);      
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION) VALUES (1, 61, 'CARD', '') MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION) VALUES (2, 61, 'WEB', '') MATCHING (O_ID, O_TYPE);
-- Тип прочих начислений (64)
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION) VALUES (1, 64, 'Списание с заявки', '') MATCHING (O_ID, O_TYPE);      
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION) VALUES (2, 64, 'Возврат с заявки', '') MATCHING (O_ID, O_TYPE);

commit;

UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (6, 'ВСЕ ДОМА', 'ПРОГРАММА', 'Доступ ко всем домам в заявках и обращениях, без ограничения настройки AREA_LOCK');
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (26, 'ДОБАВЛЕНИЕ ТОЛЬКО ТЕКУЩИМ ДНЕМ', 'ПЛАТЕЖИ', 'Внимание, ограничение! Добавление и просмотр платежей только текущим днем!') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (27, 'ТОЛЬКО СВОИ ПЛАТЕЖИ', 'ПЛАТЕЖИ', 'Внимание, ограничение! Оператор видит только свои платежи и пл.документы со своими платежами') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (28, 'ПРАВКА ПЕНИ', 'ПЛАТЕЖИ', 'Разрешать изменять сумма платежа и пени при работе в режиме ПЕНИ');
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (44, 'ФАЙЛЫ ДОБАВЛЕНИЕ', 'АБОНЕНТЫ', 'Добавление файлов абонента (сканов , документов)') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (46, '1 ЗАПИСЬ', 'АБОНЕНТЫ', 'Внимание, ограничение! Отображать только одну запись в списке абонентов.') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (48, 'СБРОС ПАРОЛЯ', 'АБОНЕНТЫ', 'Сгенерировать новый пароль и отобразить оператору');
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (49, 'ФАЙЛЫ ИЗМЕНЕНИЕ/УДАЛЕНИЕ', 'АБОНЕНТЫ', 'Изменение / Удаление файлов абонента') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (63, 'ЭКСПОРТ', 'ЭКСПОРТ', 'Экспорт отчетов и данных. Просмотр итоговой информации.');
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (70, 'Интернет просмотр', 'АБОНЕНТЫ', 'Просмотри информации закладки Интернет') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (71, 'ИНТЕРНЕТ ИЗМЕНЕНИЕ', 'АБОНЕНТЫ', 'Изменение, добавление, удаление информации закладки Интернет');
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (84, 'ПРОСМОТР ТОЛЬКО СВОИХ', 'ОБРАЩЕНИЯ', 'Внимание, ограничение! Просмотр в списке Обращений только те, которые создал пользователь.') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (124, 'ОТОБРАЖАТЬ ТЕКУЩИЙ ДЕНЬ', 'СТОРОННИЕ ЗАКАЗЫ', 'Отображать сторонних заказов только за текущий день') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (125, 'ПРОСМОТР', 'СТОРОННИЕ ЗАКАЗЫ', 'ТОлько просмотр сторонних заказов') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (143, 'УЛИЦЫ и ДОМА', 'СПРАВОЧНИКИ', 'Изменение справочника улиц и домов') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (146, 'АТР.ДОМОВ', 'СПРАВОЧНИКИ', 'Изменение справочника атрибутов Домов') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (169, 'ПОСТАВЩИКИ', 'СПРАВОЧНИКИ', 'Поставщики материалов и оборудования') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (170, 'Редактирование Мат. документов', 'СПРАВОЧНИКИ', 'Редактирование закрытых документов прихода и расхода материалов') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (171, 'БОНУСЫ', 'СПРАВОЧНИКИ', 'Установка размера бонуса и дат действия бонусов') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (172, 'РАССЫЛКА СООБЩЕНИЙ', 'ПРОГРАММА', 'Рассылка сообщений абоненту') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (173, '"ЧЕРНЫЙ" СПИСОК', 'СПРАВОЧНИКИ', 'Редактирование "черного" списка') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (176, 'ПРОСМОТР ЦЕН', 'МАТЕРИАЛЫ', 'Просмотр цены материала') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (178, 'СПРАВОЧНИК УЗЛОВ', 'УЗЛЫ', 'Полный доступ к узлам') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (179, 'CallCenter', 'ПРОГРАММА', 'Для работы службы обзвона. Список всех квартир дома') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (180, 'ПРИХОД', 'МАТЕРИАЛЫ', 'Оформление документов прихода на склад') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (181, 'ПЕРЕМЕЩЕНИЕ', 'МАТЕРИАЛЫ', 'Оформление документов перемещения между складами') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (182, 'СПИСАНИЕ', 'МАТЕРИАЛЫ', 'Оформление документов списания со склада') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (183, 'ИНВЕНТАРИЗАЦИЯ', 'МАТЕРИАЛЫ', 'Оформление документов инвентаризации') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (184, 'ДИСТРИБЬЮТОР КАНАЛОВ', 'СПРАВОЧНИКИ', 'Дистрибьюция каналов. Договора и отчеты.') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (185, 'ЗАДАЧИ ВСЕХ', 'ПРОГРАММА', 'Просмотр задач всех сотрудников') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (186, 'ЗАКРЫТИЕ МАТ. ДОКУМЕНТОВ', 'МАТЕРИАЛЫ', 'Закрытие материальных документов на которые есть права создания') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (187, 'Закрывать свою задачу', 'ПРОГРАММА', 'Закрывать задачу в которой пользователь стоит в исполнителях') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (189, 'Добавлять, изменять, удалять атрибуты', 'АБОНЕНТЫ', 'Добавлять, изменять, удалять атрибуты абонентов') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (190, 'ПРОБЛЕМЫ ВЕЩАНИЯ. Добавлять', 'ТВ', NULL) MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (191, 'ПРОБЛЕМЫ ВЕЩАНИЯ. Удалять', 'ТВ', NULL) MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (192, 'ПРОБЛЕМЫ ВЕЩАНИЯ. Закрывать', 'ТВ', NULL) MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (193, 'ПРОБЛЕМЫ ВЕЩАНИЯ. Справочники', 'ТВ', 'Типы проблем. Решения проблем') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (200, 'ПОЛНЫЙ ДОСТУП', 'МОБИЛЬНОЕ ПРИЛОЖЕНИЕ', 'Полный доступ к настройкам моб. приложений') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (201, 'НОВОСТИ', 'МОБИЛЬНОЕ ПРИЛОЖЕНИЕ', 'Публиковать новости') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (210, 'ПОРТЫ', 'ОБОРУДОВАНИЕ', 'Создание/редактирование портов оборудования') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (211, 'ЛИНИИ СВЯЗИ', 'УЗЛЫ', 'Создание/редактирование линий связи узлов ') MATCHING (ID);
UPDATE OR INSERT INTO SYS$RIGHTS (ID, RIGHTS, CATEGORY, NOTICE) VALUES (220, 'СКРЫТЬ ПЕРСОНАЛЬНЫЕ ДАННЫЕ', 'АБОНЕНТЫ', 'Внимание, ограничение! Запретить доступ к персональным данным');
commit;

UPDATE OR INSERT INTO SETTINGS (VAR_NAME, VAR_VALUE, VAR_TYPE, VAR_NOTICE) VALUES ('ROW_HL_COLOR', '', 'STRING', 'Цвет выделения строки') MATCHING (VAR_NAME);
UPDATE OR INSERT INTO SETTINGS (VAR_NAME, VAR_VALUE, VAR_TYPE, VAR_NOTICE) VALUES ('ROW_HL_ID', '', 'INTEGER', 'ID объекта выделения') MATCHING (VAR_NAME);
UPDATE OR INSERT INTO SETTINGS (VAR_NAME, VAR_VALUE, VAR_TYPE, VAR_NOTICE) VALUES ('ROW_HL_TYPE', '', 'INTEGER', 'Тип подцветки. 0-есть разовая услуга') MATCHING (VAR_NAME);
COMMIT;
