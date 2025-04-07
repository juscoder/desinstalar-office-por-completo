@echo off
title Limpieza Profunda de Microsoft Office
color 0A
setlocal enabledelayedexpansion

:MENU
cls
echo ============================================
echo        LIMPIEZA COMPLETA DE OFFICE
echo ============================================
echo.
echo  [1] Iniciar limpieza profunda de Office
echo  [2] Ver rutas que seran eliminadas
echo  [0] Salir
echo.
set /p opc=Seleccione una opcion:

if "%opc%"=="1" goto CONFIRMAR
if "%opc%"=="2" goto MOSTRAR_RUTAS
if "%opc%"=="0" exit
goto MENU

:CONFIRMAR
cls
echo Esta a punto de eliminar completamente los rastros de Microsoft Office.
echo Esto incluye archivos, carpetas y entradas de registro.
echo.
set /p confirm=Desea continuar? (S/N): 
if /i "%confirm%"=="S" goto LIMPIEZA
goto MENU

:MOSTRAR_RUTAS
cls
echo Las siguientes rutas seran limpiadas:
echo --------------------------------------------
echo C:\Program Files\Microsoft Office
echo C:\Program Files (x86)\Microsoft Office
echo C:\Program Files\Common Files\Microsoft Shared\Office15
echo C:\Program Files\Common Files\Microsoft Shared\Office16
echo C:\ProgramData\Microsoft\Office
echo %APPDATA%\Microsoft\Office
echo %LOCALAPPDATA%\Microsoft\Office
echo %TEMP%
echo.
echo Registro:
echo HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office
echo HKEY_CURRENT_USER\Software\Microsoft\Office
echo HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClickToRunSvc
echo.
pause
goto MENU

:LIMPIEZA
cls
echo Iniciando limpieza...
timeout /t 2 >nul

:: Eliminar carpetas principales de Office
rd /s /q "C:\Program Files\Microsoft Office"
rd /s /q "C:\Program Files (x86)\Microsoft Office"
rd /s /q "C:\ProgramData\Microsoft\Office"

:: Eliminar subcarpetas de Microsoft Shared (solo las de Office)
rd /s /q "C:\Program Files\Common Files\Microsoft Shared\Office15"
rd /s /q "C:\Program Files\Common Files\Microsoft Shared\Office16"

:: Eliminar carpetas de usuario
rd /s /q "%APPDATA%\Microsoft\Office"
rd /s /q "%LOCALAPPDATA%\Microsoft\Office"
del /q /f "%TEMP%\*" >nul 2>&1

:: Eliminar claves de registro
reg delete "HKLM\SOFTWARE\Microsoft\Office" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Office" /f >nul 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\ClickToRunSvc" /f >nul 2>&1

:: Eliminar tareas programadas relacionadas con Office
for /f "tokens=*" %%i in ('schtasks /query /fo LIST ^| findstr /i "Office"') do (
  schtasks /delete /tn "%%i" /f >nul 2>&1
)

echo.
echo Limpieza completada con exito.
pause
goto MENU
