#!/bin/sh

cd files

for i in * ; do
  date=`date +%s`
  if [[ ! -h ~/.$i ]]; then
    mkdir ~/tmp/dotfiles-$date
    cp ~/.$i ~/tmp/dotfiles-$date/
  fi

  rm ~/.$i ; ln -s ~/Code/dotfiles/files/$i ~/.$i
done
