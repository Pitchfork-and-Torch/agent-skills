#!/bin/bash
set -e

# This script helps initialize the ideas directory for the idea-refine skill.
# Resolve the repo root from this script so callers can run it from any CWD.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# skills/idea-refine/scripts -> repo root is three levels up
ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
IDEAS_DIR="$ROOT/docs/ideas"

if [ ! -d "$IDEAS_DIR" ]; then
  mkdir -p "$IDEAS_DIR"
  echo "Created directory: $IDEAS_DIR" >&2
else
  echo "Directory already exists: $IDEAS_DIR" >&2
fi

# Emit a stable relative path for agents that expect docs/ideas under the repo.
echo "{\"status\": \"ready\", \"directory\": \"docs/ideas\", \"absolute\": \"$IDEAS_DIR\"}"
