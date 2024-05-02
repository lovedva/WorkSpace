# ��Դ��ע��������ļ���Ҫ����ɵ�ǰ�������Ի����ı��룬����-����������GBK��utf8
# ���������������ļ���������� -0ͼ�ŵ��ļ����ָ��ַ������ָ�ؼ���-0�������ͼ�ţ�ͼ��json��ʽ,Ȼ���ֶ��޸�

# Ԥ����
chcp 65001 #���Ĵ���ҳ��utf8 GBK 936 utf8 65001
Set-Location $PSScriptRoot  #cd����ǰĿ¼
# ------------����Ԥ����------------
$logfName="stp3.log"
# �ļ���
$inputFileName=""
$inputPath=""
$outputFileName=$PSScriptRoot+"\pcpNo.json"
$outputPath=0
$outContent=""
$outjsonFName="assem-0PName.json"
if (($outputPath -ne 0) -and(-NOT(Test-Path -Path $outputPath))){
    mkdir $outputPath
}

# ��pcpNo.json��ȡ�ļ�������
$json = (Get-Content "pcpNo.json" -Raw) | ConvertFrom-Json
$fNameArryAssem=$json.fnArrAssem
# $fNameArryAssem

#�����Զ������ ��ͼ�Ŷ���
$assemNoObj = [PSCustomObject]@{
    Content= '-0��ͼ��ţ�ͼ��json����'
    �ֶ�����޸�="False"
}

# $csvdata | Add-Member -MemberType NoteProperty -Name Status -Value "Processed" #��Ӷ���

# ����ȡ�ļ������ָ��ַ���
for ($i = 0; $i -lt $fNameArryAssem.Count; $i++) {
    <# Action that will repeat until the condition is met #>
    $AssemNum= $fNameArryAssem[$i]
    get-childitem * -Recurse | where {$_.extension -eq".dxf"} | % {
        if ($_.Name.Contains($AssemNum)){
            $tempStr= $_.Name.Replace(".dxf","") -replace("[����\(\)���������]")
            # $tempStr
            $tempStr -match("(^.*-0)(.*)")  #�� �ָ��ַ���������
            # $Matches
            $assemNoObj | Add-Member -MemberType NoteProperty -Name $AssemNum -Value $Matches[2].Trim() #��ӵ���ͼͼ�Ŷ���
        }
    }
}


$assemNoObj | fl
write-host "������"([int]$assemNoObj.psobject.properties.name.Count-2) #��ȡ��Ա����
write-host "pcpNo.json �Ƿ��ֶ��޸ģ�",$json.�ֶ�����޸�
# $outContent | Out-File -FilePath $PSScriptRoot/$outContentFName -Force -Encoding utf8

# �����json
$assemNoObj | ConvertTo-Json -depth 10 | Set-Content -Path $PSScriptRoot/$outjsonFName
# $myObject = Get-Content -Path $Path | ConvertFrom-Json

Write-Host over