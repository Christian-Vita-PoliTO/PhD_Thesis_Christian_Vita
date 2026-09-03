@echo off
rem Builds the thesis PDF locally with MiKTeX (per-user install).
rem Usage: double-click, or run `build.cmd` from a terminal in this folder.
setlocal
set "PATH=%LOCALAPPDATA%\Programs\MiKTeX\miktex\bin\x64;%PATH%"
set "MAIN=Polito PhD thesis template"

pdflatex -interaction=nonstopmode -synctex=1 "%MAIN%.tex"
if errorlevel 1 goto :error

rem bibtex: with \include the \citation lines live in the chapter .aux files,
rem so run it unconditionally; the "no citation commands" error is harmless
bibtex "%MAIN%"

rem nomenclature, if any entries were produced
if exist "%MAIN%.nlo" makeindex "%MAIN%.nlo" -s nomencl.ist -o "%MAIN%.nls"

pdflatex -interaction=nonstopmode -synctex=1 "%MAIN%.tex"
if errorlevel 1 goto :error
pdflatex -interaction=nonstopmode -synctex=1 "%MAIN%.tex"
if errorlevel 1 goto :error

echo.
echo === OK: "%MAIN%.pdf" aggiornato ===
exit /b 0

:error
echo.
echo === Compilazione fallita: vedi "%MAIN%.log" ===
exit /b 1
