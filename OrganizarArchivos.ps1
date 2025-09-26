# Si aparece error de ejecución, introducir "Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass"

# Entonces, probar con: " Get-ExecutionPolicy -List" -->  verás si esta en Bypass 

foreach($k in Get-ChildItem){                   
                   $f = $k.LastWriteTime;
                   Write-Host "Día: $($f.Day)"
                   Write-Host "Mes: $($f.Month)"
                   Write-Host "Año: $($f.Year)"

                   $day = $($f.Day)
                   $month = $($f.Month)
                   $year = $($f.Year)

                   $destino = "2025\07"  #Poner aquí el nombre del directorio 

                   if (-not (Test-Path $destino)) {
                          New-Item -Path $destino -ItemType Directory
                   }
                   
                   if ($month -eq 07 -and $year -eq 2025) {   #Filtrar aquí por fecha (mes y año)
                          $origen = $k.FullName
                          $rutaDestino = Join-Path $destino $nombreArchivo

                          # Mover el archivo
                          Move-Item -Path $origen -Destination $rutaDestino -Force

                          Write-Host "Movido: $nombreArchivo a $destino"  # Un simple print para confirmar lo que has movido
                   }

}
