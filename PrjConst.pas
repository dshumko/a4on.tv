unit PrjConst;
{$I defines.inc}

interface

const
  LogFileName    = 'a4on.log';
  DB_VERSION     = 100;
  pswdPrefix     = 'tv';
  // переменные для экспорта
  // заменяются на соответствующие данные из списка
  export_fields       = '[ЛИЦЕВОЙ];[САЛЬДО];[БАЛАНС];[ФАМИЛИЯ];[ИМЯ];[ОТЧЕСТВО];[ИНИЦИАЛЫ];[УЛИЦА];[СОКР_УЛ];[ДОМ];[КВАРТИРА];[РАЙОН];[ТЕЛЕФОН];[МОБ_ТЕЛЕФОН];[ПАСПОРТ_N];[ПАСПОРТ_ВЫДАН];[ДЕНЬ];[МЕСЯЦ];[ГОД];[ДНЕЙ_В_МЕС];[SECRET];[ДОГОВОР];[ОПЛАТА_В_МЕСЯЦ];[ДОПЛАТА]';
  export_fields_total = '[ДЕНЬ];[МЕСЯЦ];[ГОД];[КОЛВО_ЗАПИСЕЙ];[ИТОГО_ДОЛГ];[ИТОГО_САЛЬДО];[ДНЕЙ_В_МЕС];';
  ls_fields = '[СЧЕТЧИК];[КОД Н.ПУНКТ];[КОД УЧАСТКА];[КОД УЛИЦЫ];[КОД ДОМА];[ДОМ];[КВАРТИРА];[ТИП УСЛУГИ];[ПН ДОГОВОРА];[ДЕНЬ];[МЕСЯЦ];[ГОД]';
  barcode_fields ='[КОД_АБОНЕНТА];[ЛИЦЕВОЙ];[СУММА];[СУММА_В_КОПЕЙКАХ];[ФИО];[ФАМИЛИЯ];[УЛИЦА];[ДОМ];[КВАРТИРА];[МЕСЯЦ];[ГОД];[ПРЕД_МЕСЯЦ];[ПРЕД_ГОД]';


  // константа для пароля. чтоб абоненты не могли войти в обход системы
{$IFDEF WITHRIGHTS}
  passprefix: string = 'tv';
{$ELSE}
  passprefix: string = '';
{$ENDIF}
  srv_Null = -1; // нет услуги
  srv_AutoBlock = -3; // Автоблокировка

  rght_Programm_Settings = 1;
  rght_Programm_ViewMoney = 2;
  rght_Programm_ViewLog = 3;
  rght_Programm_ChangePswd = 4;

  rght_Calc_CLose = 11;
  rght_Calc_Back = 12;
  rght_Calc_Recalc = 13;

  rght_Pays_full = 20;
  rght_Pays_add = 21;
  rght_Pays_del = 22;
  rght_Pays_CardsGen = 23;
  rght_Pays_CardsView = 24;
  rght_Pays_AddPromis = 25;
  rght_Pays_AddToday = 26;
  rght_Pays_TheirAdd = 27;
  rght_Pays_EditFine = 28; // ПРАВКА ПЕНИ Разрешать изменять сумма платежа и пени при работе в режиме ПЕНИ

  rght_Customer_full = 30;
  rght_Customer_add = 31;
  rght_Customer_del = 32;
  rght_Customer_edit = 33;
  rght_Customer_AddSrv = 34;
  rght_Customer_DelSrv = 35;
  rght_Customer_EditSrv = 36;
  rght_Customer_History = 37;
  rght_Customer_EditLan = 38;
  rght_Customer_Appliance = 64;
  rght_Customer_EditDigit = 39;
  rght_Customer_Discount = 41;
  rght_Customer_Bonus = 42;
  rght_Customer_View = 43;
  rght_Customer_Files_Add = 44;
  rght_Customer_Files_Edit = 49;
  rght_Customer_NPS = 45;
  rght_Customer_Only_ONE = 46;
  rght_Customer_Debt = 47;
  rght_Customer_PSWD = 48; // сброс пароля
  rght_Customer_Attribute = 189;

  rght_Dictionary_full = 40;

  rght_Request_Full = 50;
  rght_Request_Add = 51;
  rght_Request_Edit = 52;
  rght_Request_Give = 53;
  rght_Request_Close = 54;
  rght_Request_Del = 55;
  rght_Request_DateChange = 56;
  rght_Request_Close_Day = 57;
  rght_Request_Unclose = 58;

  rght_Reports_Designer = 60;
  rght_Reports_view = 61;
  rght_Reports_Save = 62;
  rght_Export = 63;

  rght_Billing_view = 70;
  rght_Billing_edit = 71;

  rght_Recourses_add = 80;
  rght_Recourses_del = 82;
  rght_Recourses_edit = 83;
  rght_Recourses_owner = 84;

  rght_BCIssues_add = 190;
  rght_BCIssues_del = 191;
  rght_BCIssues_close = 192;
  rght_BCIssuesType = 193;

  rght_Dictionary_DigitEQP = 90;
  rght_Digit_EditEQP = 91;
  rght_Digit_DelEQP = 92;

  rght_Modules_edit = 100;
  rght_Modules_Exec = 101;

  rght_DVB_edit = 110; // НАСТРОЙКА СХЕМЫ DVB
  rght_DVB_view = 111; // ПРОСМОТР СХЕМЫ DVB

  rght_EPG_EditEvent = 114; // РЕДАКТ-Е ПРОГРАММЫ

  rght_IPTV_edit = 115; // НАСТРОЙКА IPTV
  rght_IPTV_view = 116; // ПРОСМОТР IPTV

  rght_OrdersTP_full = 120;
  rght_OrdersTP_add = 121;
  rght_OrdersTP_edit = 122;
  rght_OrdersTP_del = 123;
  rght_OrdersTP_Today = 124;
  rght_OrdersTP_View = 125;

  rght_Dictionary_View = 5;
  rght_Dictionary_Areas = 141;
  rght_Dictionary_CONTRACTORS = 142;
  rght_Dictionary_Street = 143;
  rght_Dictionary_WorkAreas = 144;

  rght_Dictionary_RecType = 147;
  rght_Dictionary_ReqType = 148;
  rght_Dictionary_ReqTemplate = 149;

  rght_Dictionary_ReqWorks = 150;

  rght_Dictionary_Channels = 152;

  rght_Dictionary_Materials = 151;
  rght_Material_Cost = 176;
  rght_Materials_full = 165;
  rght_Dictionary_MatDocNew = 180;
  rght_Dictionary_MatDocMove = 181;
  rght_Dictionary_MatDocOUT = 182;
  rght_Dictionary_MatDocInvent = 183;
  rght_Dictionary_MatDoc_Edit = 170;
  rght_Dictionary_MatDoc_Close = 186;

  rght_Dictionary_Distributor = 184; // ДИСТРИБЬЮТОР КАНАЛОВ
  rght_Dictionary_HeadEnd = 153;
  rght_Dictionary_Workers = 154;
  rght_Dictionary_PaySources = 155;
  rght_Dictionary_Services = 156;
  rght_Dictionary_Vlans = 157;

  rght_Dictionary_AtrAbonents = 158;
  rght_Dictionary_AtrEquipments = 159;
  rght_Dictionary_AtrServices = 174;
  rght_Dictionary_AtrIPTV = 175;
  rght_Dictionary_AtrHOUSE = 146; // rght_Dictionary_Houses = 146;
  rght_Dictionary_Shippers = 169;
  rght_Dictionary_Bonuses = 171;
  rght_Dictionary_BlacList = 173;

  rght_Dictionary_Company = 160;
  rght_Dictionary_HeadEndEQP = 161;
  rght_Dictionary_Equipment = 162;
  rght_Dictionary_Reports = 163;
  rght_Dictionary_Warehouses = 164;
  rght_Dictionary_MANUFACTURERS = 166;
  rght_Dictionary_Banks = 167;
  rght_Dictionary_OrdersTPType = 168;
  rght_Dictionary_Nodes = 178;

  rght_Messages_add = 172;

  rght_CallCenter = 179;
  rght_Tasks_All = 185;
  rght_Task_Close = 187;

  rght_Mobile_full = 200;
  rght_Mobile_news = 201;
