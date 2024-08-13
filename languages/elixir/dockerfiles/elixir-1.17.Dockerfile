# syntax=docker/dockerfile:1.7-labs
FROM elixir:1.17.2-alpine

# Ensures the container is re-built if dependency files change
ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="mix.exs"

WORKDIR /app

# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

# Install & cache deps
RUN .codecrafters/compile.sh

# Once the heavy steps are done, we can copy all files back
COPY . /app
