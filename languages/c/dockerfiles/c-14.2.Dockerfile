# syntax=docker/dockerfile:1.7-labs
FROM gcc:14.2.0

# Ensures the container is re-built if dependency files change
# ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="<placeholder-dependency-files>"

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

# Install language-specific dependencies
RUN .codecrafters/compile.sh