#!/bin/bash

# Create output directory
mkdir -p ./promptfoo-results

# Install dependencies
echo "Installing dependencies..."
npm install

# Check for OPENAI_API_KEY
if [ -z "$OPENAI_API_KEY" ]; then
    echo "Warning: OPENAI_API_KEY is not set. Please set it using:"
    echo "export OPENAI_API_KEY='your-api-key'"
    exit 1
fi

# Run evaluation
echo "Running promptfoo evaluation..."
npx promptfoo eval --config promptfooconfig.yaml 