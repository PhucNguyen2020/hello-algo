#!/usr/bin/env bash
set -e

export LANG=C.UTF-8
export LC_ALL=C.UTF-8
export PYTHONUTF8=1
export PYTHONIOENCODING=utf-8

pip install --quiet mkdocs-material==9.5.5 mkdocs-glightbox

mkdir -p build/overrides build/docs
cp -r overrides/. build/overrides/
cp -r docs/. build/docs/
mkdocs build -f mkdocs.yml

for lang in zh-hant en ja ru vi; do
  mkdir -p "build/$lang/docs"
  cp -r "$lang/docs/." "build/$lang/docs/"
  mkdocs build -f "$lang/mkdocs.yml"
done
