Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
Set colProcessList = objWMIService.ExecQuery("Select * from Win32_Process Where Name = 'python.exe'")

For Each objProcess in colProcessList
    objProcess.Terminate()
Next
MsgBox "python.exe�����ѽ���", 0, "��ʾ"