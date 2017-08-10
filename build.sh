#!/bin/bash

echo 'Creating output directories...'
mkdir -p build
mkdir -p pdf

echo 'Checking whether we are running in CI environment...'
if [ $CI ]
then
    echo 'Running in CI, copying fonts...'
    sudo mkdir -p /usr/share/fonts/
    sudo cp ./fonts/* /usr/share/fonts/
    sudo mkfontscale
    sudo mkfontdir
    sudo fc-cache -fv
fi

echo 'Invoking XeLaTeX...'
xelatex -shell-escape -interaction=nonstopmode -output-directory=build ./*.tex
mv ./build/*.pdf ./pdf/

