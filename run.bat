@echo off
setlocal
cd /d "%~dp0"
where py >nul 2>&1
if %errorlevel%==0 (set PY=py) else (set PY=python)
if not exist ".venv\Scripts\python.exe" (
  echo Creation de l'environnement Python...
  %PY% -3.11 -m venv .venv
  if errorlevel 1 %PY% -m venv .venv
)
call ".venv\Scripts\activate.bat"
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
set IMAGE_MODEL_ID=OpenVINO/stable-diffusion-v1-5-int8-ov
set IMAGE_WIDTH=256
set IMAGE_HEIGHT=256
set IMAGE_ECO_THREADS=2
set IMAGE_NORMAL_THREADS=3
set IMAGE_ECO_STEPS=4
set IMAGE_NORMAL_STEPS=6
python -m app.main
pause
