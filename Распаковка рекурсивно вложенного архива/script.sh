#!/bin/bash
# архив указывать как аргумент
PROGNAME="$0" exec tar -zxvvf - --to-command='
  case "$TAR_FILENAME" in
    (*.tar.gz | *.tgz) exec "$PROGNAME";;
    (*) set -o noclobber
        mkdir -p -- "$(dirname -- "$TAR_FILENAME")" &&
          exec cat > "$TAR_FILENAME"
  esac' 3<&-
   
chmod u+x script.sh
./script.sh < archive.tar.gz
