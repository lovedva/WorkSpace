# 2022.12.17该文件需要保存成当前电脑语言环境的编码,当前为gbk，设置-地狱，例如GBK或utf8
# 按规则捕获文件名，输出数组
#-------------------------------------------------------------------------------------
# 预处理
chcp 65001 #更改代码页到utf8
Set-Location $PSScriptRoot  #cd到当前目录
# ----------变量预处理--------------
# 文件名
$inputFileName=""
$inputPath=""
$outputFileName=$PSScriptRoot+"\pcpNo.json"
$outputPath=$PSScriptRoot+"\assem\"
$outContent=""
if (($outputPath -ne 0) -and(-NOT(Test-Path -Path $outputPath))){
    mkdir $outputPath
}


foreach ($currentItem in (Get-ChildItem $PSScriptRoot -Recurse -Include *.dxf -Force) ) { 
    # if ($currentItem.Name.Contains(".exb")){
        $tempStr=$currentItem.Name -replace("[\(\)（）公开已完成]","")
        $tempStr=$tempStr.Replace(" ","").Replace(".dxf","")
        $tempStr=$tempStr -replace ("[\u4e00-\u9fa5].*$","")
        if ($tempStr -match ("-0")){
            # $tempStrArryAssem=$tempStrArryAssem+"`""+$tempStr +"`",`n"
            $tempPath=$outputPath+$currentItem.Name
            Move-Item $currentItem -Destination  $tempPath -Force 
            # Remove-Item $currentItem #会报错但是执行，看情况处理
        }else {
            <# Action when all if and elseif conditions are false #>
            Move-Item $currentItem -Destination $PSScriptRoot -Force
        }

    # }
}  


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