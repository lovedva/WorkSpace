# 2022.12.17���ļ���Ҫ����ɵ�ǰ�������Ի����ı���,��ǰΪgbk������-����������GBK��utf8
# �ӵ����ĸ���json���ݿ��У�ͳ�Ʊ�׼�����⹺��
# Ԥ����
chcp 65001 #���Ĵ���ҳ��utf8
Set-Location $PSScriptRoot  #cd����ǰĿ¼
# ------------����Ԥ����------------
$logfName="stp4-3���json����ȱ©_ps1.log"
# �ļ���
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

# ����json�ļ������飬����������ǰ�ļ�Ŀ¼���ڵ�ǰĿ¼�в���ƥ����ļ���������Ҳ�����д��log
for ($i = 0; $i -lt $fNameArry.Count; $i++) { 
    $tempfName=$fNameArry[$i]+".json"
    # $tempfName
    if (Test-Path -Path $tempfName){
    }else {
        write-host "ͼ�Ų����� "$fNameArry[$i]
        'ͼ�Ų����� '+$fNameArry[$i] |Out-File $logfName -Append 
    }
       
}




Write-Host over
