#!/bin/bash

echo Pushing hugo-coder with message $1...

cd themes/hugo-coder
git add --all
git commit -m "$1"
git push origin master
cd ../..

echo Committing changes to rewong_site_source

git add --all
git commit -m "$1"

hugo

echo Pushing rewong03.github.io with message $1...

cd rewong03.github.io
git add --all
git commit -m "$1"
git push origin master

cd ..

echo Publishing rewong.github.io

git add --all
git commit -m "Publishing site"
git push origin master

