# Descripción: Descarga en lotes las ROMs de Retrostic para una página y consola seleccionadas.
# Sintaxis: $ python3 bajar_juegos.py <consola> <pagina>
# Ejemplo:  $ python3 bajar_juegos.py megadrive 2
#           Descarga los juegos de la pagina 2 de resultados de megadrive
#           El listado de consolas admitidas esta en el archivo README.md
# Developed by: m0nt4ld0 <github.com/m0nt4ld0>
#              mmontaldo@live.com
# Última actualización: 23/02/2025

import os
import sys
import time
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service

if len(sys.argv) < 2:
    print("Uso: {} <consola> [pagina]".format(sys.argv[0]))
    sys.exit(1)

consola = sys.argv[1]
pagina = sys.argv[2] if len(sys.argv) > 2 else "1"

download_dir = os.path.expanduser(f"~/Descargas/roms/{consola}")
os.makedirs(download_dir, exist_ok=True)

chrome_options = Options()
chrome_options.add_argument("--headless")  # Ejecuta en modo headless
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-gpu")
chrome_options.add_argument("--disable-dev-shm-usage")
chrome_options.add_argument("--remote-debugging-port=9222")  # Soluciona el error DevToolsActivePort
prefs = {
    "download.default_directory": download_dir,
    "download.prompt_for_download": False,
    "download.directory_upgrade": True,
    "safebrowsing.enabled": True
}
chrome_options.add_experimental_option("prefs", prefs)

# Especifica manualmente la ruta del ChromeDriver
service = Service("/usr/local/bin/chromedriver")
driver = webdriver.Chrome(service=service, options=chrome_options)

base_url = "https://www.retrostic.com"
listing_url = f"{base_url}/es/roms/{consola}/page/{pagina}"
print("Abriendo listado:", listing_url)
driver.get(listing_url)
time.sleep(2)  # Esperar a que cargue la página

game_links_elements = driver.find_elements(By.CSS_SELECTOR, "a[title]")
game_urls = []
for el in game_links_elements:
    href = el.get_attribute("href")
    if href and f"/es/roms/{consola}" in href:
        if href not in game_urls:
            game_urls.append(href)

print(f"Se encontraron {len(game_urls)} juegos.")
descargados = 0

for url in game_urls:
    print("Procesando:", url)
    driver.get(url)
    time.sleep(2)  # Esperar la carga de la página detalle

    try:
        # Buscar el formulario de descarga por su id "dl"
        download_form = driver.find_element(By.ID, "dl")
        # Enviar el formulario simulando el click con JS en el botón de descarga
        driver.execute_script("arguments[0].submit();", download_form)
        print("Formulario enviado, esperando descarga...")
        time.sleep(8)  # Espera que se inicie y complete la descarga
        descargados += 1
    except Exception as e:
        print("Error en descarga desde {}: {}".format(url, e))

driver.quit()
print(f"Descargas iniciadas para {descargados} juegos en: {download_dir}")

