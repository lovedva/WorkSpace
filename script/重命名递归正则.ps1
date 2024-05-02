# 重命名用脚本，包含递归，放在待处理根目录
Set-Location $PSScriptRoot

Get-ChildItem * -Force -Recurse | foreach{
    if ($_.Name.Contains(".dxf")){
        Write-Output ($_.DirectoryName)
        Write-Output ($_.Name)
        # ren $_.name ($_.Name -replace '^\d{1}', '')
        $tempStr=$_.Name.Replace(" ","") #去除所有空格
        # $tempStr -match("(^.*(-[0-9]+)+)([\u4e00-\u9fa5]*.*$)")
        # $Matches
        $tempStr= $tempStr -replace ("(^.*(-[0-9]+)+)([\u4e00-\u9fa5]*.*$)",'$1 $3')
        write-host $tempStr
        $_ | Rename-Item -NewName ($tempStr)
    } 
}

# Pause
