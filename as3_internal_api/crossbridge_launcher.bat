@ECHO OFF
SET RUN_BAT=%~f1\run.bat
IF EXIST "%RUN_BAT%" (
	"%RUN_BAT%" "%~dp0\crossbridge_compile.sh"
) ELSE (
	ECHO Error: "%RUN_BAT%" not found. Check $^(CROSSBRIDGE_PATH^) macro in Visual Studio project.
)