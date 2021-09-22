unit A4onTypeUnit;

interface

uses
  SysUtils, Classes;

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
    itBalance: Boolean;
    isType: Integer; // 0 - абонент, 1 - узел
    isJur : Integer; // 0 - физик 1 - юрик
    INN : String;
  end;

  TAlertItem = record
    title: String;
    text: String;
    Color: String;
    FrameColor: String;
    Tag: NativeInt;
  end;

implementation

end.
