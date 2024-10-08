#!/bin/sh
#
# This script is used to run your program on CodeCrafters
#
# This runs after .codecrafters/compile.sh
#
# Learn more: https://codecrafters.io/program-interface

set -e # Exit on failure

exec swift run -c release --skip-build --build-path /tmp/codecrafters-build-{{course_slug}}-swift build-your-own-{{course_slug}} "$@"
