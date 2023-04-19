#!/bin/bash

. ./utils.sh

install_sh_dir bash/common
install_sh_dir bash/git-plus
install_sh_dir bash/file

install_env bash/env

if [ "Windows_NT" = "$OS" ] ;then
  # echo 'Windows OS'
  install_sh_dir bat
fi

# done
install_done



