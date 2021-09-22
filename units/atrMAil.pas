unit atrMail;

interface

uses mimemess, mimepart, smtpsend, Classes;

Procedure SendMail (const Host, Subject, pTo, From , TextBody, login,password : string);

Procedure SendMailinHTML(const Host, Subject, pTo, From , HTMLBody, login,password : string);

implementation

Procedure SendMail (const Host, Subject, pTo, From , TextBody, login,password : string);
var Msg : TMimeMess; //собщение
    StringList : TStringList; //содержимое письма
    MIMEPart : TMimePart; //части сообщения (на будущее)
begin
  Msg := TMimeMess.Create; //создаем новое сообщение
  StringList := TStringList.Create;
  try
// Добавляем заголовки
    Msg.Header.Subject := Subject;//тема сообщения
    Msg.Header.From := From; //имя и адрес отправителя
    Msg.Header.ToList.Add(pTo); //имя и адрес получателя
// создаем корневой элемент
    MIMEPart := Msg.AddPartMultipart('alternative', nil);
    StringList.Text := TextBody;
    Msg.AddPartText(StringList, MIMEPart);
// Кодируем и отправляем
    Msg.EncodeMessage;
    smtpsend.SendToRaw(From, pTo, Host, Msg.Lines, login, password);
 finally
   Msg.Free;
   StringList.Free;
 end;
end;

Procedure SendMailinHTML(const Host, Subject, pTo, From , HTMLBody, login,password : string);
var Msg : TMimeMess; //собщение
    StringList : TStringList; //содержимое письма
    MIMEPart : TMimePart; //части сообщения (на будущее)
begin
  Msg := TMimeMess.Create; //создаем новое сообщение
  StringList := TStringList.Create;
  try
// Добавляем заголовки
    Msg.Header.Subject := Subject;//тема сообщения
    Msg.Header.From := From; //имя и адрес отправителя
    Msg.Header.ToList.Add(pTo); //имя и адрес получателя
// создаем корневой элемент
    MIMEPart := Msg.AddPartMultipart('alternative', nil);

    StringList.Text := HTMLBody;
    Msg.AddPartHTML(StringList, MIMEPart);

// Кодируем и отправляем
    Msg.EncodeMessage;
    smtpsend.SendToRaw(From, pTo, Host, Msg.Lines, login, password);
 finally
   Msg.Free;
   StringList.Free;
 end;

end;

end.