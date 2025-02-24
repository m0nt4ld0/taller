$sourceFile = "C:\ruta\archivo.txt"             # Ruta del archivo en tu equipo
$destinationPath = "C$\Destino\"                # Carpeta destino en los otros equipos
$computers = @("Equipo1", "Equipo2", "Equipo3") # Lista de nombres o IPs de los equipos

# Bucle para copiar archivo a cada equipo
foreach ($computer in $computers) {
    $destination = "\\$computer\$destinationPath"
    Write-Host "Copiando a $destination..."
    try {
        Copy-Item -Path $sourceFile -Destination $destination -Force
        Write-Host "Archivo copiado a $computer exitosamente." -ForegroundColor Green
    } catch {
        Write-Host "Error copiando a $computer: $_" -ForegroundColor Red
    }
}