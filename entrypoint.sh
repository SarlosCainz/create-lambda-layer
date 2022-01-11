#!/bin/bash

set -eu

PYTHON_DIR=$BUILD_DIR/python

if [ "$1" == "build" ]; then
  if [ ! -d $PYTHON_DIR ]; then
    mkdir $PYTHON_DIR
  fi

  pip3 install -r $BUILD_DIR/requirements.txt -t $PYTHON_DIR
  cd $BUILD_DIR && zip -r layer.zip python
elif [ "$1" == "clean" ]; then
  rm layer.zip
  if [ -d $PYTHON_DIR ]; then
    rm -r $PYTHON_DIR
  fi
fi
