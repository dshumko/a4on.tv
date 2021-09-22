[Code]
{===============================================================================}
{ Script name: ConvertString.iss                                                }
{ Script version: 1.1                                                           }
{ Author: Serega, http://forum.oszone.net/member.php?userid=88670               }
{                                                                               }
{ Include this file in project.                                                 }
{ Example:                                                                      }
{ #include "ConvertString.iss"                                                  }
{===============================================================================}
{ Rev 1.1  26.03.2011 22:36:43                                                  }
{   - fixed error is corrected at compilation on the expanded                   }
{     version from Restools;                                                    }
{   - function ClearBom is optimised.                                           }
{ Rev 1.0  25.03.2011 18:58:04 Create                                           }
{===============================================================================}
{                         Supported functions                                   }
{===============================================================================}
{   ANSI ->                                                                     }
{ function AnsiToUtf8(const SourceStr: string): string;                         }
{ function AnsiToUtf7(const SourceStr: string): string;                         }
{ function AnsiToUtf16(const SourceStr: string): string;                        }
{ function AnsiToDos(const SourceStr: string): string;                          }
{ function AnsiToKoi(const SourceStr: string): string;                          }
{ function AnsiToIso(const SourceStr: string): string;                          }
{ function AnsiToMac(const SourceStr: string): string;                          }
{   UTF-7 ->                                                                    }
{ function Utf7ToAnsi(const SourceStr: string): string;                         }
{ function Utf7ToUtf8(const SourceStr: string): string;                         }
{ function Utf7ToUtf16(const SourceStr: string): string;                        }
{ function Utf7ToDos(const SourceStr: string): string;                          }
{ function Utf7ToKoi(const SourceStr: string): string;                          }
{ function Utf7ToIso(const SourceStr: string): string;                          }
{ function Utf7ToMac(const SourceStr: string): string;                          }
{   UTF-8 ->                                                                    }
{ function Utf8ToAnsi(const SourceStr: string): string;                         }
{ function Utf8ToUtf7(const SourceStr: string): string;                         }
{ function Utf8ToUtf16(const SourceStr: string): string;                        }
{ function Utf8ToDos(const SourceStr: string): string;                          }
{ function Utf8ToKoi(const SourceStr: string): string;                          }
{ function Utf8ToIso(const SourceStr: string): string;                          }
{ function Utf8ToMac(const SourceStr: string): string;                          }
{   UTF-16 (Unicode) ->                                                         }
{ function Utf16ToAnsi(const SourceStr: string): string;                        }
{ function Utf16ToUtf7(const SourceStr: string): string;                        }
{ function Utf16ToUtf8(const SourceStr: string): string;                        }
{ function Utf16ToDos(const SourceStr: string): string;                         }
{ function Utf16ToKoi(const SourceStr: string): string;                         }
{ function Utf16ToIso(const SourceStr: string): string;                         }
{ function Utf16ToMac(const SourceStr: string): string;                         }
{   DOS (cp866) ->                                                              }
{ function DosToAnsi(const SourceStr: string): string;                          }
{ function DosToUtf7(const SourceStr: string): string;                          }
{ function DosToUtf8(const SourceStr: string): string;                          }
{ function DosToUtf16(const SourceStr: string): string;                         }
{ function DosToKoi(const SourceStr: string): string;                           }
{ function DosToIso(const SourceStr: string): string;                           }
{ function DosToMac(const SourceStr: string): string;                           }
{   KOI (KOI-8) ->                                                              }
{ function KoiToAnsi(const SourceStr: string): string;                          }
{ function KoiToUtf7(const SourceStr: string): string;                          }
{ function KoiToUtf8(const SourceStr: string): string;                          }
{ function KoiToUtf16(const SourceStr: string): string;                         }
{ function KoiToDos(const SourceStr: string): string;                           }
{ function KoiToIso(const SourceStr: string): string;                           }
{ function KoiToMac(const SourceStr: string): string;                           }
{   ISO (iso-8859) ->                                                           }
{ function IsoToAnsi(const SourceStr: string): string;                          }
{ function IsoToUtf7(const SourceStr: string): string;                          }
{ function IsoToUtf8(const SourceStr: string): string;                          }
{ function IsoToUtf16(const SourceStr: string): string;                         }
{ function IsoToDos(const SourceStr: string): string;                           }
{ function IsoToKoi(const SourceStr: string): string;                           }
{ function IsoToMac(const SourceStr: string): string;                           }
{   MAC ->                                                                      }
{ function MacToAnsi(const SourceStr: string): string;                          }
{ function MacToUtf7(const SourceStr: string): string;                          }
{ function MacToUtf8(const SourceStr: string): string;                          }
{ function MacToUtf16(const SourceStr: string): string;                         }
{ function MacToDos(const SourceStr: string): string;                           }
{ function MacToKoi(const SourceStr: string): string;                           }
{ function MacToIso(const SourceStr: string): string;                           }
{===============================================================================}
{===============================================================================}
#if Ver < 84084736
type
  PAnsiChar = PChar;  // Required for Inno Setup 5.3.0 and lower
#endif

const
  Utf8Bom   = #$EF#$BB#$BF;
  Utf16Bom  = #$FF#$FE;

  CP_ACP    = 0;             { default to ANSI code page }
  CP_OEMCP  = 1;             { default to OEM  code page }
  CP_MACCP  = 2;             { default to MAC  code page }
  CP_UTF16  = 1200;          { UTF-16 translation }
  CP_ISO    = 28595;         { iso-8859-5 translation }
  CP_KOI8   = 20866;         { KOI-8 translation }
  CP_UTF7   = 65000;         { UTF-7 translation }
  CP_UTF8   = 65001;         { UTF-8 translation }

function MultiByteToWideChar(CodePage: UINT; dwFlags: DWORD;
  lpMultiByteStr: PAnsiChar; cbMultiByte: Integer;
  lpWideCharStr: PAnsiChar; cchWideChar: Integer): Longint; external 'MultiByteToWideChar@kernel32.dll stdcall';
function WideCharToMultiByte(CodePage: UINT; dwFlags: DWORD;
  lpWideCharStr: PAnsiChar; cchWideChar: Integer; lpMultiByteStr: PAnsiChar;
  cbMultiByte: Integer; lpDefaultChar: Integer; lpUsedDefaultChar: Integer): Longint;
    external 'WideCharToMultiByte@kernel32.dll stdcall';

function WideStringToString(const wStr: string; codePage: Word): string;
var
  len: Integer;
begin
  len := WideCharToMultiByte(codePage, 0, wStr, -1, '', 0, 0, 0);
  if len > 0 then
    begin
      SetLength(Result, len-1);
      WideCharToMultiByte(codePage, 0, wStr, -1, Result, Length(Result), 0, 0);
    end;
end;

function StringToWideString(const aStr: string; codePage: Word): string;
var
  len: Integer;
begin
  len := MultiByteToWideChar(codePage, 0, aStr, -1, '', 0);
  if len > 0 then
    begin
      SetLength(Result, (len*2)-2);
      MultiByteToWideChar(codePage, 0, aStr, -1, Result, Length(Result));
    end;
end;

function ClearBom(const s, sig: string): string;
var
  i, n, len: Integer;
begin
  Result := s;
  len := Length(sig);
  n := 0;
  if (len > 0) and (Length(Result) > len) then
    repeat
      for i := 1 to len do
        if Result[1] = sig[i] then
          begin
            Delete(Result, 1, 1);
            Break;
          end;
      n := n + 1;
    until (n = len) or (Result = '');
end;
{===============================================================================}
{===============================================================================}
{   ANSI ->                                                                     }
{===============================================================================}
function AnsiToUtf8(const SourceStr: string): string;
begin
  Result := Utf8Bom + WideStringToString(StringToWideString(SourceStr, CP_ACP), CP_UTF8);
end;

function AnsiToUtf7(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_ACP), CP_UTF7);
end;

function AnsiToUtf16(const SourceStr: string): string;
begin
  Result := Utf16Bom + StringToWideString(SourceStr, CP_ACP);
end;

function AnsiToDos(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_ACP), CP_OEMCP);
end;

