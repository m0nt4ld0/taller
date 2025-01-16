@echo off
:: Asegúrate de ejecutar este script como administrador.
echo Listando todas las redes WiFi almacenadas y sus passwords...
echo ------------------------------------------------------------

:: Iterar sobre los perfiles de red almacenados
for /f "skip=9 tokens=*" %%A in ('netsh wlan show profiles') do (
    set "network=%%A"
    :: Limpiar el nombre del perfil eliminando texto adicional
    for /f "tokens=2 delims=:" %%B in ("%%A") do (
        set "network=%%B"
        setlocal enabledelayedexpansion
        set "network=!network:~1!"
        echo Procesando red: !network!
        :: Ejecutar comando para mostrar detalles de la red
        netsh wlan show profile name="!network!" key=clear > temp_output.txt
        for /f "tokens=2 delims=:" %%C in ('findstr /C:"Contenido de la clave" temp_output.txt') do (
            set "password=%%C"
            set "password=!password:~1!"
            echo Password: !password!
        )
        del temp_output.txt
        endlocal
    )
    echo ------------------------------------------------------------
)
pause
