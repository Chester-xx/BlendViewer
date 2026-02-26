@echo off
setlocal

:: ── Configuration ──────────────────────────────────────────────
set QT_DIR=C:\Developer\Tools\Qt\6.10.2\msvc2022_64
set BUILD_DIR=%~dp0build-release
set OUTPUT_DIR=%~dp0release-output
set EXE_NAME=appBlendViewer.exe
:: ───────────────────────────────────────────────────────────────

echo [1/4] Preparing output folder...
if exist "%OUTPUT_DIR%" rd /s /q "%OUTPUT_DIR%"
mkdir "%OUTPUT_DIR%"
copy "%BUILD_DIR%\%EXE_NAME%"                "%OUTPUT_DIR%\" >nul
copy "%BUILD_DIR%\BlendViewer_SideBar.dll"   "%OUTPUT_DIR%\" >nul
copy "%BUILD_DIR%\BlendViewer_StatusBar.dll" "%OUTPUT_DIR%\" >nul
copy "%BUILD_DIR%\BlendViewer_Viewport.dll"  "%OUTPUT_DIR%\" >nul
xcopy "%BUILD_DIR%\BlendViewer" "%OUTPUT_DIR%\BlendViewer\" /e /i /q

echo [2/4] Running windeployqt...
"%QT_DIR%\bin\windeployqt.exe" "%OUTPUT_DIR%\%EXE_NAME%" --qmldir "%~dp0." --compiler-runtime --no-translations --no-system-d3d-compiler --no-opengl-sw

echo [3/4] Cleaning up unnecessary files...
:: rd /s /q "%OUTPUT_DIR%\qml\QtQuick\Controls\FluentWinUI3" 2>nul
:: rd /s /q "%OUTPUT_DIR%\qml\QtQuick\Controls\Fusion"       2>nul
:: rd /s /q "%OUTPUT_DIR%\qml\QtQuick\Controls\Imagine"      2>nul
:: rd /s /q "%OUTPUT_DIR%\qml\QtQuick\Controls\Material"     2>nul
:: rd /s /q "%OUTPUT_DIR%\qml\QtQuick\Controls\Universal"    2>nul
:: rd /s /q "%OUTPUT_DIR%\qml\QtQuick\Controls\Windows"      2>nul
:: rd /s /q "%OUTPUT_DIR%\qml\QtQuick\Dialogs"               2>nul
:: rd /s /q "%OUTPUT_DIR%\qml\QtQuick\Particles"             2>nul
:: rd /s /q "%OUTPUT_DIR%\qml\QtQuick\Timeline"              2>nul
:: rd /s /q "%OUTPUT_DIR%\qml\QtQuick\LocalStorage"          2>nul
:: rd /s /q "%OUTPUT_DIR%\qml\QtQml\XmlListModel"            2>nul
:: del /q "%OUTPUT_DIR%\*.pdb"                               2>nul
:: del /q "%OUTPUT_DIR%\*.ilk"                               2>nul
:: del /q "%OUTPUT_DIR%\*.exp"                               2>nul
:: del /q "%OUTPUT_DIR%\*.lib"                               2>nul

echo [4/4] Done.
echo Output: %OUTPUT_DIR%\%EXE_NAME%

endlocal
pause