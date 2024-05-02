Option Explicit

Dim objFSO, objFolder, objFile, strNewName, strPath
Dim objRegExp, match

strPath = Replace(WScript.ScriptFullName, WScript.ScriptName, "") ' ��ȡ�ű����ڵ��ļ���·��

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFolder = objFSO.GetFolder(strPath)

' ��ʼ��������ʽ����
Set objRegExp = New RegExp
objRegExp.Global = True
objRegExp.Pattern = "\[.*?\]--"

For Each objFile In objFolder.Files
    If InStr(1, objFile.Name, ".mp4", vbTextCompare) > 0 Then
        ' ʹ��������ʽ�滻
        strNewName = objRegExp.Replace(objFile.Name, "")
        
        ' ������ļ�����ԭ�ļ�����ͬ�����������ļ�
        If strNewName <> objFile.Name Then
            objFile.Name = strNewName
        End If
    End If
Next

WScript.Echo "Rename process completed!"
