#!/bin/sh
#
# CodeCrafters executes this script when testing your code.
#
# - This script is run after compile.sh
# - This script is copied to the root directory and renamed to a challenge-specific
#   script name (like ./spawn_redis_server.sh)
# - The output from this script must ONLY contain the program's output, any additional
#   output might interfere with testers that need to assert stdout/stderr.

# Ensure the script exits if any command fails
set -e

# Go compilation times are usually fast, so we run `go build` every time instead of
# compiling in compile.sh.
tmpFile=$(mktemp)
go build -o "$tmpFile" app/*.go
exec "$tmpFile" "$@"
