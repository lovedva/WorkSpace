# ���ļ���Ҫ����ɵ�ǰ�������Ի����ı���,��ǰΪgbk������-����������GBK��utf8
# ������ͼֽ�ļ��ļ�����ʽΪ��ͼ�� ��������.dxf/exb��ͼ�ź����������м��ÿո�������ո�ǰ�󲻰��������ַ������ŵ�
# Ԥ����
chcp 65001 #���Ĵ���ҳ��utf8
Set-Location $PSScriptRoot  #cd����ǰĿ¼
# ------------����Ԥ����------------
$logfName="stp1-2ͼֽ�ļ�����������ͼ�� ���Ƹ�ʽ��_ps1.log"  ; rm $logfName -Force 
# �ļ���Ԥ����
$inputFileName=0
$inputPath=""
$outputFileName="prtPageNum.json"
$outputPath=0
$outContent=0
if (($outputPath -ne 0) -and(-NOT(Test-Path -Path $outputPath))){
    mkdir $outputPath
}

# �������
$regexStr='(^.*(-[0-9]+)+)([\u4e00-\u9fa5]*.*$)'
Get-ChildItem * -Force -Recurse | foreach{
    if ($_.Name.Contains(".dxf")){
        # Write-Output ($_.DirectoryName)
        Write-Output ($_.Name)
        # ren $_.name ($_.Name -replace '^\d{1}', '')
        $tempStr=$_.Name.Replace(" ","") #ȥ�����пո�
        if ($tempStr -match($regexStr)){
            $Matches
            $tempStr= $tempStr -replace ($regexStr,'$1 $3')
            # write-host $tempStr
            $_ | Rename-Item -NewName ($tempStr)
        }else {
            "�ļ�����ʽ��ƥ�䣬�ļ�����"+$_.Name|Out-File $logfName -Append -Force
        }
        
    } 
}

# Pause
