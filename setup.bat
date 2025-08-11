@echo off

REM Create output directory
mkdir "promptfoo-results" 2>nul

REM Check if promptfoo is installed
where promptfoo >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Installing promptfoo...
    npm install -g promptfoo
)

REM Check for OPENAI_API_KEY
if "%OPENAI_API_KEY%"=="" (
    echo Warning: OPENAI_API_KEY is not set. Please set it using:
    echo set OPENAI_API_KEY=your-api-key
    exit /b 1
)

REM Run evaluation
echo Running promptfoo evaluation...
promptfoo eval --config promptfooconfig.yaml 