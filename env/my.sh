#!/bin/bash

export XU_BIN_PATH=${HOME}"/.xu/bin"
if [ -d "$XU_BIN_PATH" ] ; then
   export PATH="$XU_BIN_PATH:$PATH"
fi
