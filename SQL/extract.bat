set LOG_DIR=D:\PROJECTS\a4on.tv\Sources\SQL
del /Q %LOG_DIR%\db.isql.sql
D:\SUBD\Firebird\30X\isql localhost:A4ON_DB -o %LOG_DIR%\db.isql.sql -x -u SYSDBA -p masterkey -ch UTF8
D:\SUBD\Firebird\IBExpert\IBEScript.exe %LOG_DIR%\extract.ibeblock

D:\Develop\PHP\7.x\php.exe -f D:\Projects\A4on.TV\Sources\not_in_git\get_version.php > D:\Projects\A4on.TV\Sources\version.txt