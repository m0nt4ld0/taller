@echo off
:: Define rutas donde tengo almacenadas las versiones de Java
set JAVA_HOME_17=C:\_Dev\jdk-17.0.13
set JAVA_HOME_21=C:\_Dev\jdk-21.0.5
set JAVA_HOME_23=C:\_Dev\jdk-23.0.1

:: Verifica la version actual de Java en el sistema
echo La version actual de Java en este sistema es:
"%JAVA_HOME%\bin\java.exe" -version

:: Pide al usuario la version deseada
echo Seleccione la version de Java que desee activar para todo el sistema:
echo [1] Java 17
echo [2] Java 21
echo [3] Java 23
set /p choice=Ingrese el valor segun corresponda: 

if "%choice%"=="1" set JAVA_HOME=%JAVA_HOME_17%
if "%choice%"=="2" set JAVA_HOME=%JAVA_HOME_21%
if "%choice%"=="3" set JAVA_HOME=%JAVA_HOME_23%

:: Actualiza las variables de entorno del sistema
setx JAVA_HOME "%JAVA_HOME%" /M
setx PATH "%JAVA_HOME%\bin;%PATH%" /M

:: Verifica el cambio
echo La version de Java se ha cambiado globalmente en este sistema a:
"%JAVA_HOME%\bin\java.exe" -version

pause
