# ���ļ���Ҫ����ɵ�ǰ�������Ի����ı���,��ǰΪgbk������-����������GBK��utf8
# xlsת�ɵ�txtת��json��ʽ
# Ԥ����
chcp 65001 #���Ĵ���ҳ��utf8
Set-Location $PSScriptRoot  #cd����ǰĿ¼
# ----------�û�����--------------
# �ļ���
$txtFilename="."
$xlsName="."
$outtxtContent =""
# $outputpathjson= $PSScriptRoot+"\json_output\"+$xlsName.Replace(".xls","")+".json"
# ----------�û����ý���--------------

foreach ($children in (Get-ChildItem $PSScriptRoot *.txt)){
    $txtFilename=$children.Name
    Write-Host $txtFilename
    $outputpathjson= $PSScriptRoot+"\"+$txtFilename.Replace(".txt","")+".json"

    $jsondb = "[`n"

$txtContent=Get-Content -path $PSScriptRoot\$txtFilename

# ��ͷ������������ͷ���Ϊ��һ�У�����ָ��˳��
$tbheadArry=@()
$jsondb=$jsondb+"["

    $splitarr=$txtContent[0].Split('	')
    foreach ($item in $splitarr) {
        # Write-Host $item
        if ($item -match ".*\n") {#�ж��ǲ������һ�и��ӵ�Ԫ�أ�����ǣ��Ͳ������Ķ���) 
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


# ƴ�Ӿ�������
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
        $jsondb = $jsondb -replace ',\n]', ("`n"+']') #ȥ�����һ�еĶ���

        # Write-Output $jsondb

    # ����json�ļ�
    if ((Test-Path $outputpathjson) -eq "False"){
        New-Item $outputpathjson -Force
        $jsondb | Out-File -FilePath $outputpathjson -Force -Encoding utf8

    }else {
        $jsondb | Out-File -FilePath $outputpathjson -Force -Encoding utf8
    }

}

write-host txt2json over
# ���json�ļ�
