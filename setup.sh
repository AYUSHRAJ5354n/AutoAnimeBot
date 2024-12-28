#!/bin/bash

# Update package list
sudo apt-get update

# Install mediainfo
sudo apt-get install -y mediainfo

# Install Python dependencies
pip install -r requirements.txt
