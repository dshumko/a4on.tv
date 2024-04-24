update objects o set o.O_Datefield = o.O_Datefiled where o.O_Datefield is null and not o.O_Datefiled is null;
commit;