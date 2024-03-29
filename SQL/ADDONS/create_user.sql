﻿CREATE ROLE ROLE_A4USER;


CREATE OR ALTER USER USER_NAME PASSWORD 'masterkey' ACTIVE USING PLUGIN Legacy_UserManager;
CREATE OR ALTER USER USER_NAME PASSWORD 'masterkey' ACTIVE USING PLUGIN Srp;
GRANT ROLE_A4USER TO USER USER_NAME;

-- ALTER USER USER_NAME PASSWORD 'user_pswd' ACTIVE USING PLUGIN Legacy_UserManager;
-- ALTER USER USER_NAME PASSWORD 'user_pswd' ACTIVE USING PLUGIN Srp;

commit;



select
'CREATE OR ALTER USER '||Ibname||' PASSWORD ''tv'||Ibname||''' ACTIVE USING PLUGIN Legacy_UserManager; '||
'CREATE OR ALTER USER '||Ibname||' PASSWORD ''tv'||Ibname||''' ACTIVE USING PLUGIN Srp; '||
'GRANT ROLE_A4USER TO USER '||Ibname||'; '
from Sys$User
where Lockedout = 0


execute block returns (SQL varchar(4096))
as
declare variable Ibname varchar(128);
begin
  for select Ibname from Sys$User where Lockedout = 0 into :Ibname
  do begin
    SQL = 'CREATE OR ALTER USER ' || Ibname || ' PASSWORD ''tv' || Ibname || ''' ACTIVE USING PLUGIN Legacy_UserManager;';
    suspend;
    SQL = 'CREATE OR ALTER USER ' || Ibname || ' PASSWORD ''tv' || Ibname || ''' ACTIVE USING PLUGIN Srp;';
    suspend;
    SQL = 'GRANT ROLE_A4USER TO USER ' || Ibname || ';';
    suspend;
  end
end