# 2022.12.17该文件需要保存成当前电脑语言环境的编码,当前为gbk，设置-地狱，例如GBK或utf8
# 从导出的各个json数据库中，统计标准件和外购件
# 预处理
chcp 65001 #更改代码页到utf8
Set-Location $PSScriptRoot  #cd到当前目录
# ------------变量预处理------------
$logfName="stp4-3检查json数据缺漏_ps1.log"
# 文件名
$inputFileName=$PSScriptRoot+"\pcpNo.json"
$inputPath=0
$outputFileName=0
$outputPath=0
$outContent=0
$outjsonFName=0
if (($outputPath -ne 0) -and(-NOT(Test-Path -Path $outputPath))){
    mkdir $outputPath
}

$json = (Get-Content $inputFileName -Raw) | ConvertFrom-Json
$fNameArry=$json.fnArrAssem

# 遍历json文件名数组，迭代遍历当前文件目录，在当前目录中查找匹配的文件名，如果找不到就写入log
for ($i = 0; $i -lt $fNameArry.Count; $i++) { 
    $tempfName=$fNameArry[$i]+".json"
    # $tempfName
    if (Test-Path -Path $tempfName){
    }else {
        write-host "图号不存在 "$fNameArry[$i]
        '图号不存在 '+$fNameArry[$i] |Out-File $logfName -Append 
    }
       
}




Write-Host over
