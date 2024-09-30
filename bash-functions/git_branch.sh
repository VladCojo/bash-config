#!/bin/bash

# Function to display the current Git branch and status
git_branch() {
    local branch=""
    if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1; then
        branch=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always 2>/dev/null)
        if [ -n "$(git status --porcelain)" ]; then
            echo "[$branch ✗]"  # Dirty working directory
        else
            echo "[$branch ✓]"  # Clean working directory
        fi
    fi
}
