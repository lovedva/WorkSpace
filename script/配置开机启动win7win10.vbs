'����Ŀ������ݷ�ʽ�� shell:startupĿ¼ script encoding gbk
'�������� shell:startup ����cmd ִ�� explorer shell:startup
Set objShell = WScript.CreateObject("WScript.Shell")
strStartupFolder = objShell.SpecialFolders("Startup")
Set objShortcut = objShell.CreateShortcut(strStartupFolder & "\��ǩ��ӡ��ת������TSPLPrinter_1124T.lnk")

' ����Ŀ�����·��
objShortcut.TargetPath = ".����.bat"

' ���ÿ�ʼλ�ã�ȷ������Ҳʹ�����·����
objShortcut.WorkingDirectory = "."

' �����ݷ�ʽ
objShortcut.Save

'�򿪿��������ļ���
objShell.Run "explorer shell:startup"
