#!/bin/bash
file_path=$1

filesToRemove=$(find "$file_path" -type f  -mtime +7)
coreDumps=$(find "$file_path" -type f -name "*core*")
fileSizeBefore=$(du -sh "$file_path" | cut -f1)

echo "Files to remove:" $(echo "$filesToRemove" | grep -c .)
echo "$filesToRemove"
echo "Core dumps: $(echo "$coreDumps" | grep -c .)"
echo "$coreDumps"

echo "Do you want to remove these files? (y/n)"
read answer

if [[ "$answer" == "y" ]]; then
    echo "Deleting files..."
    find "$file_path" -type f -mtime +7 -delete
    echo "Deleting core dumps..."
    find "$file_path" -type f -name "*core*" -delete
    echo "Files removed successfully."
elif [[ "$answer" == "n" ]]; then
    echo "Action forfeit"
else
    echo "Not valid entry"
fi

echo "Folder size before cleanup:"
echo "$fileSizeBefore"
echo "Folder size after cleanup:"
du -sh "$file_path"


