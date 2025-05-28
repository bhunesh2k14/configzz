#!/usr/bin/env bash

# This script sets up a Linux environment by installing necessary packages and updating the system.
sudo apt -y update

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install git
source "$SCRIPT_DIR/util-scripts/install_git.sh"
