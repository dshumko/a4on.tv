unit AtrEhLibAddons;

interface

uses
  DBCtrlsEh, DBLookupEh, EhLibVCL;

procedure DBLookupComboboxEnterAutoDropDown(Sender: TObject);
procedure DBLookupComboboxClickAutoDropDown(Sender: TObject);

implementation

uses
  DM;

procedure DBLookupComboboxEnterAutoDropDown(Sender: TObject);
begin
  if dmMain.GetIniValue('AUTODROPDOWN') <> '1' then
    Exit;

  if not(Sender is TDBLookupComboboxEh) then
    Exit;

  if not(Sender as TDBLookupComboboxEh).ListVisible then
  begin
    (Sender as TDBLookupComboboxEh).DropDown;
    (Sender as TDBLookupComboboxEh).Tag := 1;
  end;
end;

procedure DBLookupComboboxClickAutoDropDown(Sender: TObject);
begin
  if dmMain.GetIniValue('AUTODROPDOWN') <> '1' then
    Exit;

  if not(Sender is TDBLookupComboboxEh) then
    Exit;

  if (Sender as TDBLookupComboboxEh).Tag = 0 then
  begin
    if not(Sender as TDBLookupComboboxEh).ListVisible then
      (Sender as TDBLookupComboboxEh).DropDown
    else
      (Sender as TDBLookupComboboxEh).CloseUp(False);
  end;

  if (Sender as TDBLookupComboboxEh).Tag = 1 then
    (Sender as TDBLookupComboboxEh).Tag := 0
  else
    (Sender as TDBLookupComboboxEh).Tag := 1;
end;

end.
