#!/bin/bash

bundle exec jekyll build
sed -i 's|<loc>|<loc>https://minn727.github.io|g' _site/sitemap.xml
cp _site/sitemap.xml ./