function AnsiToKoi(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_ACP), CP_KOI8);
end;

function AnsiToIso(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_ACP), CP_ISO);
end;

function AnsiToMac(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_ACP), CP_MACCP);
end;
{===============================================================================}
{   UTF-7 ->                                                                    }
{===============================================================================}
function Utf7ToAnsi(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_UTF7), CP_ACP);
end;

function Utf7ToUtf8(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_UTF7), CP_UTF8);
end;

function Utf7ToUtf16(const SourceStr: string): string;
begin
  Result := StringToWideString(SourceStr, CP_UTF7);
end;

function Utf7ToDos(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_UTF7), CP_OEMCP);
end;

function Utf7ToKoi(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_UTF7), CP_KOI8);
end;

function Utf7ToIso(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_UTF7), CP_ISO);
end;

function Utf7ToMac(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_UTF7), CP_MACCP);
end;
{===============================================================================}
{   UTF-8 ->                                                                    }
{===============================================================================}
function ConvertUtf8(const SourceStr: string; codePage: Word): string;
var
  wStr: string;
begin
  try
    wStr := ClearBom(SourceStr, Utf8Bom);
    Result := WideStringToString(StringToWideString(wStr, CP_UTF8), codePage);
  finally
    SetLength(wStr, 0);
  end;
end;

function Utf8ToAnsi(const SourceStr: string): string;
begin
  Result := ConvertUtf8(SourceStr, CP_ACP);
end;

function Utf8ToUtf7(const SourceStr: string): string;
begin
  Result := ConvertUtf8(SourceStr, CP_UTF7);
end;

function Utf8ToUtf16(const SourceStr: string): string;
begin
  Result := StringToWideString(SourceStr, CP_UTF8);
end;

function Utf8ToDos(const SourceStr: string): string;
begin
  Result := ConvertUtf8(SourceStr, CP_OEMCP);
end;

