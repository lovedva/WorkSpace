' should encode with gbk if chinese character is contained
Set WshShell = CreateObject("WScript.Shell") 
WScript.Sleep 300 ' �ӳ�1�룬�����Ը�����Ҫ�������ʱ��
MsgBox "����������������������в鿴�ͽ�����������̣�ע�ⲻҪ�ظ����У���", 0, "��ʾ"
cmd = "cmd /c chcp 65001 && python.exe .\test.py"
WshShell.Run cmd, 0, True

