#!/bin/bash

. ./utils.sh

install_sh_dir common
install_sh_dir git-plus
install_sh_dir file

install_env env

if [ "Windows_NT" = "$OS" ] ;then
  # echo 'Windows OS'
  install_sh_dir win
fi

# done
install_done



