#!/bin/bash

# clean-up-specify-kit.sh
# Script to clean up Specify Kit files and directories

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Starting Specify Kit cleanup...${NC}"
echo ""

# Track if any deletions were made
deletions_made=false

# Delete .claude/commands files
files_to_delete=(
    ".claude/commands/plan.md"
    ".claude/commands/specify.md"
    ".claude/commands/tasks.md"
)

for file in "${files_to_delete[@]}"; do
    if [ -f "$file" ]; then
        rm "$file"
        echo -e "${GREEN}✓${NC} Deleted: $file"
        deletions_made=true
    else
        echo -e "${YELLOW}○${NC} File not found: $file"
    fi
done

# Delete .specify directory and all its subdirectories
if [ -d ".specify" ]; then
    rm -rf ".specify"
    echo -e "${GREEN}✓${NC} Deleted: .specify directory and all its contents"
    deletions_made=true
else
    echo -e "${YELLOW}○${NC} Directory not found: .specify"
fi

echo ""
if [ "$deletions_made" = true ]; then
    echo -e "${GREEN}Cleanup completed successfully!${NC}"
else
    echo -e "${YELLOW}No files or directories to clean up.${NC}"
fi