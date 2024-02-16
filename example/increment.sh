#!/bin/bash
set -e

# Find and increment the version number in pubspec.yaml+ and web index.tmpl.html.
perl -i -pe 's/^(version:\s+\d+\.\d+\.\d+\+)(\d+)$/$1.($2+1)/e' pubspec.yaml
export version=`grep 'version: ' pubspec.yaml | sed 's/version: //'`
echo
echo
echo "version is now $version"
echo
echo

# replace in index.tmpl.html as well
rm -f web/index.html.jic
mv web/index.html web/index.html.jic
#sed "s/.*version:.*/version: $version/" web/index.tmpl.html.jic > web/index.tmpl.html
sed "s/VERSION/$version/" web/index.tmpl.html > web/index.html

# Commit and tag this change.
#version=`grep 'version: ' client/pubspec.yaml+ | sed 's/version: //'`
#git commit -m "Bump version to $version" client/pubspec.yaml+
#git tag $version