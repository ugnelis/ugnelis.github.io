#!/usr/bin/env bash

if [[ "${CIRCLE_BRANCH}" == "${GH_SRC_BRANCH}" ]]; then

  # Init git and pull repo.
  git config --global user.email "${GH_EMAIL}"
  git config --global user.name "${GH_NAME}"
  git clone "${CIRCLE_REPOSITORY_URL}" out

  # Isolate destination branch.
  cd out

  git checkout "${GH_DST_BRANCH}" || git checkout --orphan "${GH_DST_BRANCH}"
  git rm -rf .

  # Copy over required files.
  cp -a ../public/. .
  cp -a ../.circleci .

  # Push to result.
  git add -A
  git commit -m "Automated deployment: ${CIRCLE_SHA1}" --allow-empty
  git push origin "${GH_DST_BRANCH}"
else
  echo "Skipping deployment from ${GH_SRC_BRANCH}"
fi
