'创建目标程序快捷方式到 shell:startup目录 script encoding gbk
'运行输入 shell:startup 或者cmd 执行 explorer shell:startup
Set objShell = WScript.CreateObject("WScript.Shell")
strStartupFolder = objShell.SpecialFolders("Startup")
Set objShortcut = objShell.CreateShortcut(strStartupFolder & "\标签打印机转发程序TSPLPrinter_1124T.lnk")

' 设置目标程序路径
objShortcut.TargetPath = ".运行.bat"

' 设置开始位置（确保这里也使用相对路径）
objShortcut.WorkingDirectory = "."

' 保存快捷方式
objShortcut.Save

'打开开机启动文件夹
objShell.Run "explorer shell:startup"
