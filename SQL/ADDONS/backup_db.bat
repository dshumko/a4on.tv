@ECHO OFF
SETLOCAL EnableExtensions DisableDelayedExpansion

REM Путь для хранения архива резервной копии БД 
SET BACKUP_PATH=D:\A4ON.BACKUP\
SET DB=A4ON_DB
set PASS=masterkey
set FB_PATH=C:\Program Files\Firebird\Firebird_3_0\
set GBAK="%FB_PATH%gbak.exe" -se localhost:service_mgr -USER SYSDBA -PASSWORD %PASS%
SET GFIX="%FB_PATH%gfix.exe" -user SYSDBA -password %PASS% -sweep
set ARC="C:\Program Files\7-zip\7z.exe" a -sdel


rem Имя файла как текущий день
set day=%DATE:~0,2%
set month=%DATE:~3,2%
set year=%DATE:~6,4%
set hour=%TIME:~0,2%
set minute=%TIME:~3,2%
set second=%TIME:~6,2%
rem set ARC_DATE=%year%%month%%day%
rem set ARC_DATE=%year%%month%
for /F "tokens=1,*" %%G in ('
          wmic path win32_localtime get dayofweek ^| findstr [0-9]
          ') do (

    set "_dayofweek=%%G"
)
set weekday=%_dayofweek%

set BACK_NAME=a4on_db_%weekday%

REM Создание резервной копии БД 
%GBAK% -b -g %DB% "%BACKUP_PATH%%BACK_NAME%.FBK"
IF ERRORLEVEL == 1 GOTO GBAK_ERROR 

rem сбор муссора
%GFIX% localhost:%DB%

REM Создание резервной копии БД без блобов / храним каждый месяц
SET BACKUP_PATH=%BACKUP_PATH%WithOutBlob\
set BACK_NAME=a4on_wb_%year%_%month%
%GBAK% -b -g -skip_d customer_files %DB% "%BACKUP_PATH%%BACK_NAME%.FBK"
%ARC% "%BACKUP_PATH%%BACK_NAME%.7z" "%BACKUP_PATH%%BACK_NAME%.FBK"

EXIT

:GBAK_ERROR 
echo Error backup create.

