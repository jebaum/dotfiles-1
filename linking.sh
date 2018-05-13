#!/bin/bash


linking() {
    if [ $1 == "-f" -o $1 == "--force" ]; then
        rm -rf $3
    fi

    if [ ! -e $3 ]; then
        ln -sf $(pwd)/$2 $3
    fi
}


if [ ! $1 == "" ]; then
    x=$1
else
    x="n"
fi


cd $(dirname $0)

# linking  $x  terminator_config  $HOME/.config/terminator/config

linking  $x  bash_profile      $HOME/.bash_profile
linking  $x  bash_sources      $HOME/.bash_sources
linking  $x  bashrc            $HOME/.bashrc
linking  $x  dosbox-0.74.conf  $HOME/.dosbox/dosbox-0.74.conf
linking  $x  feh               $HOME/.config/feh/
linking  $x  mpv/              $HOME/.config/mpv
linking  $x  ranger            $HOME/.config/ranger
linking  $x  tmux.conf         $HOME/.tmux.conf
linking  $x  vimrc             $HOME/.vimrc
linking  $x  Xresources        $HOME/.Xresources
linking  $x  zathura           $HOME/.config/zathura

cd - > /dev/null
