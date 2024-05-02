# 2022.12.17���ļ���Ҫ����ɵ�ǰ�������Ի����ı���,��ǰΪgbk������-����������GBK��utf8
# �ӵ����ĸ���json���ݿ��У�ͳ�Ʊ�׼�����⹺��
# Ԥ����
chcp 65001 #���Ĵ���ҳ��utf8
Set-Location $PSScriptRoot  #cd����ǰĿ¼
# ------------����Ԥ����------------
$logfName="stp6-1_ps1.log"
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

$json = (Get-Content "pcpNo.json" -Raw) | ConvertFrom-Json
$fNameArry=$json.fnArrAssem

 #��׼��ͳ���Զ������������� 

$stdPrtNoObj=[PSCustomObject]@{
    PCPNo = "��׼��ͳ�ƶ���"
}


$wPrtNoObj=[PSCustomObject]@{
    PCPName = "�⹺��ͳ�ƶ���"
}

$stdPrtNoArry =@()

# �⹺��ͳ����PCPNo����
$wPrtNoArry =@()


# ��׼��ҳͳ�ƺͲ���
# ����json�ļ������飬ͳ�Ƴ�������ͬ��׼���ı��
for ($i = 0; $i -lt $fNameArry.Count; $i++) { 
    #   ���������Ž���json�ļ�
    $tempfName=$PSScriptRoot+"\"+$fNameArry[$i]+".json"
    $jsonobj = (Get-Content -Raw $tempfName).Replace("\T","").Replace("\f","") | ConvertFrom-Json  
    # ��json�ڲ����ݱ�׼��ͼ�Ų���
    for ($ix = 1; $ix -lt $jsonobj.Count; $ix++) { 
        #ͳ�Ʊ�׼����PCPNo�����ţ�����ƥ��ID����B-��    
        if ($jsonobj[$ix].IndexID -match 'B-') {
            <# Action when this condition is true #>
            # if (-NOT($jsonobj[$ix].PCPNo -eq"" )){ #�ж������Ų�Ϊ�� }
                # �����衿��������ΪKey��ӵ�stdPrtNoObj�У�Ϊ�˹�����ͬ��ŵı�׼��
                $stdPCPNo=$jsonobj[$ix].PCPNo
                $stdPrtNoObj | Add-Member -MemberType NoteProperty -Name $stdPCPNo -Value "��׼�����" -Force #��ͬ��������ǿ�����

        }
        #ͳ���⹺������PCPName������ƣ�����ƥ��ID����W-��    
        if ($jsonobj[$ix].IndexID -match 'W-') {
            <# Action when this condition is true #>
            # if (-NOT($jsonobj[$ix].PCPNo -eq"" )){ #�ж������Ų�Ϊ�� }
                # �����衿��������ΪKey��ӵ�wPrtNoObj�У�Ϊ�˹�����ͬ��ŵı�׼��
                $wPCPName=$jsonobj[$ix].PCPName
                $wPrtNoObj | Add-Member -MemberType NoteProperty -Name $wPCPName -Value "�⹺������" -Force #��ͬ��������ǿ�����

        }

    }
}

# ��Ҫ�ֶ���ȡ��׼����Ų��������ʱ��ȡ��ע��
$stdPrtNoObj | fl 
$wPrtNoObj | fl

Write-Host over
