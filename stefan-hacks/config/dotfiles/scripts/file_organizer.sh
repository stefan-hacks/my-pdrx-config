#!/bin/bash
# File Organizer Script
# Organizes files by extension

echo "=== FILE ORGANIZER ==="

# Create folders for different file types
mkdir -p Documents Images Archives Other

# Move files to appropriate folders
for file in *; do
    # Skip directories
    [ -d "$file" ] && continue
    
    # Get file extension
    ext="${file##*.}"
    
    # Organize by extension
    case "$ext" in
        txt|pdf|docx)
            echo "Moving $file to Documents/"
            mv "$file" Documents/
            ;;
        jpg|png|gif)
            echo "Moving $file to Images/"
            mv "$file" Images/
            ;;
        zip|tar|gz)
            echo "Moving $file to Archives/"
            mv "$file" Archives/
            ;;
        *)
            echo "Moving $file to Other/"
            mv "$file" Other/
            ;;
    esac
done

echo "=== ORGANIZATION COMPLETE ==="
echo "Summary:"
echo "Documents: $(ls Documents/ 2>/dev/null | wc -l) files"
echo "Images: $(ls Images/ 2>/dev/null | wc -l) files"
echo "Archives: $(ls Archives/ 2>/dev/null | wc -l) files"
echo "Other: $(ls Other/ 2>/dev/null | wc -l) files"
