execute ibeblock as
begin
  FBSrc = ibec_CreateConnection(__ctFirebird, 'DBName="localhost:a4on";ClientLib=fbclient.dll;user=SYSDBA; password=masterkey; names=UTF8; sqldialect=3');
  ibec_UseConnection(FBSrc);
  DIR = 'B:\_FILES_\';
  for
    select customer_id, Filename, Content
    from Customer_Files
    into :customer_id, :Filename, :Content
  do
    ibec_SaveToFile(DIR || customer_id||'_'||Filename, Content, __stfOverwrite);

  ibec_CloseConnection(FBSrc);
end
