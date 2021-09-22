SET SQL DIALECT 3;

SET NAMES UTF8;

SET CLIENTLIB 'D:\SUBD\Firebird\30X\fbclient.dll';

CONNECT 'localhost:A4ON_DB' USER 'SYSDBA' PASSWORD 'masterkey';

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