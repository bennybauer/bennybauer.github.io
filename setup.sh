#!/usr/bin/env bash

# This script does the required work to set up your personal GitHub Pages
# repository for deployment using Hugo. Run this script only once -- when the
# setup has been done, run the `deploy.sh` script to deploy changes and update
# your website. See
# https://hjdskes.github.io/blog/deploying-hugo-on-personal-github-pages/index.html
# for more information.

# GitHub username
USERNAME=bennybauer
# Name of the branch containing the Hugo source files.
SOURCE=hugo

msg() {
    printf "\033[1;32m :: %s\n\033[0m" "$1"
}

msg "Deleting the \`master\` branch"
git branch -D master
git push origin --delete master

msg "Creating an empty, orphaned \`master\` branch"
git checkout --orphan master
git reset --hard
git commit --allow-empty -m "Initializing master branch"
git push origin master

msg "Returning to the \`$SOURCE\` branch"
git checkout -f "$SOURCE"

msg "Add \`master\` as a worktree under \`public\`"
git worktree add public master
