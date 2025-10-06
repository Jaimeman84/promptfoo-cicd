@echo off

REM Create output directory
mkdir "promptfoo-results" 2>nul

REM Install dependencies
echo Installing dependencies...
npm install

REM Check for OPENAI_API_KEY
if "%OPENAI_API_KEY%"=="" (
    echo Warning: OPENAI_API_KEY is not set. Please set it using:
    echo set OPENAI_API_KEY=your-api-key
    exit /b 1
)

REM Run evaluation
echo Running promptfoo evaluation...
npx promptfoo eval --config promptfooconfig.yaml 