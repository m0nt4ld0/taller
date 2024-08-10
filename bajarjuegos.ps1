<#
.SYNOPSIS
    Descargar ROMs de diferentes juegos y consolas de forma masiva.

.DESCRIPTION
    El script permite descargar de forma masiva desde Retrostic todas las ROMs disponibles para la consola que se pase como parámetro, en la página que se pase como parámetro.
    Almacena las ROMs descargadas en la carpeta de descargas, generando una nueva carpeta con el nombre de la consola (o sobreescribiendo la que ya exista).
      
.PARAMETER consola
    Nombre abreviado de consola para las ROMs (megadrive, gba, mame, snes, ps-1, psp, etc.). La abreviatura de la consola se obtiene de la URL en https://www.retrostic.com/es/roms
.PARAMETER pagina
    número de página que contiene las ROMs que se van a descargar.

.EXAMPLE
    .\bajarjuegos.ps1 -consola "megadrive" -pagina 1

#>

Param(
    [Parameter(Position=1,Mandatory=$true)][ValidateNotNullOrEmpty()][String] $consola,
    [Parameter(Position=2,Mandatory=$false)][Int] $pagina
)

if(-not($pagina))
{
    $pagina = 1
}

# Obtengo el listado de todos los juegos que hay en la página
# $game_html = Invoke-RestMethod 'https://www.retrostic.com/es/roms/' + $consola + '/page/' + $pagina
$game_html = Invoke-RestMethod "https://www.retrostic.com/es/roms/$consola/page/$pagina"
$reg_exp = '<span itemprop="name".*>(?<name>.*)</span>'
 
$all_matches = ($game_html | Select-String $reg_exp -AllMatches).Matches
$filtered_matches = $all_matches | Select-Object -Skip 3

$GameDetails = @()

foreach ($match in $filtered_matches) {
    $name = $match.Groups['name'].Value
    $GameDetails += [PSCustomObject]@{
        'Nombre' = $name
    }
}

# Leo los nombres y descargo los .zip correspondientes, uno por uno
$carpetaDescargas = [System.IO.Path]::Combine($env:USERPROFILE, "Downloads")
$contadorarchivos = 0


foreach ($game in $GameDetails) {
    $download_url = "https://downloads.retrostic.com/roms/" + [uri]::EscapeDataString("$($game.Nombre)" + ".zip")
    
    # Creo o sobreescribo una subcarpeta con el nombre de la consola para guardar allí las ROMs
    New-Item -Path "$carpetaDescargas\$consola" -ItemType Directory -Force
    
    $dest = "$carpetaDescargas\$consola\$($game.Nombre).zip"

    Write-Output "Descargando $dest"
    try {
        Invoke-WebRequest -Uri $download_url -OutFile $dest
        $contadorarchivos++
    } catch {
        if ($_.Exception.Response.StatusCode -eq 404) {
            Write-Output "Error 404: El archivo $($game.Nombre).zip no se encontró."
        } else {
            Write-Output "Error al intentar descargar el archivo $($game.Nombre).zip: $($_.Exception.Message)"
        }
    }
}

Write-Output "$contadorarchivos archivos fueron descargados en $carpetaDescargas\$consola"