#!/bin/bash

mkdir build
cd build

BUILD_CONFIG="Debug"

cmake .. -G "Ninja"\
    -Wno-dev \
    -DCMAKE_BUILD_TYPE:STRING=$BUILD_CONFIG \
    -DCMAKE_OSX_ARCHITECTURES:STRING=${OSX_ARCH} \
    -DCMAKE_OSX_DEPLOYMENT_TARGET:STRING="10.9" \
    -DCMAKE_OSX_SYSROOT:STRING="/opt/MacOSX10.9.sdk" \
    -DCMAKE_INSTALL_PREFIX:PATH=${PREFIX} \
    -DITK_USE_FLAT_DIRECTORY_INSTALL:BOOL=ON \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DBUILD_EXAMPLES:BOOL=OFF \
    -DBUILD_TESTING:BOOL=OFF \
    -DITK_LEGACY_SILENT:BOOL=ON \
    -DCMAKE_CXX_STANDARD:STRING="11" \
    -DCMAKE_CXX_STANDARD_REQUIRED:BOOL=ON \
    -DModule_ITKReview:BOOL=ON \
    -DITK_USE_REVIEW_STATISTICS:BOOL=ON \
    -DITK_USE_OPTIMIZED_REGISTRATION_METHODS:BOOL=ON

ninja install
