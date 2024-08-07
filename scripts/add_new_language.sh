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
echo "Created $base_dir/code"

mkdir -p "$base_dir/dockerfiles"
echo "Created $base_dir/dockerfiles"

if [ ! -f "$base_dir/config.yml" ]; then
    cat << EOF > "$base_dir/config.yml"
attributes:
  required_executable: '<placeholder>'
  user_editable_file: '<placeholder>'
EOF
    echo "Created $base_dir/config.yml"
else
    echo "Skipped creating $base_dir/config.yml (file already exists)"
fi

if [ ! -f "$base_dir/dockerfiles/$language_slug-<version>.Dockerfile" ]; then
    cat << EOF > "$base_dir/dockerfiles/$language_slug-<version>.Dockerfile"
# syntax=docker/dockerfile:1.7-labs
FROM <placeholder-base-image>

# Ensures the container is re-built if dependency files change
ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="<placeholder-dependency-files>"

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

# Install language-specific dependencies
RUN <placeholder-dependency-installation-command>

# Once the heavy steps are done, we can copy all files back
COPY . /app
EOF
    echo "Created $base_dir/dockerfiles/$language_slug-<version>.Dockerfile"
else
    echo "Skipped creating $base_dir/dockerfiles/$language_slug-<version>.Dockerfile (file already exists)"
fi
