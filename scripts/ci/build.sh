#!/usr/bin/env bash
set -euo pipefail

# https://tdlib.github.io/td/build.html?language=Python

cd td
rm -rf build
mkdir build
cd build

CXXFLAGS="-stdlib=libc++" \
    CC=/usr/bin/clang-18 \
    CXX=/usr/bin/clang++-18 \
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX:PATH=../tdlib \
        -DTD_ENABLE_LTO=ON \
        -DCMAKE_AR=/usr/bin/llvm-ar-18 \
        -DCMAKE_NM=/usr/bin/llvm-nm-18 \
        -DCMAKE_OBJDUMP=/usr/bin/llvm-objdump-18 \
        -DCMAKE_RANLIB=/usr/bin/llvm-ranlib-18 \
        ..

cmake --build . --target install

cd ..
cd ..
ls -alh td/tdlib
tree td/tdlib
