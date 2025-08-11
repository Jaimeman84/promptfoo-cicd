# Promptfoo CI/CD Testing Framework

This repository contains a simple promptfoo testing framework integrated with GitHub Actions for continuous prompt evaluation.

## Structure

```
.
├── .github/
│   └── workflows/
│       └── prompt-eval.yml    # GitHub Actions workflow
├── prompts/
│   ├── greeting.txt           # Greeting prompt template
│   └── math.txt              # Math calculation prompt template
├── promptfooconfig.yaml       # Promptfoo configuration
└── README.md                 # This file
```

## Setup

1. Clone this repository
2. Set up the following GitHub repository secrets:
   - `OPENAI_API_KEY`: Your OpenAI API key

## How it Works

The framework automatically evaluates prompts when:
- A pull request modifies files in the `prompts/` directory or the `promptfooconfig.yaml` file
- Changes are pushed to the main branch

The evaluation:
- Tests prompt responses against predefined assertions
- Uses GPT-3.5-turbo as the default model
- Caches results to optimize API usage
- Posts results as comments on pull requests

## Test Cases

1. Greeting Test:
   - Tests if the response contains a proper greeting with the provided name
   - Ensures no error messages in the response

2. Math Calculation Test:
   - Tests if the response contains the correct sum
   - Verifies the presence of mathematical terminology

## Local Testing

### For Windows Users:

1. Set your OpenAI API key (in Command Prompt):
```cmd
set OPENAI_API_KEY=your-api-key
```

2. Run the setup script:
```cmd
setup.bat
```

### For Unix/Linux/Mac Users:

1. Make the setup script executable:
```bash
chmod +x setup.sh
```

2. Set your OpenAI API key:
```bash
export OPENAI_API_KEY='your-api-key'
```

3. Run the setup script:
```bash
./setup.sh
```

The script will:
- Create necessary directories
- Install promptfoo if not already installed
- Verify your API key is set
- Run the evaluation

Alternatively, you can run the steps manually:

Windows (Command Prompt):
```cmd
mkdir promptfoo-results
npm install -g promptfoo
promptfoo eval --config promptfooconfig.yaml
```

Unix/Linux/Mac:
```bash
mkdir -p ./promptfoo-results
npm install -g promptfoo
promptfoo eval --config promptfooconfig.yaml
```

The results will be saved in the `promptfoo-results` directory in both JSON and CSV formats.

## Contributing

1. Create a new branch
2. Make your changes
3. Create a pull request
4. Wait for the automated evaluation results
5. Address any failing assertions 