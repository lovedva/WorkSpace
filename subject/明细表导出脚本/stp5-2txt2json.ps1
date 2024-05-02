# 该文件需要保存成当前电脑语言环境的编码,当前为gbk，设置-地狱，例如GBK或utf8
# xls转成的txt转成json格式
# 预处理
chcp 65001 #更改代码页到utf8
Set-Location $PSScriptRoot  #cd到当前目录
# ----------用户设置--------------
# 文件名
$txtFilename="."
$xlsName="."
$outtxtContent =""
# $outputpathjson= $PSScriptRoot+"\json_output\"+$xlsName.Replace(".xls","")+".json"
# ----------用户设置结束--------------

foreach ($children in (Get-ChildItem $PSScriptRoot *.txt)){
    $txtFilename=$children.Name
    Write-Host $txtFilename
    $outputpathjson= $PSScriptRoot+"\"+$txtFilename.Replace(".txt","")+".json"

    $jsondb = "[`n"

$txtContent=Get-Content -path $PSScriptRoot\$txtFilename

# 表头区操作，将表头输出为第一行，用来指明顺序
$tbheadArry=@()
$jsondb=$jsondb+"["

    $splitarr=$txtContent[0].Split('	')
    foreach ($item in $splitarr) {
        # Write-Host $item
        if ($item -match ".*\n") {#判断是不是最后一列格子的元素，如果是，就不加最后的逗号) 
        $jsondb=$jsondb+"`""+$item.Replace("`"","")+"`""
        $tbheadArry+=$item.Replace("`"","")
    }else{
        # Write-Host $headitem.Value2
        $jsondb=$jsondb+"`""+$item.Replace("`"","")+"`","
        $tbheadArry+=$item.Replace("`"","")
    }
    }
$jsondb=$jsondb+"],`n"
$jsondb=$jsondb.Replace(",]","]")


# 拼接具体数据
for ($i = 1; $i -lt $txtContent.Count; $i++) {
    $jsondb = $jsondb +"{ "
    foreach ($line in $txtContent[$i]){
        # write-host $line
        $splitarr=$line.Split('	')
        for ($ii = 0; $ii -lt $splitarr.Count; $ii++) {
            # Write-Host $splitarr[$ii]
            # write-host $ii
                if ($ii -eq 0){
                    $jsondb =$jsondb + ("`""+"IndexID"+"`": `""+$splitarr[$ii].Replace("`"","")+"`" , ")
                }
                if ($ii -eq 1){
                    $jsondb =$jsondb + ("`""+"PCPNo"+"`": `""+$splitarr[$ii].Replace("`"","")+"`" , ")
                }
                if ($ii -eq 2){
                    $jsondb =$jsondb + ("`""+"PCPName"+"`": `""+$splitarr[$ii].Replace("`"","")+"`" , ")
                }
                if ($ii -eq 3){
                    $jsondb =$jsondb + ("`""+"Amount"+"`": `""+$splitarr[$ii].Replace("`"","")+"`" , ")
                }if ($ii -eq 4){
                    $jsondb =$jsondb + ("`""+"MaterialName"+"`": `""+$splitarr[$ii].Replace("`"","")+"`" , ")
                }
                if ($ii -eq 5){
                    $jsondb =$jsondb + ("`""+"Weight"+"`": `""+$splitarr[$ii].Replace("`"","")+"`" , ")
                }
                if ($ii -eq 6){
                    $jsondb =$jsondb + ("`""+"TWeight"+"`": `""+$splitarr[$ii].Replace("`"","")+"`" , ")
                }
                if ($ii -eq 7){
                    $jsondb =$jsondb + ("`""+"Remark"+"`": `""+$splitarr[$ii].Replace("`"","")+"`" , ")
                }
                if ($ii -eq 8){
                    $jsondb =$jsondb + ("`""+"Source"+"`": `""+$splitarr[$ii].Replace("`"","")+"`" , ")
                } 
            }
        $jsondb = $jsondb +" },`n"
        }
    }

    $jsondb = $jsondb.Replace(",  },","},")


        $jsondb = $jsondb+"]"
        $jsondb = $jsondb -replace ',\n]', ("`n"+']') #去掉最后一行的逗号

        # Write-Output $jsondb

    # 保存json文件
    if ((Test-Path $outputpathjson) -eq "False"){
        New-Item $outputpathjson -Force
        $jsondb | Out-File -FilePath $outputpathjson -Force -Encoding utf8

    }else {
        $jsondb | Out-File -FilePath $outputpathjson -Force -Encoding utf8
    }

}

write-host txt2json over
# 输出json文件
