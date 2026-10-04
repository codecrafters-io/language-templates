# syntax=docker/dockerfile:1.7-labs
FROM library/alpine:3.23

run apk add --no-cache dub ldc~1.41 build-base

# Ensures the container is re-built if dependency files change
ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="dub.sdl"

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

# Install language-specific dependencies
RUN .codecrafters/compile.sh
