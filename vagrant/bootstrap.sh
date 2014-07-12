#!/bin/bash

echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

# Essentials & dependencies
sudo apt-get update
sudo apt-get install -y build-essential
sudo apt-get install -y curl git-core
sudo apt-get install -y libcurl4-openssl-dev libssl-dev
sudo apt-get install -y python-software-properties