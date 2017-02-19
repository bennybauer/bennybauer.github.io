# bennybauer.github.io

This repository is the code behind my personal landing page.

The site is built using [hugo](https://gohugo.io/) website engine. It's combined of 2 branches:
* `hugo`: the source code and templates for the site.
* `master`: the generated site that is deployed to the github pages. This branch shouldn't be edited manualy.

## Usage
1. Make sure you're working on the `hugo` branch.
2. Do the changes you want in the code.
3. Test locally by running the site with: `hugo server`
4. Commit and push the changes.
5. To deploy the changes run: `./deploy.sh`
