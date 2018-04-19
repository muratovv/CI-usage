#!/bin/bash

set -e
set -x

if [[ "$(uname -s)" == 'Darwin' ]]; then
    if which pyenv > /dev/null; then
        eval "$(pyenv init -)"
    fi
    pyenv activate conan
fi

if [[ "$(uname -s)" == 'Linux' ]]; then
    CC=$C_COMPILER
    CXX=$CXX_COMPILER
fi

rm -rf build
mkdir build && cd build
conan install .. -s build_type=$BUILD_TYPE
cmake .. -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DCMAKE_C_COMPILER=$C_COMPILER -DCMAKE_CXX_COMPILER=$CXX_COMPILER
cmake --build . -- VERBOSE=1
ctest -V
