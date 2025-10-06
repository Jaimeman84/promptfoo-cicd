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
│   └── math.txt               # Math calculation prompt template
├── promptfooconfig.yaml       # Promptfoo configuration
├── package.json               # Node.js dependencies
├── setup.sh                   # Unix/Linux/Mac setup script
├── setup.bat                  # Windows setup script
└── README.md                  # This file
```

## GitHub Setup

1. Create a new GitHub repository (can be public or private)
2. Push your code to the repository:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin <your-github-repo-url>
   git branch -M main
   git push -u origin main
   ```
3. Set up the required GitHub repository secret:
   - Go to your repository → Settings → Secrets and variables → Actions
   - Add a new repository secret:
     - Name: `OPENAI_API_KEY`
     - Value: Your OpenAI API key from https://platform.openai.com/api-keys

## How it Works

The framework automatically evaluates prompts when:
- A pull request modifies files in the `prompts/` directory or the `promptfooconfig.yaml` file
- Changes are pushed to any branch (including main)
- Manually triggered via GitHub Actions interface

The evaluation:
- Tests prompt responses against predefined assertions
- Uses GPT-3.5-turbo as the default model
- Caches results to optimize API usage
- Posts results as comments on pull requests
- Generates HTML reports for push events
- Uploads evaluation results as artifacts

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
- Install dependencies from package.json
- Verify your API key is set
- Run the evaluation

Alternatively, you can run the steps manually:

Windows (Command Prompt):
```cmd
mkdir promptfoo-results
npm install
npx promptfoo eval --config promptfooconfig.yaml
```

Unix/Linux/Mac:
```bash
mkdir -p ./promptfoo-results
npm install
npx promptfoo eval --config promptfooconfig.yaml
```

The results will be saved in the `promptfoo-results` directory in both JSON and CSV formats.

## Contributing

1. Create a new branch
2. Make your changes
3. Create a pull request
4. Wait for the automated evaluation results
5. Address any failing assertions

## Security Considerations

This repository can be either public or private:

1. **Public Repository**
   - GitHub secrets are encrypted and secure even in public repositories
   - Secrets are never exposed in logs or to unauthorized users
   - Pull requests from forks cannot access secrets by default
   - Free for unlimited contributors
   - Easy to share and collaborate

2. **Private Repository**
   - Same security for secrets as public repositories
   - May have limitations based on your GitHub plan
   - More restrictive for open source collaboration

## Troubleshooting

1. **Missing Dependencies Lock File**
   - If you see an error about missing lock file, run `npm install` locally first
   - This will generate the package-lock.json file needed by GitHub Actions

2. **API Key Issues**
   - Ensure your OPENAI_API_KEY is correctly set in GitHub repository secrets
   - For local testing, verify the environment variable is set correctly

3. **Output Directory Errors**
   - The setup scripts create the necessary output directories
   - If running manually, ensure you create the promptfoo-results directory 