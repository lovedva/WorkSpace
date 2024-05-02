# 2022.12.17该文件需要保存成当前电脑语言环境的编码,当前为gbk，设置-地狱，例如GBK或utf8
# 从导出的各个json数据库中，统计标准件和外购件
# 预处理
chcp 65001 #更改代码页到utf8
Set-Location $PSScriptRoot  #cd到当前目录
# ------------变量预处理------------
$logfName="stp6-1_ps1.log"
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

$json = (Get-Content "pcpNo.json" -Raw) | ConvertFrom-Json
$fNameArry=$json.fnArrAssem

 #标准件统计自定义对象类和数组 

$stdPrtNoObj=[PSCustomObject]@{
    PCPNo = "标准件统计对象"
}


$wPrtNoObj=[PSCustomObject]@{
    PCPName = "外购件统计对象"
}

$stdPrtNoArry =@()

# 外购件统计用PCPNo数组
$wPrtNoArry =@()


# 标准间页统计和操作
# 遍历json文件名数组，统计出所有相同标准件的编号
for ($i = 0; $i -lt $fNameArry.Count; $i++) { 
    #   根据零件编号解析json文件
    $tempfName=$PSScriptRoot+"\"+$fNameArry[$i]+".json"
    $jsonobj = (Get-Content -Raw $tempfName).Replace("\T","").Replace("\f","") | ConvertFrom-Json  
    # ※json内部数据标准件图号操作
    for ($ix = 1; $ix -lt $jsonobj.Count; $ix++) { 
        #统计标准件按PCPNo零件编号，正则匹配ID包含B-的    
        if ($jsonobj[$ix].IndexID -match 'B-') {
            <# Action when this condition is true #>
            # if (-NOT($jsonobj[$ix].PCPNo -eq"" )){ #判断零件编号不为空 }
                # 【按需】以零件编号为Key添加到stdPrtNoObj中，为了归类相同编号的标准件
                $stdPCPNo=$jsonobj[$ix].PCPNo
                $stdPrtNoObj | Add-Member -MemberType NoteProperty -Name $stdPCPNo -Value "标准件编号" -Force #相同属性名称强制添加

        }
        #统计外购件，按PCPName零件名称，正则匹配ID包含W-的    
        if ($jsonobj[$ix].IndexID -match 'W-') {
            <# Action when this condition is true #>
            # if (-NOT($jsonobj[$ix].PCPNo -eq"" )){ #判断零件编号不为空 }
                # 【按需】以零件编号为Key添加到wPrtNoObj中，为了归类相同编号的标准件
                $wPCPName=$jsonobj[$ix].PCPName
                $wPrtNoObj | Add-Member -MemberType NoteProperty -Name $wPCPName -Value "外购件名称" -Force #相同属性名称强制添加

        }

    }
}

# 需要手动获取标准件编号插入数组的时候取消注释
$stdPrtNoObj | fl 
$wPrtNoObj | fl

Write-Host over
