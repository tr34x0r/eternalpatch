@echo off
color F9
title ETERNALBLUE Fix @tr34x0r

ver | findstr /i "6.1" > nul
if %errorlevel% == 0 (
  echo Windows 7 detected
  echo Checking if ports 139 and 445 are open...
  netstat -an | find "139" > nul
  if %errorlevel% == 0 (
    echo Port 139 is vulnerable to potential security threats, blocking incoming connections...
    netsh advfirewall firewall add rule name="Block TCP 139" dir=in action=block protocol=TCP localport=139
  )
  netstat -an | find "445" > nul
  if %errorlevel% == 0 (
    echo Port 445 is vulnerable to potential security threats, blocking incoming connections...
    netsh advfirewall firewall add rule name="Block TCP 445" dir=in action=block protocol=TCP localport=445
  )
)

ver | findstr /i "6.3" > nul
if %errorlevel% == 0 (
  echo Windows 8.1 detected
  echo Checking if ports 139 and 445 are open...
  netstat -an | find "139" > nul
  if %errorlevel% == 0 (
    echo Port 139 is vulnerable to potential security threats, blocking incoming connections...
    netsh advfirewall firewall add rule name="Block TCP 139" dir=in action=block protocol=TCP localport=139
  )
  netstat -an | find "445" > nul
  if %errorlevel% == 0 (
    echo Port 445 is vulnerable to potential security threats, blocking incoming connections...
    netsh advfirewall firewall add rule name="Block TCP 445" dir=in action=block protocol=TCP localport=445
  )
)

ver | findstr /i "not found" > nul
if %errorlevel% == 0 (
  echo Windows version is not vulnerable
  echo No action taken
  exit
)

pause
