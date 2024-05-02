# 该文件需要保存成当前电脑语言环境的编码,当前为gbk，设置-地狱，例如GBK或utf8
# 重命名图纸文件文件名格式为：图号 中文名称.dxf/exb，图号和中文名称中间用空格隔开，空格前后不包含其他字符如括号等
# 预处理
chcp 65001 #更改代码页到utf8
Set-Location $PSScriptRoot  #cd到当前目录
# ------------变量预处理------------
$logfName="stp1-2图纸文件名调整至（图号 名称格式）_ps1.log"  ; rm $logfName -Force 
# 文件名预处理
$inputFileName=0
$inputPath=""
$outputFileName="prtPageNum.json"
$outputPath=0
$outContent=0
if (($outputPath -ne 0) -and(-NOT(Test-Path -Path $outputPath))){
    mkdir $outputPath
}

# 正则变量
$regexStr='(^.*(-[0-9]+)+)([\u4e00-\u9fa5]*.*$)'
Get-ChildItem * -Force -Recurse | foreach{
    if ($_.Name.Contains(".dxf")){
        # Write-Output ($_.DirectoryName)
        Write-Output ($_.Name)
        # ren $_.name ($_.Name -replace '^\d{1}', '')
        $tempStr=$_.Name.Replace(" ","") #去除所有空格
        if ($tempStr -match($regexStr)){
            $Matches
            $tempStr= $tempStr -replace ($regexStr,'$1 $3')
            # write-host $tempStr
            $_ | Rename-Item -NewName ($tempStr)
        }else {
            "文件名格式不匹配，文件名："+$_.Name|Out-File $logfName -Append -Force
        }
        
    } 
}

# Pause
