#!/bin/bash

echo Pushing hugo-coder with message $1...

cd themes/hugo-coder
git add --all
git commit -m "$1"
git push origin master
cd ../..

hugo

echo Pushing rewong03.github.io with message $1...

cd rewong03.github.io
git add --all
git commit -m "$1"
git push origin master

cd ..

echo Pushing rewong03_site_source with message $1...
git add --all
git commit -m "$1"
git push origin master
