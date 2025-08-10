@echo off
title Fusion 360 Full Cleanup
echo ==============================================
echo   Autodesk Fusion 360 Cleanup Script
echo ==============================================
echo.

REM Close Fusion processes if running
echo Closing Fusion 360 processes...
taskkill /f /im Fusion360.exe >nul 2>&1
taskkill /f /im AdAppMgrSvc.exe >nul 2>&1
taskkill /f /im AdAppMgrUpdater.exe >nul 2>&1
taskkill /f /im AdAppMgrSvc.exe >nul 2>&1

REM Remove main folders
echo Deleting Fusion 360 folders...
rmdir /s /q "%localappdata%\Autodesk"
rmdir /s /q "%appdata%\Autodesk"
rmdir /s /q "C:\ProgramData\Autodesk"

REM Remove registry keys
echo Cleaning registry entries...
reg delete "HKCU\Software\Autodesk\Autodesk Fusion 360" /f
reg delete "HKLM\Software\Autodesk\Autodesk Fusion 360" /f
reg delete "HKLM\Software\WOW6432Node\Autodesk\Autodesk Fusion 360" /f

REM Remove uninstall entry (if exists)
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\Autodesk Fusion 360" /f
reg delete "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Autodesk Fusion 360" /f

echo.
echo Cleanup complete!
echo You can now reinstall Fusion 360 from:
echo https://www.autodesk.com/products/fusion-360/download
echo.
pause

