@echo off
rem Lists the open revision marks in the thesis sources.
rem Convention in REVISIONI.md:  % CV:  % CV?:  % CV-CUT:  % CV+:
setlocal enabledelayedexpansion
cd /d "%~dp0"

echo.
echo ================= DA FARE  (%% CV:) =================
findstr /s /n /c:"%% CV:" *.tex 2>nul

echo.
echo ================= DOMANDE  (%% CV?:) ================
findstr /s /n /c:"%% CV?:" *.tex 2>nul

echo.
echo ================= DA TOGLIERE  (%% CV-CUT:) =========
findstr /s /n /c:"%% CV-CUT:" *.tex 2>nul

echo.
echo ================= DA APPROFONDIRE  (%% CV+:) ========
findstr /s /n /c:"%% CV+:" *.tex 2>nul

echo.
echo ================= note tecniche lasciate da Claude ==
findstr /s /n /c:"%% NOTE:" *.tex 2>nul

echo.
endlocal
