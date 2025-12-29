@echo off
REM Juanma Football Analyser - Windows Installation Script
REM Este script instala automaticamente la app en Windows

echo ========================================
echo Juanma Football Analyser - Instalador
echo ========================================
echo.

REM Verificar si Git esta instalado
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo ERROR: Git no esta instalado
    echo Descarga Git desde: https://git-scm.com/download/win
    pause
    exit /b 1
)

REM Verificar si Node.js esta instalado
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo ERROR: Node.js no esta instalado
    echo Descarga Node.js desde: https://nodejs.org/
    pause
    exit /b 1
)

echo [1/5] Clonando repositorio...
git clone https://github.com/juanmafdez8-arch/juanma-football-analyser.git
cd juanma-football-analyser

echo.
echo [2/5] Instalando dependencias...
call npm install

echo.
echo [3/5] Instalando Expo CLI globalmente...
call npm install -g expo-cli

echo.
echo [4/5] Instalando dependencias de video analysis...
call pip install opencv-python mediapipe numpy

echo.
echo [5/5] Creando archivo .env.local...
if not exist .env.local (
    (
        echo EXPO_PUBLIC_SUPABASE_URL=https://iwdgowrbcavknzkurpsk.supabase.co
        echo EXPO_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
    ) > .env.local
    echo .env.local creado. Actualiza con tus credenciales de Supabase si es necesario.
)

echo.
echo ========================================
echo ^! INSTALACION COMPLETADA ^!
echo ========================================
echo.
echo Para iniciar la app, ejecuta:
echo   npx expo start
echo.
echo Luego abre el QR con Expo Go en tu movil.
echo Expo Go: https://expo.dev/client
echo.
echo Para analizar videos de futbol:
echo   python scripts/video-analyzer.py --video "tu_video.mp4"
echo.
pause
