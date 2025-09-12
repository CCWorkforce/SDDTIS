#!/bin/bash

set -e

echo "Checking for uv installation..."

if ! command -v uv &> /dev/null; then
    echo "uv not found. Installing uv..."
    
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if command -v brew &> /dev/null; then
            brew install uv
        else
            echo "Installing uv via curl..."
            curl -LsSf https://astral.sh/uv/install.sh | sh
            source ~/.bashrc 2>/dev/null || source ~/.zshrc 2>/dev/null || true
        fi
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "Installing uv via curl..."
        curl -LsSf https://astral.sh/uv/install.sh | sh
        source ~/.bashrc 2>/dev/null || source ~/.zshrc 2>/dev/null || true
    else
        echo "Unsupported OS. Please install uv manually: https://docs.astral.sh/uv/getting-started/installation/"
        exit 1
    fi
else
    echo "uv is already installed."
fi

echo "Running uvx --from git+https://github.com/github/spec-kit.git..."
uvx --from git+https://github.com/github/spec-kit.git