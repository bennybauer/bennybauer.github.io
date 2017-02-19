#!/usr/bin/env bash

# This script allows you to easily and quickly generate and deploy your website
# using Hugo to your personal GitHub Pages repository. This script requires a
# certain configuration, run the `setup.sh` script to configure this. See
# https://hjdskes.github.io/blog/deploying-hugo-on-personal-github-pages/index.html
# for more information.

# Set the English locale for the `date` command.
export LC_TIME=en_US.UTF-8

if [[ $(git status -s) ]]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

# GitHub username.
USERNAME=bennybauer
# Name of the branch containing the Hugo source files.
SOURCE=hugo
# The commit message.
MESSAGE="Site rebuild $(date)"

msg() {
    printf "\033[1;32m :: %s\n\033[0m" "$1"
}

rm -rf public/*

msg "Building the website"
hugo

msg "Pushing the updated \`public\` folder to the \`master\` branch"
hugo
cd public
git add .
git commit -m "$MESSAGE"
cd ..
git push origin master
