@echo off 



:choice 
cls
echo Choose: 
echo [C] Set DHCP
echo [Z] Quit 
echo. 

SET /P C=[C]? 

for %%? in (C) do if /I "%C%"=="%%?" goto C
for %%? in (Z) do if /I "%C%"=="%%?" goto Z
goto choice 


:C 
@ECHO OFF 
ECHO Resetting IP Address and Subnet Mask For DHCP 
netsh int ip set address name = "LAN" source = dhcp

ipconfig /release
ipconfig /flushdns
ipconfig /renew

ECHO aqui esta la nueva configuracion de red %computername%: 

netsh int ip show config

pause 
goto choice


:Z
exit
:end