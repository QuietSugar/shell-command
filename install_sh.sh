#!/bin/bash

. ./utils.sh

#uninstall
install_sh_dir common
install_sh_dir git-plus
install_sh_dir file

echo $OS
if [ "Windows_NT" = "$OS" ] ;then
  echo '---....'
  install_sh_dir win
fi

# done
install_done



