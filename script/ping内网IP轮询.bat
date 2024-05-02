@REM @echo off
setlocal enabledelayedexpansion
for /L %%i in (1,1,254) do (
    ping -n 1 -w 100 192.168.29.%%i > nul
    if !errorlevel! equ 0 echo 192.168.29.%%i is up.
)
pause
