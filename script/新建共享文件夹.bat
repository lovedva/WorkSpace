@echo off
mkdir "C:\SharedFolder"
net share SharedFolder="C:\SharedFolder" /GRANT:Everyone,CHANGE
