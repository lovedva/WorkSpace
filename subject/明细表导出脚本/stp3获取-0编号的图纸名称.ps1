# ※源码注意事项：该文件需要保存成当前电脑语言环境的编码，设置-地狱，例如GBK或utf8
# ※遍历迭代所有文件，捕获包含 -0图号的文件，分割字符串（分割关键字-0）输出到图号：图名json格式,然后手动修改

# 预处理
chcp 65001 #更改代码页到utf8 GBK 936 utf8 65001
Set-Location $PSScriptRoot  #cd到当前目录
# ------------变量预处理------------
$logfName="stp3.log"
# 文件名
$inputFileName=""
$inputPath=""
$outputFileName=$PSScriptRoot+"\pcpNo.json"
$outputPath=0
$outContent=""
$outjsonFName="assem-0PName.json"
if (($outputPath -ne 0) -and(-NOT(Test-Path -Path $outputPath))){
    mkdir $outputPath
}

# 从pcpNo.json读取文件名数组
$json = (Get-Content "pcpNo.json" -Raw) | ConvertFrom-Json
$fNameArryAssem=$json.fnArrAssem
# $fNameArryAssem

#创建自定义对象 ，图号对象
$assemNoObj = [PSCustomObject]@{
    Content= '-0总图编号：图名json数据'
    手动检查修改="False"
}

# $csvdata | Add-Member -MemberType NoteProperty -Name Status -Value "Processed" #添加对象

# ※获取文件名，分割字符串
for ($i = 0; $i -lt $fNameArryAssem.Count; $i++) {
    <# Action that will repeat until the condition is met #>
    $AssemNum= $fNameArryAssem[$i]
    get-childitem * -Recurse | where {$_.extension -eq".dxf"} | % {
        if ($_.Name.Contains($AssemNum)){
            $tempStr= $_.Name.Replace(".dxf","") -replace("[（）\(\)公开已完成]")
            # $tempStr
            $tempStr -match("(^.*-0)(.*)")  #※ 分割字符串用正则！
            # $Matches
            $assemNoObj | Add-Member -MemberType NoteProperty -Name $AssemNum -Value $Matches[2].Trim() #添加到总图图号对象
        }
    }
}


$assemNoObj | fl
write-host "总数："([int]$assemNoObj.psobject.properties.name.Count-2) #获取成员数量
write-host "pcpNo.json 是否手动修改：",$json.手动检查修改
# $outContent | Out-File -FilePath $PSScriptRoot/$outContentFName -Force -Encoding utf8

# 保存成json
$assemNoObj | ConvertTo-Json -depth 10 | Set-Content -Path $PSScriptRoot/$outjsonFName
# $myObject = Get-Content -Path $Path | ConvertFrom-Json

Write-Host over