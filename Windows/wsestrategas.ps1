# URL de la página que se va a descargar
$url = "https://www.revistaestrategas.com.ar/ranking"

# Descargar el contenido HTML de la página
$response = Invoke-WebRequest -Uri $url

# Almacenar el contenido en una variable
$htmlContent = $response.Content

# Mostrar el contenido en la consola (opcional)
Write-Output $htmlContent