# 2022.12.17���ļ���Ҫ����ɵ�ǰ�������Ի����ı���,��ǰΪgbk������-����������GBK��utf8
# �����򲶻��ļ������������ ح ȱ�����㷨�������㷨
# Ԥ����
chcp 65001 #���Ĵ���ҳ��utf8
Set-Location $PSScriptRoot  #cd����ǰĿ¼
# ------------����Ԥ����------------
$logfName="stp2ͼ�Ŵ�dxf�������б�json_ps.log"
# �ļ���
$inputFileName=""
$inputPath=""
$outputFileName=$PSScriptRoot+"\pcpNo.json"
$outputPath=0
$outContent=""
if (($outputPath -ne 0) -and(-NOT(Test-Path -Path $outputPath))){
    mkdir $outputPath
}

#�ļ������飬�Զ������
$tempStrArryAll=@()
$tempStrArryAssem=@()
$fileNameObj=[PSCustomObject]@{
    Content = "װ���ļ����������飺fnArrAssem, �����ļ����������飺fnArrAll"
    �ֶ�����޸�="False"
    ��ͬͼ��=@()
    �ݴ���=@()
    fnArrAssem=@()
    װ��ͼ����=0
    fnArrAll=@()
    ȫ���ļ�����=0
}

foreach ($currentItemName in (Get-ChildItem * -Recurse -Force).Name ) {
    if ($currentItemName.Contains(".dxf")){
        $tempStr=$currentItemName -replace("[\(\)�������������]","")
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
$fileNameObj.װ��ͼ����=$tempStrArryAssem.Count
$fileNameObj.ȫ���ļ�����=$tempStrArryAll.Count

# $fileNameObj |fl

# ���أ�������ظ�ͼ�ţ������log��־

for ($i = 0; $i -lt $tempStrArryAssem.Count; $i++) {
    for ($ix=$i+1; $ix -lt $tempStrArryAssem.Count; $ix++ ){
        # $i,$ix
        if ($tempStrArryAssem[$i] -eq $tempStrArryAssem[$ix]){
            write-host ("��ͬͼ��:"+$tempStrArryAssem[$i]+","+$tempStrArryAssem[$ix])
            $fileNameObj.��ͬͼ��+=$tempStrArryAssem[$i]
        }
    }
}

$fileNameObj | ConvertTo-Json | Set-Content -Path $outputFileName -Force
Write-Host ps over

# Ref
# # �����ĵ���Ҫ
# $outContent ="�����ļ���ps1�ű����ɣ��ű�����GBK�������ĵ�����utf8������ʱ��:"+(get-date -format "yyyyMMddHHʱmm��")+",�ű�·��"+$PSCommandPath+"��`n"
# $outContent = $outContent+"`n## ����ĵ���д��Ҫ�ܽ᣺`n`n"
# $docObjs=@($ShenCha,$SheJiFAPSh,$CeHua1,$GongChengLL,$CeHua2,$TeXingFX)
# foreach ($item in $docObjs) {
#     $item.PSObject.Properties | foreach { 
#         $outContent=$outContent+$_.Name+":"+($_.Value)+"`n"
#     }
#     $outContent=$outContent+"`n"
    
# }