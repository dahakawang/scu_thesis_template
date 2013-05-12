@echo off
if "%1"=="" goto :NO_ARGS
if "%1"=="clean" goto :CLEAN_ME
goto :ERROR

:NO_ARGS
call :makefile
goto :EOF
:CLEAN_ME
call :CleanFolder
goto :EOF
:ERROR
call :helpme
goto :EOF


:CleanFolder
del adjust.aux
del basic_info.aux
del epilogue.aux
del prologue.aux
del ch01.aux
del main.aux
del main.toc
del main.log
del ch02.aux
goto :EOF

:makefile
call :CleanFolder
xelatex main.tex  rem generate .toc file
xelatex main.tex rem generate pdf file
goto :EOF

:helpme
echo Wrong parameter, the usage is:
echo "make" - to make the pdf file
echo "make clean" - to clean the work directory
goto :EOF