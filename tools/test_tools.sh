#!/usr/bin/env bash

# wrk & wrk2 test tool
git clone https://github.com/wg/wrk.git --depth 1
cd wrk
make --quiet
mv ./wrk ~/.local/bin/wrk
cd ..
rm -rf wrk/

git clone https://github.com/giltene/wrk2.git --depth 1
cd wrk2
make --quiet
mv ./wrk ~/.local/bin/wrk2
cd ..
rm -rf wrk2/
