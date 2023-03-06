

# set user's private env if it exists
if [ -d "$HOME/.xu/env" ] ; then
  FILES=$(find "${HOME}/.xu/env" -name '*.sh' | sort)
  for FILE in $FILES; do
    echo $FILE
    source $FILE
  done
fi