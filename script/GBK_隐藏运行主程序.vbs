' should encode with gbk if chinese character is contained
Set WshShell = CreateObject("WScript.Shell") 
WScript.Sleep 300 ' 延迟1秒，您可以根据需要调整这个时间
MsgBox "打开主程序！请在任务管理器中查看和结束主程序进程，注意不要重复运行！！", 0, "提示"
cmd = "cmd /c chcp 65001 && python.exe .\test.py"
WshShell.Run cmd, 0, True

