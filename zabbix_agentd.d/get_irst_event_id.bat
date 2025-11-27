@echo off
setlocal

rem --- check IAStorDataMgrSvc running ---
sc query IAStorDataM2grSvc | find /i "RUNNING" >nul
if errorlevel 1 (
    echo 1
    exit /b 1
)

rem --- get newest event ---
for /f "tokens=3" %%i in ('wevtutil qe Application /c:1 /rd:true /f:text /q:"*[System[Provider[@Name='IAStorDataMgrSvc']]]" ^| find "Event ID:"') do set EID=%%i

if "%EID%"=="" (
    echo 255
    exit /b 255
)

if "%EID%"=="7209" (
    echo 2
    exit /b 2
)

if "%EID%"=="7223" (
    echo 0
    exit /b 0
)

if "%EID%"=="0" (
    echo 255
    exit /b 255
)

if "%EID%"=="7303" (
    echo 255
    exit /b 255
)

echo 3
exit /b 3
