@echo off
rem ------------------------------------------------------------------------------
rem Gradle start up script for Windows
rem ------------------------------------------------------------------------------

@rem Determine the location of the script
set DIRNAME=%~dp0%
if "%DIRNAME%" == "" set DIRNAME=.

set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

@rem Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.
goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%

set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.
goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args
if defined _DEBUG echo Debugging...
set CMD_LINE_ARGS=%*
goto execute

:win9xME_args
@rem Slurp the command line arguments. This loop allows for an unlimited number of arguments.
set CMD_LINE_ARGS=
:win9xME_args_slurp
if "%1" == "" goto execute
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto win9xME_args_slurp

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\gradle\wrapper\gradle-wrapper.jar

"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %GRADLE_OPTS% -classpath "%CLASSPATH%" org.gradle.wrapper.GradleWrapperMain %CMD_LINE_ARGS%

:end
