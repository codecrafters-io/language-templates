#!/bin/sh
#
# CodeCrafters runs this script before running all tests.
#
# - This script is commonly used to speed up heavy compilation steps.
# - The output of this script will be rendered with the "[compile]" prefix.

# Ensure the script exits if any command fails
set -e

# Go doesn't use a compile step at the moment, so this is a no-op
exit 0
