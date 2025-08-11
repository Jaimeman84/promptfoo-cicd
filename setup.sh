#!/bin/bash

# Create output directory
mkdir -p ./promptfoo-results

# Install promptfoo if not already installed
if ! command -v promptfoo &> /dev/null; then
    echo "Installing promptfoo..."
    npm install -g promptfoo
fi

# Check for OPENAI_API_KEY
if [ -z "$OPENAI_API_KEY" ]; then
    echo "Warning: OPENAI_API_KEY is not set. Please set it using:"
    echo "export OPENAI_API_KEY='your-api-key'"
    exit 1
fi

# Run evaluation
echo "Running promptfoo evaluation..."
promptfoo eval --config promptfooconfig.yaml 