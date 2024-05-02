Option Explicit

Dim objFSO, objFolder, objFile, strNewName, strPath
Dim objRegExp, match

strPath = Replace(WScript.ScriptFullName, WScript.ScriptName, "") ' 获取脚本所在的文件夹路径

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFolder = objFSO.GetFolder(strPath)

' 初始化正则表达式对象
Set objRegExp = New RegExp
objRegExp.Global = True
objRegExp.Pattern = "\[.*?\]--"

For Each objFile In objFolder.Files
    If InStr(1, objFile.Name, ".mp4", vbTextCompare) > 0 Then
        ' 使用正则表达式替换
        strNewName = objRegExp.Replace(objFile.Name, "")
        
        ' 如果新文件名与原文件名不同，则重命名文件
        If strNewName <> objFile.Name Then
            objFile.Name = strNewName
        End If
    End If
Next

WScript.Echo "Rename process completed!"
