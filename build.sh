#!/bin/bash

# This script will trigger a build. Put it in the root directory of the repo you want to trigger a build for. Pipelines should share names with repos

jenkins_url=${JENKINS_URL:-'http://192.168.56.135:8080'}
repository=$(basename $(pwd))
token=${JENKINS_TOKEN:-'jenkins-token'}

echo $token
# Push the most recent commits to the current branch
git push
curl "$jenkins_url/buildByToken/build?job=$repository&token=$token"


