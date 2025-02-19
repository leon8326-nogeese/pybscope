#!/bin/bash

mkdir ~/.nogeese # Makes ~/.nogeese if it doesn't exist.
mkdir ~/.nogeese/pybscope
git clone https://github.com/leon8326-nogeese/pybscope.git ~/.nogeese/pybscope/src
python3 -m venv ~/.nogeese/pybscope/env
source ~/.nogeese/pybscope/env/bin/activate
pip install --upgrade pip
pip install pybscope
source ~/.bashrc
clear
echo "Installation succesful!"
echo "Now you can add scripts (example: say from pybscope.example) and run 'pybscope' to integrate it to your builds."
exit
