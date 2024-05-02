chcp 65001 #���Ĵ���ҳ��utf8
Set-Location $PSScriptRoot  #cd����ǰĿ¼

Get-ChildItem -Path .  -Recurse -Force | foreach{
    if ($_.Name.Contains(".dxf")){ #�ᱨ����ִ�гɹ������������
        $tempstr= $_.Name  -replace ("[\(\)�������������]","")
        $tempstr=$tempstr -replace '[\u4e00-\u9fa5][0-9]*.*.dxf', '.dxf'
        $tempstr=$tempstr -replace ' ', ''
        $_|Rename-Item -NewName  $tempstr
        # ren  ($_.Name -replace ("[\(\)�������������]",""))
        # ren $_.Name  ($_.Name -replace "[\u4e00-\u9fa5][0-9]*","")
        # ren $_.name ($_.Name -replace ' ', '')
        Write-Output $_.DirectoryName$_.Name
        # cp $_ $PSScriptRoot 
    } 
}

write-host over