resourcestring
{$IFNDEF ATIRRA}
  rsWWW = 'A4ON.TV';
  rsApplicationFullNAME = 'ПО "A4ON.TV"';
  rsEMAIL = 'post@a4on.tv';
  rsAplicationName = 'A4ON.TV';
  rsDBNAME = 'A4ON_DB.FDB';
{$ELSE}
  rsWWW = 'www.atirra.com';
  rsApplicationFullNAME = 'ПО "АТИРРА"';
  rsEMAIL = 'info@atirra.com';
  rsAplicationName = 'АТИРРА';
  rsDBNAME = 'ATIRRA_DB.FDB';
{$ENDIF}
{$IFNDEF DEMOVERSION}
  rsDBALIAS = 'A4ON_DB';
{$ELSE}
  rsDBALIAS = 'A4ON_FREE';
{$ENDIF}
  rsEOL = #13#10;
  rsQUOTE = #39;
  rsSEP = ' : %s';
  rsDEMO = '(расчет до 1000 абонентов)';
  rsSOFTMODE = 'В каком режиме работает ПО';
  rsUSER_BLOCKED = 'Пользователь заблокирован, обратитесь к администратору.';
  rsCREATE_DIGIT_CARDS = 'Вы желаете создать %s,  начиная с номера %s?';

  rsRecognize = 'Распознать';
  rsSave = 'Сохранить';
  rsCancel = 'Отмена';

  rsERROR_CONNECT = 'Невозможно подключиться к базе данных.';
  rsERROR_CONNECT_LOST = 'Соединение с БД прервано .';
  rsERROR_RESONE = 'Причина ошибки:';
  rsERROR_DB_NOT_FOUND = 'Не найден файл базы данных!';
  rsERROR_DB_COONECT = 'Невозможно подключиться к базе данных.';
  rsERROR_DB_USER = 'Неверно указано имя пользователя или пароль.';
  rsERROR_DB_DENIED = 'Доступ к базе данных закрыт!';
  rsERROR_FIREBIRD_NOT_RUN = 'Возможная причина: не запущен сервер Firebird!';
  rsERROR_FIREBIRD_WRONG_VERSION = 'Версия сервера не соответствует формату базы данных!';
  rsERROR_FIREBIRD_LAST_VERSION = 'Установите последнюю версию сервера Firebird!';
  rsERROR_NOT_CORRECT_NUMBER = 'Не корректное число';
  rsERROR_NOT_FILL_ALL = 'Не все поля заполнены.';
  rsERROR_CUST_FIND = 'Абонент с лицевым "%s" не найден в БД.';
  rsNOT_FOUND_CUST = 'Абонент не найден.';
  rsNOT_FOUND_DECODER = 'Такой декодер не существует';
  rsERROR_UNIQUE = 'Строка с такими значениями уже существует.'#13#10'%s';
  rsERROR_ADD_FLAT = 'Квартира %s не добавлена, добавьте вручную.';
  rsERROR_MATDOC_CLOSED = 'Не могу удалить документ. Он уже проведен.';
  rsERROR_GMAPI = 'Отсутствует ключ API карт.'#13#10'Ключ необходимо прописать в настройках программы';

  rsCustomerInfo = 'Лицевой : %s '#13#10'Договор : %s'#13#10'ФИО : %s'#13#10'Сальдо : %s'#13#10'Статус : %s';
  rsACCOUNT = 'Лицевой';
  rsEQUIPMENT = 'Оборудование';
  rsCONTRACT = 'Договор';
  rsCODE = 'Код';
  rsFIO = 'ФИО';
  rsSTATE = 'Статус';

  rsSALDO = 'Сальдо';
  rsBALANCE = 'Баланс';
  rsFlat = 'Квартира';
  rsAdres = 'АДРЕС';
  rsSUM = 'СУММА';
  rsDATE = 'ДАТА';
  rsNOTICE = 'ПРИМЕЧАНИЕ';

  rsSAME_ADRES = 'По данному адресу уже запись в картотеке!';
  rsHouse = ' д.';
  srCalcFinished = 'Перерасчет окончен!';
  srmiDesigner = 'Дизайнер';
  s_ReturnMonth = 'Вы желаете перевести остатки на предыдущий месяц (';
  rsCloseMonth = 'Вы желаете перевести остатки на следующий месяц (%s) ?';
  rsCloseDay = 'Вы желаете начислить абонплату на сегодня (%s) ?';
  rsSuspiciousDateQuest = 'Подозрительная дата (%s). Продолжить?';
  rsSuspiciousDate = 'Подозрительная дата';
  rsNeedRestart = 'Необходим перезапуск приложения';
  rsLoadTime = 'Обработано за %5.1n секунд';
  rsReportCategoryNameHint = 'Введите наименование категории:';
  rsReportNameHint = 'Введите наименование отчета:';
  rsInputFilterName = 'Введите наименование фильтра';
  rsFindHint = 'Введите текст для поиска абонента';
  rsReson = 'Введите причину отмены';

  // rsAaeain3 = 'Баланс ';

  rsMeasure = 'Ед. изм.';
  rsDecoder = 'Декодер';
  rsAddresHouse = 'Адрес|Дом';
  rsAddresFlat = 'Адрес|Кв';
  rsPostIndex = 'Адрес|Индекс';
  rsPorch = 'Адрес|П';
  rsAddresST = 'Адрес|пр.';
  rsAddresTAP = 'Адрес|Отв.';
  rsAddresStreet = 'Адрес|Улица';
  rsFloor = 'Адрес|Э';

  rsDBVersionWrong = 'Версия Базы данных не соответствует исполняемому модулю!' + #13#10 +
    'Необходимо произвести обновление базы данных!';

  rsCancelRequest = 'Абонент действительно желает снять заявку?';
  rsCustomersQ = ' абонентах?';
  rsNodesQ = ' узлах?';
  rsCustomerNotFound = 'Абонент не найден';
  rsAccountExists = 'Абонент с лицевым номером %s уже существует!';
  rsExtIDExists = 'Абонент с таким номером %s уже существует!';
  rsCustomers = 'Абоненты';
  rsNotSetRatesBank = 'Не указана настройка банка валют';
  rsErrorAccountDoubleMessaqge = 'Данный лицевой счет уже зарегистрирован в системе! ';

  rsBilling = ' Биллинг ';
  rsFilterOn = 'Включить фильтр';
  rsFilterOnCondition = 'Включить фильтр отбора по условию';
  rsPauseSrv = 'Временное отключение с даты до даты';
  rsErrorSrvOnOff = 'Для услуги "%s" неверно настроены услуги включения/отключения.';
  rsAdd = 'Добавить';
  rsAddPhone = 'Добавить телефон %s\nабоненту %s %s %s ?';

  rsContractWT = 'Договор : %s';
  rsFromClosedRequest = 'Внесите номер закрытой заявки';
  rsWarning = 'Внимание';
  rsWarningPort = 'Внимание, данный порт занят';
  rsPswdExpire = 'Пароль устарел. Заменим?';

  rsDeleteCustomerWarning = 'Внимание, удаление абонента приведет к потере всей информацией о нем?';
  rsDeleteNodeWarning = 'Внимание, удаление узла приведет к потере всей информацией о нем?';
  rsNodeLayotEmpty = 'Заполнить компоновку согласно типа узла?';
  rsPayDocN = ' Документ №';
  rsAccessDenied = 'Доступ запрещен';
  rsAmount = 'Сумма';
  rsAllFiles = 'Все файлы (*.*)|*.*';
  rsFileHaveErrors = 'В файле обнаружены ошибки.';
  rsAttrValue = 'Атрибут|Значение';
  rsAttrName = 'Атрибут|Название';
  rsAttrNotice = 'Атрибут|Примечание';

  rsDeleteExportProfile = 'Вы действительно желаете удалить настройки профиля %s ?';
  rsSelectFolder = 'Выберите стартовую директорию';
  rsTookSelectedBid = 'Выдать все выделенные заявки';
  rsLoadPaysWithError = 'Вы желаете загрузить платежи, игнорируя эти ошибки?';

  rsCustomerDecoderDelete = 'Вы желаете удалить декодер %s?';
  rsUserGroupDelete = 'Вы желаете удалить группу %s?';

  rsPaysDenied = 'Вы не имеете права на добавление платежей в систему!';
  rsQueryCompite = 'Выполнение запроса завершено';
  rsDataBaseAlias = 'Задайте название БД';
  rsOrdersPeriod = 'Заказы за период с %s по %s';
  rsRequestCloseAs = 'Закрыть как заявку';
  rsRequestRecreateD = 'Пересоздать через %d дн.';
  rsRequestOpenLinked = 'Открыть связную заявку?';
  rsNumToStrDesc = 'Заменяет в строке S подстроку OldS на подстроку NewS';
  rsSaveLetterDate = 'Занести информацию по письмам в базу данных?';
  rsCaigin = 'запрос';
  rsCategorySaveError = 'Нельзя сохранить категорию в файл!';
  rsReguestWN = '%d заявка';
  rsTaskFilter = 'Задачи.';
  rsCheckReportName = 'Чек';
  rsContactDelete = 'Удалить контакт абонента?';
  rsDECODER_USED = 'Этот декодер у абонента ';
  rsDeleteFromDoc = 'Удалить из документа';
  rsDeleteRecord = 'Удалить запись (%s)?';
  rsDisconnect = 'Отключить пользователя %s?';
  rsIdleDisconnect = 'Простой более %d часов. Закроем подключение к базе.';
  rsMatCountIncorrect = 'Списывается больше чем есть на складе у материалов:'#13#10'%s' + #13#10 + 'Продолжить?';
  rsDeleteProgram = 'Удалить программу';
  rsUTCTimeChange = 'Изменение времени UTC';
  rsUTCTimeChangeHint = 'Укажите на сколько минут сдвинуть время начала';
  rsXMLTVFormatError = 'Не верный формат файла XMLTV';
  rsAND = 'И';
  rsFlatShort = ' кв.';
  rsPrintCheckAdr = '%s д. %s кв. %s';
  rsPrintCheckAdrWOF = '%s д. %s';
  rsPayCardCreate = 'Вы желаете создать %d карт оплаты номиналом %d ?';
  rsPayCardNotFound = ' Карта оплаты не найдена! ';
  rsPayCardActivated = ' Карта оплаты уже активирована! ';
  rsPayCardReport = 'Карты_Оплаты';

  rsItogo = 'ИТОГО';
  rsCategory = 'Категория ';
  rsChangeBy = 'Изменил: ';
  rsChange = 'Изменить';
  rsEditCustomerForm = 'Изменить абонента';

  rsOR = 'ИЛИ';
  rsClientFM = 'Клиент|И.О.';
  rsClientFN = 'Клиент|Имя';
  rsClientMN = 'Клиент|Отчество';
  rsClientSN = 'Клиент|Фамилия';

  rsAccountWT = 'Лицевой : %s';
  rsPQuant = '|Кол-во';

  rsProgramEnd = 'Конец программы';
  rsInternet = 'Интернет';
  rsInformation = 'Информация';
  rsKoefValue = 'Коэффициент|Размер';
  rsKoefFromD = 'Коэффициент|по';
  rsKoefToD = 'Коэффициент|с';
  rsKoef = 'Коэффициенты';
  rsSettingsBarCode = 'Настройка штрих-кода';
  rsSettingsAccount = 'Настройка формата ЛС';

  rsSaldoWT = 'Сальдо  : %s';

  rsBonuses = 'Бонусы';
  rsEmptyDocNumber = 'Нет номера документа! Проверьте...';
  rsEmptyFieldError = 'Заполните поле';
  rsDebtForDays = 'Баланса на %d дней';
  rsDebtToNow = 'На сегодня %d';
  rsDebtSum = 'Долг %f';
  rsCity = 'Адрес|Город';
  rsDistrict = 'Адрес|Район';

  rsDelDigitPacket = 'Отвязать услугу %s от декодера %s ?';
  rsDelIpPacket = 'Отвязать услугу %s от IP %s ?';
  rsFunctionNumberToWord = 'Число прописью. формат вывода:';
  rsPaySource = ' Источник: %s';
  rsType = ' Тип: %s';

  rsItogQuant = 'Итого|Кол-во';
  rsItogSum = 'Итого|Сумма';
  rsExecuteTime = 'Выполнено за %d мс';
  rsFileNotFound = 'Файл (%s) не найден';
  rsFormOnTab = 'Карточка';

  rsSingleServices = 'Разовые услуги';
  rsResultFor = 'Результат для ';

  rsCalculateComplite = 'Расчет окончен (%s)';
  rsWrongDate = 'Неверная дата';
  rsWrongConractDate = 'Неверная дата договора! ';
  rsContractDateError = 'Неверная дата договора, дата должна быть этим месяцем! ';
  rsCustomerInBlackList = 'Абонент в "Черном" списке!';

  rsErrorFilter = 'Неверно установлен фильтр';
  rsIncorrectSQL = 'Неверный запрос SQL';
  rsIncorrectDecoder = 'Неверный номер декодера';
  rsIncorrectSTB = 'Неверный номер STB';
  rsIPIncorrect = 'Неверный IP';
  rsInputIncorrect = 'Неверное значение';
  rsPastDateIncorrect = 'Запрещено изменять услуги в прошлом';
  rsFileLocked = 'Файл заблокирован (открыт в другом приложении)';
  rsMACIncorrect = 'Неверный MAC';
  rsLANIncorrect = 'Необходимо IP или MAC или IPv6 или Порт';
  rsPORTdefective = 'Порт помечен как неисправный';
  rsDayNotZerro = 'Количество дней должно быть больше 0';
  rsNotCustomer = 'НЕ АБОНЕНТ';

  rsErrorLoadDll = 'Невозможно загрузить библиотеку %s';
  rsErrorCrateDirectory = 'Невозможно создать директорий %s';

  rsPrintAllReguest = 'Печатать все заявки';
  rsPrintPaymentDoc = 'Печать Платежного Документа';
  rsLabelName = 'Название';
  rsErrorExist = 'Найдены ошибки';
  rsTitle = 'Наименование';
  rsReportCategoryName = 'Наименование категории';
  rsReportName = 'Наименование отчета';
  rsFromBASE64toString = 'перевод из BASE64 в строку';
  rsToDate = 'Перенос на дату';
  rsRecoursePeriod = 'Обращения. Период с %s по %s';
  rsBCIssuesPeriod = 'Проблемы вещания. Период с %s по %s';
  rsPasswordNotChange = 'Пароль не изменен!';

  rsNpsDay = 'НПС|Дата';
  rsNpsRating = 'НПС|Оценка';
  rsNpsNotice = 'НПС|Комментарий';

  rsReportManager = 'Менеджер отчетов';

  rsStreetCodeReq = 'Необходимо ввести КОД улицы';

  rsPassIssued = 'Паспорт|Выдан';
  rsPassNumber = 'Паспорт|Номер';
  rsPassBirthDay = 'Паспорт|Дата рождения';
  rsPassYears = 'Паспорт|Лет';
  rsPassAdres = 'Паспорт|Адрес регистрации';
  rsPassPrivatNumber = 'Паспорт|Личный номер';
  rsBirthPlace = 'Паспорт|Место рождения';
  rsMatPlace = 'Места хранения|';
  rsProfileExportSettings = 'Настройка шаблонов экспорта';
  rsErrorMoveToArchive = 'Не удалось перенести файл '#13#10'%s в архив %s'#13#10'Сделайте это самостоятельно';
  rsMaterials = 'Материалы';
  rsMaterialsМоve = 'Материалы по заявкам';
  rsMatNotDelete = 'Материалы в данной группе не будут удалены';

  rsSelectPayDoc = 'Не указан платежный документ!';

  rsNoRights = 'Нет прав';
  rsError = 'Ошибка';
  rsErrorQuestWT = 'Ошибка %s. Продолжить?';
  rsErrorQuestContinue =  'Есть ошибки. Продолжить?';

  rsErrorConnect = 'Ошибка подключения к БД'#13#10'%s';
  rsErrorDll = 'Ошибка в библиотеке %s';
  rsErrorInLine = 'Ошибка в строке:%d %s';
  rsErrorEdit = 'Ошибка изменения';
  rsErrorReadProfile = 'Ошибка конвертации (не могу прочитать настройки профиля)';
  rsErrorLoadReestr = 'Ошибки в документе № %s, от %s Файл реестра: %s';
  rsErrorHeadFormatReestr = 'Ошибка конвертации (не соответствует формат заголовка документа и настройки профиля)';
  rsErrorBodyFormatReestr = 'Ошибка конвертации (не соответствует формат блока данных и настройки профиля) строка %d';
  rsErrorSetFilter = 'Ошибка при установке фильтра.'#13#10'Будут показаны все абоненты!';
  rsErrorSetRequestFilter = 'Ошибка при установке фильтра.'#13#10'Будут заявки на сегодня!';
  rsErrorSave = ' Ошибка сохранения ';

  rsPayDocs = 'Платежные документы';
  rsPayments = 'Платежи';
  rsPaymentsPeriod = 'Платежи за период с %s по %s';
  rsFilesPeriod = 'Файлы за период с %s по %s';
  rsPamentLessDebt = 'Платеж не может быть меньше суммы долга+пеня!';
  rsLettersAndMessages = 'Письма и сообщения';
  rsPreviewTitle = 'Предварительный просмотр "%s"';
  rsPreviewInWindow = 'Предварительный просмотр в стандартном окне';

  rsNoticeWT = 'Примечание : %s';
  rsProcessAllSelectedRows = 'Применить ко всем выделенным строкам';
  rsTook = 'Принял: %s';
  rsCheckCompliteNoError = 'Проверка завершена. Ошибок не найдено!.';
  rsContinue = 'Продолжить?';
  rsContinue1 = ' продолжить(';
  rsViewInFastReport = 'Просмотр в FastReport';
  rsViewOnly = 'Просмотр';

  rsConfirm = 'Подтверждение';
  rsRequestNew = 'Новая заявка';
  rsSMSSend = 'К отправке %d СМС, на балансе %d'#13#10'Продолжить?';
  rsSMScountLess = 'Количество СМС %d больше чем остаток на балансе %d';
  rsNewCustomerForm = 'Новый абонент';
  rsNewResult = 'Новый результат для ';
  rsNewReportName = 'Новый отчет';
  rsCost = 'Цена';
  rsNumber = 'Номер';
  rsMatType = 'Тип';
  rsQuestionSamePayment = 'Похожий платежный документ уже есть в БД, Вы желаете продолжить?';
  rsErrorSamePayment = 'Похожий платежный документ уже есть в БД. Проверьте №%s от %s';
  rsINPUT_VALUE = 'Укажите значение';
  rsINPUT_VALUE_FORMAT = 'Укажите значение в нужном формате %s';
  rsSaveReportsAsFiles = 'Отчеты сохранены в каталоге: %s'#13#10'Открыть каталог?';
  rsReportsLoaded = 'Отчеты загружены.';
  rsFilterOff = 'Отключить фильтр';
  rsFilterOffCondition = 'Отключить фильтр отбора по условию';
  rsRequestCancel = 'Отменить заявку';
  rsModuleEditor = 'Редактор';
  rsMSG_CharCount = 'Символов в сообщении: %d';

  rsColumnIP = 'Сеть|IP';
  rsColumnMAC = 'Сеть|MAC';
  rsColumnConnectTo = 'Сеть|Коммутатор';
  rsColumnConnectToIP = 'Сеть|Ком-р IP';
  rsColumnConnectToPort = 'Сеть|Ком-р Порт';
  rsColumnLanTag = 'Сеть|ЦифИнфо';
  rsColumnLanTagStr = 'Сеть|СтрИнфо';
  rsReporHide = 'Скрыть отчет?';
  rsCompiledOK = 'Скомпилировано OK, Выполнение...';
  rsPaymentCardExpired = ' Срок карты оплаты истек! ';
  rsLAN = 'СПД';
  rsAppliance = 'Оборудование';
  rsErrorNeedDeleteHouseTeam = 'Сначала нужно удалить все дома звена, либо перенести дома на другое звено.';
  rsErrorNeedDeleteSubArea = 'Сначала нужно удалить все дома района или перенести дома на другой район.';
  rsErrorNeedDeleteHouse = 'Сначала нужно удалить все дома на улице!';
  rsErrorNeedDeleteTeam = 'Сначала нужно удалить все звенья участка!';
  rsErrorNeedDeleteArea = 'Сначала нужно удалить все районы нас. пункта!';
  rsErrorAccountDouble = 'Совпадение лицевых';
  rsErrorIncorrectUserName = 'Не верное имя пользователя. %s недопустимы';
  rsErrorNeedHouseClear = 'Удаление невозможно. На дом ссылаются %s : %d';
  rsErrorNeedDeleteHistory = 'Сначала нужно удалить всю историю подключений/отключений!';

  rsMessagesPeriod = 'Сообщения за период с %s по %s';
  rsReportListAccounts = 'Список абонентов';

  rsSavePorchFloor = 'Сохранить подъезд и этаж';
  rsSaveContact = 'Сохранить телефон';
  rsStateWT = 'Статус  : %s';
  rsStringToBASE64 = 'строку в BASE64';
  rsReportExtOrders = 'Сторонние заказы';
  rsSummaS = '|Сумма';

  rsNotNegativePayment = 'Сумма должна быть больше нуля';

  rsTable = 'Таблица';
  rsDeleteRequestWT = 'Удалить выбранную заявку №%d ?';
  rsDeleteRequestWMW = 'Заявка с работами или материалами. Удалить?';
  rsDeleteService = 'Удалить выбранную услугу?';

  rsDeleteWithName = 'Удалить %s ?';
  rsDelIP = 'Удалить данные o ip %s ?';
  rsDeleteHouseZone = 'Удалить дом из зоны обслуживания?';
  rsHouseInService = 'В этом доме есть подключенные абоненты. Продолжить?';
  rsDeleteSelectedRecords = 'Удалить выбранные записи?';
  rsDeleteSubArea = 'Удалить район %s ?';
  rsDeleteOrder = 'Удалить заказ №%s ?';
  rsDemo_Restrict = 'Ограничение Демо версии';

  rsDeleteMaterialGroup = 'Удалить запись о группе материалов?';

  rsDeleteChannel = 'Удалить запись о канале %s?'#13#10'Канал не будет удален если он используется в услугах или DVB';
  rsDelChanError = 'Канал не удален. Используется:'#13#10'%s';
  rsDeleteChannels = 'Удалить записи о %d канале(ах)?';
  rsDeleteWorkerInfo = 'Удалить запись о работнике %s ?';
  rsDeleteInfoAbout = 'Удалить информацию о ';
  rsDeleteWork = 'Удалить работу';
  rsUserDelete = 'Удалить пользователя %s ?';
  rsDeleteSrvHistory = 'Удалить запись по истории подключения услуги?';
  rsDeleteMaterial = 'Удалить запись о материале?';
  rsDeletePayType = 'Удалить запись о улице?';
  rsDeleteContact = 'Удалить контакт';
  rsDeleteLetter = 'Удалить информацию о письме?';
  rsDeleteParam = 'Удалить параметр?';
  rsDeleteQuote = 'Удалить ограничение?';
  rsDeleteCustomerRec = 'Удалить обращение абонента ?';
  rsDeleteProfile = 'Удалить профиль';
  rsDeletePayCardSerial = 'Удалить серию карт оплаты?';
  rsDelLinkWT = 'Удалить связку с %s';
  rsDeleteDiscount = 'Удалить скидку?';
  rsDeleteBonus = 'Удалить бонус %f ?';
  rsDeleteTarif = 'Удалить тариф ?';
  rsDeleteCity = 'Удалить нас. пункт %s ?';
  rsDeleteWorkTeam = 'Удалить участок %s ?';
  rsDeleteRequest = 'Удалить услугу %s ?"';
  rsRequestPorchFloor =
    'У абонента подъезд и этаж отличен от введенного в заявке.'#13#10'Сохранить абоненту подъезд и этаж: %s %s ?';
  rsRequestPhone =
    'У абонента телефон отличен от введенного в заявке.'#13#10'Сохранить абоненту новый номер телефона: %s ?';

  rsFileNotFoundWT = 'Файл "%s" не найден';
  rsCreateA4onADBSuccess = 'Файл A4ON.ADB успешно создан';

  rsFileProcessed = 'Файл обработан';
  rsTarChan = 'Тариф на канал %s';

  rsSelectDate = 'Укажите дату';
  rsSelectHouse = 'Укажите дом';
  rsSelectAttribute = 'Укажите атрибут';
  rsSelectAccount = 'Укажите лицевой';
  rsSelectReportsDir = 'Укажите корневую директорию с отчетами';
  rsSelectFile = 'Укажите имя файла';
  rsSelectName = 'Укажите название';
  rsSelectCity = 'Укажите населенный пункт';
  rsSelectStreet = 'Укажите улицу';

  rsStreetNotFound = 'Улица не найдена.'#13#10'добавить новую улицу?';
  rsFilter = 'Фильтр';

  rsFIOWT = 'ФИО     : %s';
  rsTypeW = '.  Тип: ';

  rsPageDigit = 'Цифра';
  rsDigitDecoder = 'Цифра|Декодер';
  rsDigitNotice = 'Цифра|Примечание';
  rsDigitSTBCAM = 'Цифра|STB/CAM';
  rsDigitTV = 'Цифра|ТВ модель';
  rsEqpmntPorts = 'Порты оборудования';
  rsFunctionBarCode = 'Формируем штрих-код';
  rsFunctionsA4onTV = 'функции A4ON.TV';
  rsPeriodicheskieUslugi = 'Периодические услуги';
  rsPiece = 'шт.';
  rsPrepay = 'Обещанный платеж';
  rsProfNotFound = 'Профиль (%s) не найден';
  rsRecourses = 'Обращения и задачи';
  rsRepordCategoryDelete = 'Удалить категорию %s ?'#13#10'Важно! Будут удалены все дочерние отчеты!';
  rsRepordDelete = 'Удалить отчет %s ?';
  rsRequests = 'Заявки';
  rsRecordNotFound = 'Запись не найдена';

  rsSTB_NOT_FOUND = 'Такой STB не существует';
  rsSTB_USED = 'Этот STB у абонента ';
  rsTextEditor = 'Редактор текста';
  rsUdalitTariph = 'Удалить тариф ?';
  rsUpdateApplication = 'Обновить версию ПО?';
  rsVnimanieBalansAbonentaMozhet = 'Внимание! Баланс абонента может измениться!';

  rsSrvSwitchNotCongigure = 'Не настроена связка переключений услуг';
  rsSrvAlreadyOff = 'Услуга уже отключена';
  rsNoMoney = 'Нет денег на счете';
  rsContractNotValid = 'Абонент расторг договор';

  rsIniWriteError =
    'Не возможно записать в файл %s.'#13#10'Запустите программу от имени Администратора'#13#10'или отредактируйте файл в ручную.';

  rsDelHouseError = 'Невозможно удалить. В этом доме есть абоненты';
  rsDelSrvError = 'Невозможно удалить. К данной услуге подключены абоненты';
  rsDelPayError = 'Невозможно удалить. Сначала удалите все платежи.';
  rsDownloadFile = 'Загрузить файл из сети Интернет?';
  rsDownloadError = 'Ошибка загрузки файла';

  rsCopy = 'Копировать';
  rsSelectAll = 'Выделить все';
  rsSaveAs = 'Сохранить как ...';
  rsHistoryQuestion = 'Отменить %s для услуги %s?';

  // Отчеты
  rsRepRequestsList = 'Список заявок';
  rsRepRequest = 'АКТ-НАРЯД';
  rsRepHouses = 'Дома';
  rsRepHouseMap = 'Карта дома';
  rsRepPayDocs = 'Печать Платежных Документов';
  rsRepOnTab = 'OnTab';
  rsRepCustomerBalance = 'БалансАбонента';

  // Загрузка профиля
  rsLoaderService = 'Загрузка начислений';
  rsLoaderPayment = 'Загрузка платежей';
  rsLoadProfileError = 'Ошибки в документе № %s , от %s Файл реестра: %s';
  rsLoadProfileResult = 'Обработано %s. Файл %s';
  rsLoadProfileNotDBF = 'Файл не является таблицей DBF';
  rsLoaderProfileDelete = 'Вы желаете удалить профиль загрузки?';

  // Поиск шорткат
  rsFindContract = 'Д';
  rsFindAccount = 'Л';
  rsFindCode = 'К';
  rsFindSurname = 'Ф';
  rsFindNotice = 'П';
  rsFindPhone = 'Т';
  rsFindStreet = 'У';
  rsFindDigit = 'Ц';
  rsFindIP = 'И';
  rsFindIPEng = 'I';
  rsFindMac = 'М';
  rsFindMacEng = 'M';
  rsFindRequest = 'З';
  rsFindTask = 'Ч';
  rsFindJur = 'Ю';

  rsFldMiddleName = '[ОТЧЕСТВО]';
  rsFldSaldo = '[САЛЬДО]';
  rsFldEmail = '[EMAIL]';
  rsFldSecret = '[SECRET]';
  rsFldLastNumber4Flat = '[ПН ДОГОВОРА]';
  rsFldMobile = '[МОБ_ТЕЛЕФОН]';
  rsFldMonth = '[МЕСЯЦ]';
  rsFldCodeAbonent = '[КОД_АБОНЕНТА]';
  rsFldCodeHouse = '[КОД ДОМА]';
  rsFldState = '[СТАТУС_УСЛУГ]';
  rsFldCodeCity = '[КОД Н.ПУНКТ]';
  rsFldCodeArea = '[КОД УЧАСТКА]';
  rsFldCodeStreet = '[КОД УЛИЦЫ]';
  rsFldBalance = '[БАЛАНС]';
  rsFldCurrentDay = '[ДЕНЬ]';
  rsFldCurrentDate = '[ДАТА]';
  rsFldCurrentTime = '[ВРЕМЯ]';
  rsFldCurrentYear = '[ГОД]';
  rsFldDaysOfMonth = '[ДНЕЙ_В_МЕС]';
  rsFldDEBT = '[ДОЛГ]';
  rsFldHouse = '[ДОМ]';
  rsFldFlat = '[КВАРТИРА]';
  rsFldINITIALS = '[ИНИЦИАЛЫ]';
  rsFldFIRSTNAME = '[ИМЯ]';
  rsFldACCOUNT = '[ЛИЦЕВОЙ]';
  rsFldSURNAME = '[ФАМИЛИЯ]';
  rsFldContract = '[ДОГОВОР]';
  rsFldSTREET = '[УЛИЦА]';
  rsFldFULLNAME = '[ФИО]';
  rsFldRecCOUNT = '[КОЛВО_ЗАПИСЕЙ]';
  rsFldTOTAL = '[ИТОГО_ДОЛГ]';
  rsFldTOTAL100 = '[ИТОГО_САЛЬДО]';
  rsFldPASSPORTDATE = '[ПАСПОРТ_ВЫДАН]';
  rsFldPassportN = '[ПАСПОРТ_N]';
  rsFldMonthFee = '[ОПЛАТА_В_МЕСЯЦ]';
  rsFldMonthNeed = '[ДОПЛАТА]';
  rsFldPrevYEAR = '[ПРЕД_ГОД]';
  rsFldPrevMONTH = '[ПРЕД_МЕСЯЦ]';
  rsFldCOUNTER = '[СЧЕТЧИК]';
  rsFldStreetShort = '[СОКР_УЛ]';
  rsFldPAYMENT = '[СУММА]';
  rsFldPAYMENT100 = '[СУММА_В_КОПЕЙКАХ]';
  rsFldPHONE = '[ТЕЛЕФОН]';
  rsFldSRVTYPE = '[ТИП УСЛУГИ]';
  rsFldOperator = '[ОПЕРАТОР]';
  rsFldFileSrv = '[УСЛУГА]';
  rsFldFileOnOffSrv = '[УСЛУГА_П/О]';
  rsFldFileDate = '[ДАТА_УСЛУГИ]';

  rsLanUserEquipment = 'Пользователь оборудования';
  rsLanPasswordEquipment = 'Пароль оборудования';
  rsLanIPEquipment = 'IP оборудования';
  rsLanMACEquipment = 'MAC оборудования(:)';
  rsLanMACEquipmentH = 'MAC оборудования(-)';
  rsLanMACEquipmentD = 'MAC оборудования(.)';
  rsLanMACEquipmentJun = 'MAC оборудования(xxxx.)';
  rsLanIPCustomer = 'IP абонента';
  rsLanMACCustomer = 'MAC абонента(:)';
  rsLanMACCustomerH = 'MAC абонента(-)';
  rsLanMACCustomerD = 'MAC абонента(.)';
  rsLanMACCustomerJun = 'MAC абонента(xxxx.)';
  rsLanPortCustomer = 'Порт абонента';
  rsLanCustomerAccnt = 'Лицевой абонента';
  rsLanCustomerFIO = 'Фио абонента';
  rsLanCustomerAddr = 'Код абонента';
  rsLanVLANCustomer = 'VLAN абонента';
  rsLanTAGCustomer = 'Tag абонента';
  rsLanTAGSTRCustomer = 'TagSTR абонента';
  rsLanTelnetWait = 'wait пауза 1 сек.';

  rsIPAagan = 'IP адрес';
  rsMACAagan = 'MAC адрес';

  rsServerVersion = 'Сервер версия        : %s';
  rsServerBuild = 'Сервер билд          : %s';
  rsServerServicesVersion = 'Версия сервисов      : %d';
  rsServerDatabases = 'Кол-во баз данных    : %d';
  rsServerConnection = 'Кол-во соединений    : %d';
  rsServerCurrentDB = 'Текущая база данных  :';
  rsServerPatchDB = 'Расположение БД               : %s';
  rsServerPatchLockFile = 'Расположение файла блокировок : %s';
  rsServerPatchSecurity = 'Расположение файла паролей    : %s';
  rsServerPatchMessages = 'Расположение файла сообщений  : %s';

  rsNeedPlanRequest = 'Переключитесь на закладку Запланированы.';

  rsQuant = 'Кол-во';
  rsMadDocIn = 'Приход материалов';
  rsMadDocOut = 'Списание материалов';
  rsMadDocInv = 'Инвентаризация материалов';
  rsMadDocMov = 'Перемещение по складам';
  rsMadDocsPrint = 'Печать выделенных документов';
  rsSMSBalance = 'Остаток СМС : %d';

  rsMon = 'Пн';
  rsTue = 'Вт';
  rsWed = 'Ср';
  rsThu = 'Чт';
  rsFri = 'Пт';
  rsSat = 'Сб';
  rsSun = 'Вс';

  rsBlackListLine = 'Лицевой %s долг %s '#13#10'%s д. %s кв. %s '#13#10'телефон %s мобильный %s '#13#10'Статус %s';
  rsBlackListTitle = 'Причина блокировки';
  rsBlackListHint = ' Переменные:'#13#10'Лицевой %s долг %s '#13#10'Улица %s дом %s кв. %s '#13#10'телефон %s мобильный %s '#13#10'Статус %s';

  rsReportMaterialHistory = 'История материала';

  rsPhone = 'Телефон : %s %s';
  rsClmnExternalID = 'Внешний ID';
  rsClmnMobilePhone = 'Телефон моб.';
  rsClmnPhone = 'Телефон';
  rsClmnNotice = 'Примечание';
  rsClmnContract = 'Договор №';
  rsClmnContractDate = 'Дата договора';
  rsClmnFirstConnect = 'Дата перв. подкл.';
  rsClmnAttributes = 'Атрибуты';
  rsClmnServiceRegion = 'Зона обслуживания';
  rsClmnLayout = 'Компоновка';
  rsLayoutNotDefined = 'Нет элементов для редактирования.'#13#10'Отображается компоновка типа узла.';
  rsClmnCircuit = 'Схема';
  rsMonthPay = 'Сумма тарифов';
  rsHeadEnd = 'ГС';
  rsOrg = 'Обсл. орг.';
  rsClmnFiles = 'Файлы';
  rsClmnLink = 'Линии связи';
  rsClmnFlats = 'Квартиры';
  rsClmnValidTo = 'Договор до';
  rsClmnJur = 'Юр. лицо';
  rsClmnEmail = 'Email';
  rsClmnPrepay = 'Об. платеж';
  rsMapLimit = 'Лимит запросов, повторите позже';
  rsMatQuantLess = 'Количество материала меньше чем есть на складе';
  rsFileAct = 'Установить дату обработки файлу %s';
  rsFileActNotice = 'Можно оставить результат обработки файла';

  rsManyCustomerFormCaption = 'Открыто много форм абонентов.';
  rsManyCustomerForm = 'Рекомендуется закрыть ненужные формы.'#13#10'Закрыть все формы абонентов?';
  rsSMScount = 'Символов: %d или %d SMS';

  rsNeedNodeBid = 'Необходима заявка на узел. Создать?';
  rsNodeBid = 'Заявка на узел';
  rsNeedBidExecutor = 'Необходимо указать исполнителя заявки';
  rsNeedContact = 'Необходимо указать контакт абонента';
  rsNeedPassportCheck = 'Необходимо проверить паспорт абонента';
  rsPassportNotValid = 'Паспорт абонента недействителен или не выдавался';
  rsContact = 'Контакт абонента';
  rsTask = 'Задача';
  rsOrderN = 'CЗ:';
  rsNeedChannel = 'Необходимо выбрать канал';
  rsCloseTask = 'Закрыть задачу';
  //rsAdCharCount = 'Символов %d (до %d = %m, более %m)';
  rsAdCharCount = 'Символов %d на %d дня(ей)';
  rsCloseSelectedTask = 'Закрыть все выделенные задачи?';
  rsEmptyOrIncorrect = 'Пустое поле или русский вместо латиницы';
  rsRequiredField = 'Обязательно к заполнению';
  rsRequiredDict = 'Необходимо выбрать из справочника';
  rsCheckWrite = 'Убедитесь в правильности написания';
  rsCheckPassportURL = 'https://apimgw.core.oais.by:8247/mvd-30903-directservice/v1/mvd/passpData?';
  rsEditFromStartNode = 'Редактировать нужно из начального узла';

  rsOn = 'Включить';
  rsOff = 'Отключить';
  rsFree = 'БЕСПЛАТНО';

  rsSetPayDate = 'После внесения оплаты';

  rsVlanHouse = 'VLAN не в зоне обслуживания дома';
  rsIpVlan = 'IP не входит в диапазон адресов VLAN';
  rsWarningQuestStop  = 'Исправить ошибки?';

  ms_CANT_DALETE_PAY_DOC = 'Данный документ удалить нельзя, т.к. он содержит платежи';
  ms_DELETE_PAY_DOC = 'Удалить документ № %s от %s';
  ms_DELETE_ACT = 'Удалить отметку выполнения № %s от %s';
  ms_ADD_NEW_SERVICE = 'Добавление новой услуги';

implementation

end.

