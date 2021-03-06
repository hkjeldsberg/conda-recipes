## Program: VMTK
## Language:  Python
## Date:      January 30, 2018
## Version:   1.4
##
##   Copyright (c) Richard Izzo, Luca Antiga, All rights reserved.
##   See LICENCE file for details.
##
##      This software is distributed WITHOUT ANY WARRANTY; without even
##      the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
##      PURPOSE.  See the above copyright notices for more information.
##
## Note: this code was contributed by
##       Richard Izzo (Github @rlizzo)
##       University at Buffalo

# Install and set up miniconda.
if [ $TRAVIS_OS_NAME == "linux" ]; then wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh; fi
if [ $TRAVIS_OS_NAME == "osx" ]; then wget http://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O miniconda.sh; fi
if [ $TRAVIS_OS_NAME == "osx" ]; then cd $HOME && mkdir MacOSX-SDKs && cd MacOSX-SDKs && wget https://github.com/phracker/MacOSX-SDKs/releases/download/10.13/MacOSX10.9.sdk.tar.xz && tar -xf ./MacOSX10.9.sdk.tar.xz && rm MacOSX10.9.sdk.tar.xz && cd $TRAVIS_BUILD_DIR; fi
bash miniconda.sh -b -p $CONDA_INSTALL_LOCN
export PATH=${CONDA_INSTALL_LOCN}/bin:$PATH
conda config --set always_yes true

conda install --quiet -y conda conda-build anaconda-client

# set the ordering of additional channels
conda config --prepend channels vmtk

# To ease debugging, list installed packages
conda info -a
conda list

# Only upload if this is NOT a pull request.
if [ "$TRAVIS_PULL_REQUEST" = "false" ] && \
    [ $TRAVIS_REPO_SLUG = "vmtk/conda-recipes" ] && \
    [ "$TRAVIS_BRANCH" == "master" ]; then
    conda config --set anaconda_upload true
    conda config --set anaconda_token $BINSTAR_TOKEN
    echo "Uploading enabled";
else
    echo "Uplading disabled";
fi