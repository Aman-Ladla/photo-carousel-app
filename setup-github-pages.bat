@echo off
echo ========================================
echo    GitHub Pages Setup for Photo Carousel
echo ========================================
echo.

echo [1/6] Building the application...
call npm run build
if %errorlevel% neq 0 (
    echo Error: Build failed!
    pause
    exit /b 1
)
echo ✓ Application built successfully!

echo [2/6] Adding all files to Git...
git add .
if %errorlevel% neq 0 (
    echo Error: Git add failed!
    pause
    exit /b 1
)
echo ✓ Files added to Git!

echo [3/6] Committing changes...
git commit -m "Initial commit: Photo Carousel App"
if %errorlevel% neq 0 (
    echo Error: Git commit failed!
    pause
    exit /b 1
)
echo ✓ Changes committed!

echo.
echo ========================================
echo    Next Steps:
echo ========================================
echo.
echo 1. Go to GitHub.com and create a new repository
echo 2. Name it: photo-carousel-app
echo 3. Make it PUBLIC (required for GitHub Pages)
echo 4. Don't initialize with README (we already have one)
echo 5. Copy the repository URL
echo.
echo 6. Run these commands:
echo    git remote add origin https://github.com/YOURUSERNAME/photo-carousel-app.git
echo    git branch -M main
echo    git push -u origin main
echo.
echo 7. Go to your repository settings
echo 8. Scroll down to "Pages" section
echo 9. Select "Deploy from a branch"
echo 10. Choose "main" branch and "/ (root)" folder
echo 11. Click "Save"
echo.
echo 12. Wait 5-10 minutes for deployment
echo 13. Your app will be live at:
echo     https://YOURUSERNAME.github.io/photo-carousel-app
echo.
echo ========================================
echo    Benefits of GitHub Pages:
echo ========================================
echo.
echo ✅ FREE hosting
echo ✅ Custom domain support
echo ✅ HTTPS enabled
echo ✅ Mobile-friendly
echo ✅ PWA installation
echo ✅ Easy updates (just push to GitHub)
echo ✅ Version control
echo ✅ Collaboration features
echo.
echo Press any key to continue...
pause >nul

echo.
echo Opening GitHub in your browser...
start https://github.com/new
echo.
echo Follow the steps above to complete the setup!
