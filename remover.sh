#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "This command removes all files in this current directory and child directories. Are you sure? (y/n)"
read response

if [ "$response" = "y" ]
then
    find . -type f -exec shred -uvz {} \;
    find . -type d -exec rm -rf {} \;
    echo "Operation completed succesfully!"
else
    echo "Operation cancelled."
fi
