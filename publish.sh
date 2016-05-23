#!/bin/bash

set -e

echo "$0: Building Home.elm ..."
./build

# go to the public directory and create a *new* Git repo
cd public
git init

# inside this git repo we'll pretend to be a new user
git config user.name "Travis CI"
git config user.email "maxime@nomalab.com"

echo "$0: Deploy to GitHub Pages ..."
# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".
git add .
git commit -m "Deploy to GitHub Pages"

# Force push from the current repo's master branch to the remote
# repo's gh-pages branch. (All previous history on the gh-pages branch
# will be lost, since we are overwriting it.) We redirect any output to
# /dev/null to hide any sensitive credential data that might otherwise be exposed.
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:master > /dev/null 2>&1

echo ""
echo "$0: fin."
echo ""
