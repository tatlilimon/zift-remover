#!/bin/bash

# Get the current working directory where the command is executed
TARGET_DIR="$(pwd)"

# SAFETY PRECAUTION: Strictly prevent execution in critical directories
if [[ "$TARGET_DIR" == "/" || "$TARGET_DIR" == "$HOME" || "$TARGET_DIR" == /etc* || "$TARGET_DIR" == /usr* || "$TARGET_DIR" == /bin* ]]; then
    echo "CRITICAL ERROR: This script cannot be run in the root (/), home (\$HOME), or system directories!"
    echo "Operation aborted to prevent system damage."
    exit 1
fi

echo "=================== WARNING ==================="
echo "This command will IRREVERSIBLY DESTROY files (using shred)."
echo "The current directory where this operation will run is:"
echo "-> $TARGET_DIR"
echo "==============================================="
echo ""
echo "Are you sure you want to delete all files in this directory and its subdirectories?"
echo "If you confirm, type 'YES' in all uppercase:"

read response

if [ "$response" = "YES" ]; then
    echo "Securely destroying files..."
    
    find "$TARGET_DIR" -type f -exec shred -uvz {} +
    
    echo "Cleaning up empty subdirectories..."
    
    # Prevents deleting the target directory itself, only subdirectories
    find "$TARGET_DIR" -mindepth 1 -type d -empty -delete
    
    echo "Operation completed successfully!"
else
    echo "Operation cancelled. No files were deleted."
fi