function Utf8ToKoi(const SourceStr: string): string;
begin
  Result := ConvertUtf8(SourceStr, CP_KOI8);
end;

function Utf8ToIso(const SourceStr: string): string;
begin
  Result := ConvertUtf8(SourceStr, CP_ISO);
end;

function Utf8ToMac(const SourceStr: string): string;
begin
  Result := ConvertUtf8(SourceStr, CP_MACCP);
end;
{===============================================================================}
{   UTF-16 (Unicode) ->                                                         }
{===============================================================================}
function ConvertUtf16(const SourceStr: string; codePage: Word): string;
var
  wStr: string;
begin
  try
    wStr := ClearBom(SourceStr, Utf16Bom);
    Result := WideStringToString(wStr, codePage);
  finally
    SetLength(wStr, 0);
  end;
end;

function Utf16ToAnsi(const SourceStr: string): string;
begin
  Result := ConvertUtf16(SourceStr, CP_ACP);
end;

function Utf16ToUtf7(const SourceStr: string): string;
begin
  Result := ConvertUtf16(SourceStr, CP_UTF7);
end;

function Utf16ToUtf8(const SourceStr: string): string;
begin
  Result := Utf8Bom + ConvertUtf16(SourceStr, CP_UTF8);
end;

function Utf16ToDos(const SourceStr: string): string;
begin
  Result := ConvertUtf16(SourceStr, CP_OEMCP);
end;

function Utf16ToKoi(const SourceStr: string): string;
begin
  Result := ConvertUtf16(SourceStr, CP_KOI8);
end;

function Utf16ToIso(const SourceStr: string): string;
begin
  Result := ConvertUtf16(SourceStr, CP_ISO);
end;

function Utf16ToMac(const SourceStr: string): string;
begin
  Result := ConvertUtf16(SourceStr, CP_MACCP);
end;
{===============================================================================}
{   DOS (cp866) ->                                                              }
{===============================================================================}
function DosToAnsi(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_OEMCP), CP_ACP);
end;

function DosToUtf7(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_OEMCP), CP_UTF7);
end;

function DosToUtf8(const SourceStr: string): string;
begin
  Result := Utf8Bom + WideStringToString(StringToWideString(SourceStr, CP_OEMCP), CP_UTF8);
end;

function DosToUtf16(const SourceStr: string): string;
begin
  Result := Utf16Bom + StringToWideString(SourceStr, CP_OEMCP);
end;

function DosToKoi(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_OEMCP), CP_KOI8);
end;

function DosToIso(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_OEMCP), CP_ISO);
end;

function DosToMac(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_OEMCP), CP_MACCP);
end;
{===============================================================================}
{   KOI (KOI-8) ->                                                              }
{===============================================================================}
function KoiToAnsi(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_KOI8), CP_ACP);
end;

function KoiToUtf7(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_KOI8), CP_UTF7);
end;

function KoiToUtf8(const SourceStr: string): string;
begin
  Result := Utf8Bom + WideStringToString(StringToWideString(SourceStr, CP_KOI8), CP_UTF8);
end;

function KoiToUtf16(const SourceStr: string): string;
begin
  Result := Utf16Bom + StringToWideString(SourceStr, CP_KOI8);
end;

function KoiToDos(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_KOI8), CP_OEMCP);
end;

function KoiToIso(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_KOI8), CP_ISO);
end;

function KoiToMac(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_KOI8), CP_MACCP);
end;
{===============================================================================}
{   ISO (iso-8859) ->                                                           }
{===============================================================================}
function IsoToAnsi(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_ISO), CP_ACP);
end;

function IsoToUtf7(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_ISO), CP_UTF7);
end;

function IsoToUtf8(const SourceStr: string): string;
begin
  Result := Utf8Bom + WideStringToString(StringToWideString(SourceStr, CP_ISO), CP_UTF8);
end;

function IsoToUtf16(const SourceStr: string): string;
begin
  Result := Utf16Bom + StringToWideString(SourceStr, CP_ISO);
end;

function IsoToDos(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_ISO), CP_OEMCP);
end;

function IsoToKoi(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_ISO), CP_KOI8);
end;

function IsoToMac(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_ISO), CP_MACCP);
end;
{===============================================================================}
{   MAC ->                                                                      }
{===============================================================================}
function MacToAnsi(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_MACCP), CP_ACP);
end;

function MacToUtf7(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_MACCP), CP_UTF7);
end;

function MacToUtf8(const SourceStr: string): string;
begin
  Result := Utf8Bom + WideStringToString(StringToWideString(SourceStr, CP_MACCP), CP_UTF8);
end;

function MacToUtf16(const SourceStr: string): string;
begin
  Result := Utf16Bom + StringToWideString(SourceStr, CP_MACCP);
end;

function MacToDos(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_MACCP), CP_OEMCP);
end;

function MacToKoi(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_MACCP), CP_KOI8);
end;

function MacToIso(const SourceStr: string): string;
begin
  Result := WideStringToString(StringToWideString(SourceStr, CP_MACCP), CP_ISO);
end;
{===============================================================================}