$NombreCarpeta = Read-Host ("Escribe el nombre del directorio a buscar")

if (-Not $NombreCarpeta) {
    Write-Host ("Se debe dar el nombre del directorio a buscar.")
    exit
}

$RutaCompleta = Get-ChildItem -Recurse -Depth 2 -ErrorAction SilentlyContinue -Path "C:\" | Where-Object { $_.Name -like $NombreCarpeta }

if ($RutaCompleta.Count -gt 0) {
    Write-Host ("Se encontró el/los directorios")
    $RutaCompleta | ForEach-Object { Write-Host $_.FullName }
} else {
    Write-Host("No se ha encontrado el directorio")
}