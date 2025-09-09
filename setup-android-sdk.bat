@echo off
echo ========================================
echo    Android SDK Setup for Photo Carousel
echo ========================================
echo.

echo [1/6] Checking Android SDK installation...
where adb >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Android SDK not found in PATH
    echo Please install Android Studio or Android SDK first
    echo Download from: https://developer.android.com/studio
    pause
    exit /b 1
)
echo ✓ Android SDK found!

echo [2/6] Building web application...
call npm run build
if %errorlevel% neq 0 (
    echo Error: Build failed!
    pause
    exit /b 1
)
echo ✓ Web app built successfully!

echo [3/6] Copying files to www directory...
xcopy dist www /E /I /Y
copy manifest.json www\manifest.json /Y
echo ✓ Files copied to www directory!

echo [4/6] Adding Android platform...
call npx cap add android
if %errorlevel% neq 0 (
    echo Error: Failed to add Android platform
    pause
    exit /b 1
)
echo ✓ Android platform added!

echo [5/6] Syncing project...
call npx cap sync
if %errorlevel% neq 0 (
    echo Error: Sync failed!
    pause
    exit /b 1
)
echo ✓ Project synced!

echo [6/6] Opening Android Studio...
echo.
echo ========================================
echo    Next Steps:
echo ========================================
echo 1. Android Studio should open with your project
echo 2. Wait for Gradle sync to complete
echo 3. Click "Build" → "Build Bundle(s) / APK(s)" → "Build APK(s)"
echo 4. Find your APK at: android\app\build\outputs\apk\debug\app-debug.apk
echo.
echo Alternative: Use command line:
echo   cd android
echo   gradlew assembleDebug
echo.
pause

call npx cap open android
