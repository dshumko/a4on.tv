unit A4onTypeUnit;

interface

uses
  Winapi.Windows,
  System.SysUtils, System.Classes, System.Types, System.Generics.Collections;

type

  TCustomerInfo = record
    CUSTOMER_ID: Integer;
    FIO: String;
    STREET_ID: Integer;
    STREET: String;
    HOUSE_ID: Integer;
    HOUSE_no: String;
    FLAT_NO: String;
    cust_code: String;
    Account_No: String;
    CUST_STATE_DESCR: String;
    Debt_sum: Currency;
    phone_no: String;
    notice: String;
    color: string;
    porch_n: string;
    floor_n: string;
    mobile: string;
    mobile_wn: String;
    email: String;
    itBalance: Boolean;
    isType: Integer; // 0 - абонент, 1 - узел
    isJur : Integer; // 0 - физик 1 - юрик
    INN : String;
    City: string;
  end;

  TAlertItem = record
    title: String;
    text: String;
    Color: String;
    FrameColor: String;
    Tag: NativeInt;
  end;

  TContact = Record
    cID: Integer;
    cType: String;
    Contact: String;
    Notice: String;
    Notify: Integer;
    CustID: Integer;
  End;

  TEquipmentRecord = record
    ID: Integer;
    TypeID: Integer;
    Name: String;
    TypeName: String;
    Notice: String;
    IP: String;
    MAC: String;
    Node_Id : Integer;
  end;

  TFlat = record
    flat_no: string;
    flat_id: integer;
    customer_id: integer;
    Debt_SUM: Currency;
    customer_info: string;
  end;

  TFloor = record
    floor_id: integer;
    floor_n: string;
    // porch_id  : Integer;
    // porch_n   : string;
    flats_n: string;
    flats_cnt: integer;
    flats: array of TFlat;
  end;

  TPorch = record
    porch_id: integer;
    porch_n: string;
    floor_cnt: integer;
    garret: boolean;
    cellar: boolean;
    floors: array of TFloor;
  end;

  TCheckResult = packed record
    CheckN: Integer;
    Summa: Integer;
    Peni: Integer;
    PayType: Integer; // String;
    Notify: PWCHAR; // string;
  end;

  TStrCheckResult = packed record
    CheckN: PWCHAR;
    Summa: Integer;
    Peni: Integer;
    PayType: Integer; // String;
    Notify: PWCHAR; // string;
  end;

  TPrintCheckResult = record
    CheckN: String;
    Summa: Integer;
    Peni: Integer;
    PayType: Integer; // String;
    Notify: String; // string;
  end;

  TNodeLayoutItem = record
    M_TYPE: Integer;
    Name: string;
    NODE_ID: Integer;
    quant: Double;
    notice: string;
  end;

  TNodeLinkItem = record
    LINK_ID: Integer;
    NODE_ID: Integer;
    NODE_Name: string;
    NODE_TYPE: string;
  end;

  TAttribute = record
    TYPE_ID: Integer;
    OBJECT_ID: Integer;
    ATTR_ID: Integer;
    Name: String;
    Value: String;
    Notice: String;
  end;

  TCountry = (cRU, cBY, cUA);

  TSMS = record
    a4ID: Integer;
    smsID: Integer;
    phone: string;
    Text: string;
    date: TDateTime;
    status: Integer;
  end;

  TSMSList = TList<TSMS>;

implementation

end.
