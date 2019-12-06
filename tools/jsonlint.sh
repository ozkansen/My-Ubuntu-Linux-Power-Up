#!/usr/bin/env bash

git clone https://github.com/p-ranav/jsonlint.git ~/tmp/jsonlint/
cd ~/tmp/jsonlint/ && mkdir build && cd build
cmake .. && make && make check
mv jsonlint ~/bin/
rm -rf ~/tmp/jsonlint/
