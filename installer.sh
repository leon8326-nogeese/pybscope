#!/bin/bash

set -e  # Exit on error

# Ensure required packages are installed
if ! command -v git &> /dev/null || ! command -v python3 &> /dev/null; then
    echo "Error: Git and Python3 are required. Install them and try again."
    exit 1
fi

# Create ~/.nogeese directory if it doesn't exist
mkdir -p ~/.nogeese/pybscope

# Clone the repository only if it doesn't exist
if [ ! -d ~/.nogeese/pybscope/src ]; then
    git clone https://github.com/leon8326-nogeese/pybscope.git ~/.nogeese/pybscope/src
else
    cd ~/.nogeese/pybscope/src && git pull
fi

# Create a virtual environment
python3 -m venv ~/.nogeese/pybscope/env

# Activate the virtual environment
source ~/.nogeese/pybscope/env/bin/activate

# Upgrade pip and install from local source
pip install --upgrade pip
pip install ~/.nogeese/pybscope/src

# Reload bash config (if necessary)
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

clear
echo "Installation successful!"
echo "Now you can add scripts (example: 'from pybscope.example import say')"
echo "Run 'pybscope' to integrate it into your builds."

exec "$SHELL"
