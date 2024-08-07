#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status

# Check if a language slug is provided
if [ $# -ne 1 ]; then
    echo "Please provide a language slug as an argument."
    echo "Usage: $0 <language-slug>"
    exit 1
fi

# Convert the language slug to lowercase
language_slug=$(echo "$1" | tr '[:upper:]' '[:lower:]')

# Define the base directory
base_dir="languages/$language_slug"

# Create the directory structure
mkdir -p "$base_dir/code"
mkdir -p "$base_dir/dockerfiles"

# Create empty files
touch "$base_dir/config.yml"
touch "$base_dir/dockerfiles/$language_slug-<version>.Dockerfile"

echo "Directory structure for $1 has been created successfully."
