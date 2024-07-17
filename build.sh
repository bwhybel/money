#!/bin/sh
sed -i 's/:var tr=transactions/:eval never/g' ./money/index.org
emacs -Q --script build-site.el
