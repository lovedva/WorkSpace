chcp 65001 #更改代码页到utf8
Set-Location $PSScriptRoot  #cd到当前目录

Get-ChildItem -Path .  -Recurse -Force | foreach{
    if ($_.Name.Contains(".dxf")){ #会报错但是执行成功，看情况处理
        $tempstr= $_.Name  -replace ("[\(\)（）公开已完成]","")
        $tempstr=$tempstr -replace '[\u4e00-\u9fa5][0-9]*.*.dxf', '.dxf'
        $tempstr=$tempstr -replace ' ', ''
        $_|Rename-Item -NewName  $tempstr
        # ren  ($_.Name -replace ("[\(\)（）公开已完成]",""))
        # ren $_.Name  ($_.Name -replace "[\u4e00-\u9fa5][0-9]*","")
        # ren $_.name ($_.Name -replace ' ', '')
        Write-Output $_.DirectoryName$_.Name
        # cp $_ $PSScriptRoot 
    } 
}

write-host over
