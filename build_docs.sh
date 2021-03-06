#!/bin/sh

touch .nojekyll
cd ./docs
make html
cd ../

git checkout gh-pages

cp -rf ./docs/_build/html/* ./

git add *.html searchindex.js objects.inv .buildinfo _static/ _sources/
git commit -m "updated docs html build."
git pull origin gh-pages
git push origin gh-pages

git checkout -f master
