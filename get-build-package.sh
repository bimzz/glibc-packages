#!/bin/bash

set -e

TERMUX_PACKAGES_COMMIT="c7766105cddfce208d3bbb27abccccaf82168c63"

git init termux-packages

git -C termux-packages remote add origin \
https://github.com/termux/termux-packages.git

git -C termux-packages fetch \
--depth 1 \
origin "$TERMUX_PACKAGES_COMMIT"

git -C termux-packages checkout \
--detach FETCH_HEAD

for i in build-package.sh clean.sh packages x11-packages root-packages scripts ndk-patches; do
    rm -fr "./${i}"
    cp -r "./termux-packages/${i}" ./
done

rm -fr termux-packages
