@echo off
title Apple Services Manager v2.0
color 0A

:: Check for admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo ========================================
    echo  ADMINISTRATOR RIGHTS REQUIRED
    echo ========================================
    echo.
    echo Please right-click and select:
    echo "Run as Administrator"
    echo.
    pause
    exit
)

:menu
cls
echo ========================================
echo    APPLE SERVICES MANAGER v2.0
echo ========================================
echo.
echo  [1] START Services
echo  [2] STOP Services
echo  [3] CHECK Status
echo  [4] RESTART Services
echo  [5] EXIT
echo.
echo ========================================
set /p choice="Select option (1-5): "

if "%choice%"=="1" goto start
if "%choice%"=="2" goto stop
if "%choice%"=="3" goto status
if "%choice%"=="4" goto restart
if "%choice%"=="5" goto exit
echo Invalid choice. Please try again.
timeout /t 2 >nul
goto menu

:start
cls
echo ========================================
echo  STARTING SERVICES
echo ========================================
echo.

net start "Apple Mobile Device Service" >nul 2>&1
if %errorlevel%==0 (echo [OK] Apple Mobile Device Service) else (echo [FAIL] Apple Mobile Device Service)

net start "Bonjour Service" >nul 2>&1
if %errorlevel%==0 (echo [OK] Bonjour Service) else (echo [FAIL] Bonjour Service)

net start "iPod Service" >nul 2>&1
if %errorlevel%==0 (echo [OK] iPod Service) else (echo [FAIL] iPod Service)

net start "Apple Mobile Device Helper" >nul 2>&1
if %errorlevel%==0 (echo [OK] Apple Mobile Device Helper) else (echo [FAIL] Apple Mobile Device Helper)

net start "iCloud Services" >nul 2>&1
if %errorlevel%==0 (echo [OK] iCloud Services) else (echo [FAIL] iCloud Services)

net start "APSDaemon" >nul 2>&1
if %errorlevel%==0 (echo [OK] APSDaemon) else (echo [FAIL] APSDaemon)

echo.
echo ========================================
echo  OPERATION COMPLETE
echo ========================================
pause
goto menu

:stop
cls
echo ========================================
echo  STOPPING SERVICES
echo ========================================
echo.

net stop "Apple Mobile Device Service" /y >nul 2>&1
if %errorlevel%==0 (echo [OK] Apple Mobile Device Service) else (echo [FAIL] Apple Mobile Device Service)

net stop "Bonjour Service" /y >nul 2>&1
if %errorlevel%==0 (echo [OK] Bonjour Service) else (echo [FAIL] Bonjour Service)

net stop "iPod Service" /y >nul 2>&1
if %errorlevel%==0 (echo [OK] iPod Service) else (echo [FAIL] iPod Service)

net stop "Apple Mobile Device Helper" /y >nul 2>&1
if %errorlevel%==0 (echo [OK] Apple Mobile Device Helper) else (echo [FAIL] Apple Mobile Device Helper)

net stop "iCloud Services" /y >nul 2>&1
if %errorlevel%==0 (echo [OK] iCloud Services) else (echo [FAIL] iCloud Services)

net stop "APSDaemon" /y >nul 2>&1
if %errorlevel%==0 (echo [OK] APSDaemon) else (echo [FAIL] APSDaemon)

echo.
echo ========================================
echo  OPERATION COMPLETE
echo ========================================
pause
goto menu

:status
cls
echo ========================================
echo  SERVICE STATUS
echo ========================================
echo.

sc query "Apple Mobile Device Service" | find "RUNNING" >nul 2>&1
if %errorlevel%==0 (echo [RUNNING] Apple Mobile Device Service) else (echo [STOPPED] Apple Mobile Device Service)

sc query "Bonjour Service" | find "RUNNING" >nul 2>&1
if %errorlevel%==0 (echo [RUNNING] Bonjour Service) else (echo [STOPPED] Bonjour Service)

sc query "iPod Service" | find "RUNNING" >nul 2>&1
if %errorlevel%==0 (echo [RUNNING] iPod Service) else (echo [STOPPED] iPod Service)

sc query "Apple Mobile Device Helper" | find "RUNNING" >nul 2>&1
if %errorlevel%==0 (echo [RUNNING] Apple Mobile Device Helper) else (echo [STOPPED] Apple Mobile Device Helper)

sc query "iCloud Services" | find "RUNNING" >nul 2>&1
if %errorlevel%==0 (echo [RUNNING] iCloud Services) else (echo [STOPPED] iCloud Services)

sc query "APSDaemon" | find "RUNNING" >nul 2>&1
if %errorlevel%==0 (echo [RUNNING] APSDaemon) else (echo [STOPPED] APSDaemon)

echo.
echo ========================================
pause
goto menu

:restart
cls
echo ========================================
echo  RESTARTING SERVICES
echo ========================================
echo.
echo Stopping services...
net stop "Apple Mobile Device Service" /y >nul 2>&1
net stop "Bonjour Service" /y >nul 2>&1
net stop "iPod Service" /y >nul 2>&1
net stop "Apple Mobile Device Helper" /y >nul 2>&1
net stop "iCloud Services" /y >nul 2>&1
net stop "APSDaemon" /y >nul 2>&1
timeout /t 2 >nul
echo.
echo Starting services...
net start "Apple Mobile Device Service" >nul 2>&1
if %errorlevel%==0 (echo [OK] Apple Mobile Device Service) else (echo [FAIL] Apple Mobile Device Service)

net start "Bonjour Service" >nul 2>&1
if %errorlevel%==0 (echo [OK] Bonjour Service) else (echo [FAIL] Bonjour Service)

net start "iPod Service" >nul 2>&1
if %errorlevel%==0 (echo [OK] iPod Service) else (echo [FAIL] iPod Service)

net start "Apple Mobile Device Helper" >nul 2>&1
if %errorlevel%==0 (echo [OK] Apple Mobile Device Helper) else (echo [FAIL] Apple Mobile Device Helper)

net start "iCloud Services" >nul 2>&1
if %errorlevel%==0 (echo [OK] iCloud Services) else (echo [FAIL] iCloud Services)

net start "APSDaemon" >nul 2>&1
if %errorlevel%==0 (echo [OK] APSDaemon) else (echo [FAIL] APSDaemon)

echo.
echo ========================================
echo  OPERATION COMPLETE
echo ========================================
pause
goto menu

:exit
cls
exit