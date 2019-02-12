#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_product() {
  git fetch
  git pull
  git checkout -b product
  git add gfwlst.pac
  git commit -m "Pac file updated at $(date --rfc-3339="seconds")"
}

upload_files() {
  git remote set-url origin https://${GH_TKN}@github.com/kmahyyg/gfwlist2pac_daily.git
  git push -f --set-upstream origin product
}

setup_git
commit_product
upload_files
