# 2022.12.17���ļ���Ҫ����ɵ�ǰ�������Ի����ı���,��ǰΪgbk������-����������GBK��utf8
# �����򲶻��ļ������������
#-------------------------------------------------------------------------------------
# Ԥ����
chcp 65001 #���Ĵ���ҳ��utf8
Set-Location $PSScriptRoot  #cd����ǰĿ¼
# ----------����Ԥ����--------------
# �ļ���
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
        $tempStr=$currentItem.Name -replace("[\(\)�������������]","")
        $tempStr=$tempStr.Replace(" ","").Replace(".dxf","")
        $tempStr=$tempStr -replace ("[\u4e00-\u9fa5].*$","")
        if ($tempStr -match ("-0")){
            # $tempStrArryAssem=$tempStrArryAssem+"`""+$tempStr +"`",`n"
            $tempPath=$outputPath+$currentItem.Name
            Move-Item $currentItem -Destination  $tempPath -Force 
            # Remove-Item $currentItem #�ᱨ����ִ�У����������
        }else {
            <# Action when all if and elseif conditions are false #>
            Move-Item $currentItem -Destination $PSScriptRoot -Force
        }

    # }
}  


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