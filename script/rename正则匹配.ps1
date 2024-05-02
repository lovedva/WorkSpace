Set-Location $PSScriptRoot

ls *.flv | foreach{
    if ($_.Name.Contains(".flv")){
        Write-Output ($_.Name)
        ren $_.name ($_.Name -replace '^\d{1}', '')
    } 
}

Pause
