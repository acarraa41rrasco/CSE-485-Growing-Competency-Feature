#!/bin/bash
# created a title for this health checking application
# now to add a status check comment for feature branch
echo "--Git Reposo Health Check--"
# the scanning in progress message along with spacer
echo "Scanning current directory for Git repos..."
echo "--------------------------------------------------"
# here the script
for d in */; do
    if [ -d "$d/.git" ]; then
        echo "Repository: $d"
        cd "$d" || continue
        branch=$(git branch --show-current)
        echo "Branch: $branch"
        status=$(git status --porcelain)
        if [ -z "$status" ]; then
	    # no uncommitted changes
            echo "Status: Clean"
        else
            echo "Status: Modified / Uncommitted changes detected:"
            git status -s | sed 's/^/      /'
        fi
        cd ..
	# spacer
        echo "--------------------------------------------------"
    fi
done
echo "Health check has been COMPLETED!!"
echo "TESTING ONE FEATURE for health sequence"