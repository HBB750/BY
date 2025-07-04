@echo off
echo ===================================
echo PUBG Gameloop EN Driver Bypass Script
echo ===================================

echo Adding PUBG Firewall Rules...

netsh advfirewall firewall add rule name="PUBG Block 157" dir=out remoteip=157.0.0.0/8 action=block
netsh advfirewall firewall add rule name="PUBG Block 182" dir=out remoteip=182.0.0.0/8 action=block
netsh advfirewall firewall add rule name="PUBG Block 203" dir=out remoteip=203.0.0.0/8 action=block
netsh advfirewall firewall add rule name="PUBG Block 49"  dir=out remoteip=49.0.0.0/8 action=block

echo All done!
pause

REM أوقف خدمة الدرايفر
sc stop aow_drv_x64

echo [+] Driver service stop command sent.
timeout /t 2 >nul

REM إعادة تسمية ملف الدرايفر
cd "C:\Program Files\TxGameAssistant\UI\TBox"
rename aow_drv_x64.sys aow_drv_x64.sys.bak

echo [+] Driver file renamed.
timeout /t 1 >nul

REM انسخ ملف hosts
copy /Y hosts C:\Windows\System32\drivers\etc\hosts

echo [+] Hosts file replaced.
timeout /t 1 >nul

REM شغل المحاكي EN مباشرة
