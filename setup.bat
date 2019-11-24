@set @dummy=0/*
@echo off

NET FILE 1>NUL 2>NUL
if "%ERRORLEVEL%" neq "0" (
  cscript //nologo //E:JScript "%~f0" %*
  exit /b %ERRORLEVEL%
)

set RUN="\"%~dp0unzip.exe\" \"%%1\""

reg add HKEY_CLASSES_ROOT\*\shell\unzip\command /t REG_SZ /d %RUN% /f
reg add HKEY_CLASSES_ROOT\Folder\shell\unzip\command /t REG_SZ /d %RUN% /f

goto :EOF
*/
var cmd = '"/c ""' + WScript.ScriptFullName + '" ';
for (var i = 0; i < WScript.Arguments.Length; i++) cmd += '"' + WScript.Arguments(i) + '" ';
(new ActiveXObject('Shell.Application')).ShellExecute('cmd.exe', cmd + ' "', '', 'runas', 1);
