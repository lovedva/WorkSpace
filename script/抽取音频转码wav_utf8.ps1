$ext="flv","mp4"

Set-Location $PSScriptRoot
foreach ($item in $ext){
    Get-ChildItem $PSScriptRoot/*.$item | ForEach-Object{
        Write-Output ($_.Name)
        $TempName=($_.Name -replace "\.$item","_audioExctract.m4a")
        ffmpeg -i $_.Name -vn -acodec copy $TempName
        ffmpeg -i $TempName -f wav ($_.Name -replace "\.$item","_ffmpeg.wav")
    
    }
}


pause