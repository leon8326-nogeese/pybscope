#!/bin/bash

set -e  # Exit on error

# Ensure required packages are installed
if ! command -v git &> /dev/null || ! command -v python3 &> /dev/null; then
    echo "Error: Git and Python3 are required. Install them and try again."
    exit 1
fi

# Create ~/.nogeese directory if it doesn't exist
mkdir -p ~/.nogeese/pybscope/env

# Create a virtual environment
python3 -m venv ~/.nogeese/pybscope/env/pybscope-env

# Activate the virtual environment
source ~/.nogeese/pybscope/env/pybscope-env/bin/activate

# Upgrade pip and install pybscope from PyPI
pip install --upgrade pip
pip install pybscope

# Download source
if [ -f ~/.nogeese/pybscope/src ]; then
    cd ~/.nogeese/pybscope/src
    git pull
else
    git clone https://github.com/leon8326-nogeese/pybscope.git ~/.nogeese/pybscope/src -b src
fi
# Reload bash config (if necessary)
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

clear
echo "Installation successful!"
echo "Now you can add scripts (example: 'from pybscope.example import say')"
echo "Run 'pybscope' to integrate it into your builds."
echo "Also if you want to get into it's environment run 'pybscope env'."
echo "And to get out of it: 'pybscope env-get-out'." 
exec "$SHELL"
