#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_product() {
  git checkout product
  git add gfwlst.pac
  git commit -m "Pac file updated at $(date --rfc-3339="seconds")"
}

upload_files() {
  git remote add origin https://${GH_TKN}@github.com/kmahyyg/gfwlist2pac_daily.git
  git push --quiet --set-upstream origin product
}

setup_git
commit_product
upload_files