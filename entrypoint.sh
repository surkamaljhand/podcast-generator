#!/bin/bash

set -e # Ecit on error

echo "==============================="

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /githib/workspace

python3 /usr/bin/feed.py

git add -A 
git commit -m "Update Feed"

# Use the GITHUB_TOKEN to push changes
git push https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git HEAD:${GITHUB_REF}

echo "==============================="
