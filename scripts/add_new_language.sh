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

if [ -z "$(ls -A "$base_dir/dockerfiles/$language_slug-"*.Dockerfile 2>/dev/null)" ]; then
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

# Create .codecrafters/compile.sh
if [ ! -f "$base_dir/code/.codecrafters/compile.sh" ]; then
    mkdir -p "$base_dir/code/.codecrafters"
    cat << EOF > "$base_dir/code/.codecrafters/compile.sh"
#!/bin/sh
#
# This script is used to compile your program on CodeCrafters
#
# This runs before .codecrafters/run.sh
#
# Learn more: https://codecrafters.io/program-interface

set -e # Exit on failure

<placeholder-compilation-command>
EOF
    chmod +x "$base_dir/code/.codecrafters/compile.sh"
    echo "Created $base_dir/code/.codecrafters/compile.sh"
else
    echo "Skipped creating $base_dir/code/.codecrafters/compile.sh (file already exists)"
fi

# Create .codecrafters/run.sh
if [ ! -f "$base_dir/code/.codecrafters/run.sh" ]; then
    mkdir -p "$base_dir/code/.codecrafters"
    cat << EOF > "$base_dir/code/.codecrafters/run.sh"
#!/bin/sh
#
# This script is used to run your program on CodeCrafters
#
# This runs after .codecrafters/compile.sh
#
# Learn more: https://codecrafters.io/program-interface

set -e # Exit on failure

<placeholder-run-command>
EOF
    chmod +x "$base_dir/code/.codecrafters/run.sh"
    echo "Created $base_dir/code/.codecrafters/run.sh"
else
    echo "Skipped creating $base_dir/code/.codecrafters/run.sh (file already exists)"
fi