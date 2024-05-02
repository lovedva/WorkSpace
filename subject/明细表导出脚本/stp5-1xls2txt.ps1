# ���ļ���Ҫ����ɵ�ǰ�������Ի����ı���,��ǰΪgbk������-����������GBK��utf8
# 
# Ԥ����
chcp 65001 #���Ĵ���ҳ��utf8
Set-Location $PSScriptRoot  #cd����ǰĿ¼
# ----------�û�����--------------
# �ļ���
# $txtFilename=""
# $xlsName=""
# $outtxtContent =""
# $outputpathjson= $PSScriptRoot+"\json_output\"+$xlsName.Replace(".xls","")+".json"
# ----------�û����ý���--------------
foreach ($child in (Get-ChildItem $PSScriptRoot *.xls)){
    $xlsName=$child.Name
    $ExcelObj = New-Object -comobject Excel.Application
    $ExcelObj.visible = $false 
    $path = "$PSScriptRoot\$xlsName" #�����ļ�
    # Write-Host $path
    $workbook = $ExcelObj.workbooks.open($path) #��ȡ����������
    $ws=$workbook.WorkSheets.item(2) #��ȡ���������Ҳ����ͨ��item("Sheet1")
    $str=$xlsName.Replace(".xls",".txt")
    $ws.saveas("$PSScriptRoot\$str",[Microsoft.Office.Interop.Excel.XlFileFormat]::xlUnicodeText)
    $ExcelObj.Quit()
    # $workbook.Close($false)
    # $ws=$null
    # $workbook=$null
    # $ExcelObj=$null
    kill -ProcessName "Excel"
}

write-host xls2txt over