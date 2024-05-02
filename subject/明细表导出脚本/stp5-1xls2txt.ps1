# 该文件需要保存成当前电脑语言环境的编码,当前为gbk，设置-地狱，例如GBK或utf8
# 
# 预处理
chcp 65001 #更改代码页到utf8
Set-Location $PSScriptRoot  #cd到当前目录
# ----------用户设置--------------
# 文件名
# $txtFilename=""
# $xlsName=""
# $outtxtContent =""
# $outputpathjson= $PSScriptRoot+"\json_output\"+$xlsName.Replace(".xls","")+".json"
# ----------用户设置结束--------------
foreach ($child in (Get-ChildItem $PSScriptRoot *.xls)){
    $xlsName=$child.Name
    $ExcelObj = New-Object -comobject Excel.Application
    $ExcelObj.visible = $false 
    $path = "$PSScriptRoot\$xlsName" #待打开文件
    # Write-Host $path
    $workbook = $ExcelObj.workbooks.open($path) #获取工作簿对象
    $ws=$workbook.WorkSheets.item(2) #获取工作表对象，也可以通过item("Sheet1")
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