#视频格式
$vext="mp4"
#音频格式
$aext="m4a"

Set-Location $PSScriptRoot
foreach ($item in $vext){
    Get-ChildItem $PSScriptRoot/*.$item | ForEach-Object{
        Write-Output ($_.Name)
        $tempSTR="ffmpeg_"+$_.Name
        ffmpeg -i $_.Name -i $_.Name.Replace($vext,$aext) -vcodec copy -acodec copy $tempSTR
    }
}


pause