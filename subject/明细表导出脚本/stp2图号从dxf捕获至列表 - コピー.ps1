# 2022.12.17该文件需要保存成当前电脑语言环境的编码,当前为gbk，设置-地狱，例如GBK或utf8
# 按规则捕获文件名，输出数组 丨 缺排序算法，查重算法
# 预处理
chcp 65001 #更改代码页到utf8
Set-Location $PSScriptRoot  #cd到当前目录
# ------------变量预处理------------
$logfName="stp2图号从dxf捕获至列表json_ps.log"
# 文件名
$inputFileName=""
$inputPath=""
$outputFileName=$PSScriptRoot+"\pcpNo.json"
$outputPath=0
$outContent=""
if (($outputPath -ne 0) -and(-NOT(Test-Path -Path $outputPath))){
    mkdir $outputPath
}

#文件名数组，自定义对象
$tempStrArryAll=@()
$tempStrArryAssem=@()
$fileNameObj=[PSCustomObject]@{
    Content = "装配文件名有序数组：fnArrAssem, 所有文件名无序数组：fnArrAll"
    手动检查修改="False"
    相同图号=@()
    暂存项=@()
    fnArrAssem=@()
    装配图数量=0
    fnArrAll=@()
    全部文件数量=0
}

foreach ($currentItemName in (Get-ChildItem * -Recurse -Force).Name ) {
    if ($currentItemName.Contains(".dxf")){
        $tempStr=$currentItemName -replace("[\(\)（）公开已完成]","")
        $tempStr=$tempStr.Replace(" ","").Replace(".dxf","")
        $tempStr=$tempStr -replace ("[\u4e00-\u9fa5].*$","")
        $tempStrArryAll+=$tempStr
        if ($tempStr -match ("-0")){
            $tempStrArryAssem+=$tempStr
        }
    }
}  

$fileNameObj.fnArrAssem=$tempStrArryAssem
$fileNameObj.fnArrAll=$tempStrArryAll
$fileNameObj.装配图数量=$tempStrArryAssem.Count
$fileNameObj.全部文件数量=$tempStrArryAll.Count

# $fileNameObj |fl

# 查重，如果有重复图号，输出到log日志

for ($i = 0; $i -lt $tempStrArryAssem.Count; $i++) {
    for ($ix=$i+1; $ix -lt $tempStrArryAssem.Count; $ix++ ){
        # $i,$ix
        if ($tempStrArryAssem[$i] -eq $tempStrArryAssem[$ix]){
            write-host ("相同图号:"+$tempStrArryAssem[$i]+","+$tempStrArryAssem[$ix])
            $fileNameObj.相同图号+=$tempStrArryAssem[$i]
        }
    }
}

$fileNameObj | ConvertTo-Json | Set-Content -Path $outputFileName -Force
Write-Host ps over

# Ref
# # 生成文档概要
# $outContent ="（本文件由ps1脚本生成，脚本编码GBK，生成文档编码utf8，生成时间:"+(get-date -format "yyyyMMddHH时mm分")+",脚本路径"+$PSCommandPath+"）`n"
# $outContent = $outContent+"`n## 审查文档编写概要总结：`n`n"
# $docObjs=@($ShenCha,$SheJiFAPSh,$CeHua1,$GongChengLL,$CeHua2,$TeXingFX)
# foreach ($item in $docObjs) {
#     $item.PSObject.Properties | foreach { 
#         $outContent=$outContent+$_.Name+":"+($_.Value)+"`n"
#     }
#     $outContent=$outContent+"`n"
    
# }