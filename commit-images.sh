#!/bin/bash

cd images

# Add all images to the staging area
git add .

cd ..

# Commit changes with a descriptive message
git commit -m "add /images"

# Push changes to the remote repository
git push origin main  # Change "master" to your branch name if needed
