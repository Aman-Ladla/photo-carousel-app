@echo off
echo ========================================
echo    Photo Carousel APK Creator
echo ========================================
echo.

echo [1/4] Building web application...
call npm run build
if %errorlevel% neq 0 (
    echo Error: Build failed!
    pause
    exit /b 1
)

echo [2/4] Copying files to www directory...
xcopy dist www /E /I /Y
if %errorlevel% neq 0 (
    echo Error: Copy failed!
    pause
    exit /b 1
)

echo [3/4] Copying manifest file...
copy manifest.json www\manifest.json /Y

echo [4/4] Starting development server...
echo.
echo ========================================
echo    Your app is ready!
echo ========================================
echo.
echo To install on your phone:
echo 1. Make sure your phone and computer are on the same WiFi
echo 2. Open Chrome on your phone
echo 3. Go to: http://192.168.0.104:3000
echo 4. Tap "Add to Home Screen" in Chrome menu
echo.
echo For APK creation:
echo - Use PWA Builder: https://www.pwabuilder.com/
echo - Use PhoneGap Build: https://www.phonegap.com/build/
echo - Or install Android Studio for full control
echo.
echo Press any key to start the server...
pause >nul

echo Starting server...
call npm run dev
