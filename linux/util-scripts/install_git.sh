#!/usr/bin/env bash

setup_git() {
    if ! command -v git &> /dev/null; then
        echo "Git is not installed. Installing..."
        sudo apt -y install git
        if [ $? -ne 0 ]; then
            echo "Failed to install git. Please check your package manager."
            exit 1
        fi
    else
        echo "Git is already installed."
    fi

    # Set up global git configuration
    git config --global init.defaultbranch main

    # Configure git user details
    read -p "Enter your Git username: " git_username
    read -p "Enter your Git email: " git_email

    git config --global user.name "$git_username"
    git config --global user.email "$git_email"

    echo "Git setup complete."
}

setup_git
