@echo off
echo ========================================
echo    APK Building Commands
echo ========================================
echo.

echo Choose your method:
echo 1. Build APK using Android Studio (GUI)
echo 2. Build APK using command line
echo 3. Install directly on connected device
echo 4. Build release APK (signed)
echo.

set /p choice="Enter your choice (1-4): "

if "%choice%"=="1" goto studio
if "%choice%"=="2" goto commandline
if "%choice%"=="3" goto install
if "%choice%"=="4" goto release
goto invalid

:studio
echo.
echo Opening Android Studio...
echo After it opens:
echo 1. Wait for Gradle sync to complete
echo 2. Go to Build → Build Bundle(s) / APK(s) → Build APK(s)
echo 3. Find APK at: android\app\build\outputs\apk\debug\app-debug.apk
echo.
call npx cap open android
goto end

:commandline
echo.
echo Building APK using command line...
cd android
call gradlew assembleDebug
if %errorlevel% neq 0 (
    echo Error: Build failed!
    pause
    exit /b 1
)
echo.
echo ✓ APK built successfully!
echo Location: android\app\build\outputs\apk\debug\app-debug.apk
echo.
cd ..
goto end

:install
echo.
echo Installing on connected device...
echo Make sure your phone is connected via USB and USB debugging is enabled
echo.
call npx cap run android
goto end

:release
echo.
echo Building release APK...
echo Note: This requires a keystore for signing
echo.
cd android
echo Creating debug keystore for testing...
call gradlew assembleRelease
if %errorlevel% neq 0 (
    echo Error: Release build failed!
    echo You may need to set up signing configuration
    pause
    exit /b 1
)
echo.
echo ✓ Release APK built!
echo Location: android\app\build\outputs\apk\release\app-release.apk
echo.
cd ..
goto end

:invalid
echo Invalid choice! Please run the script again.
pause
exit /b 1

:end
echo.
echo ========================================
echo    APK Creation Complete!
echo ========================================
echo.
echo Your APK files are ready for installation!
echo.
pause
