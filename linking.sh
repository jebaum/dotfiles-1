#!/bin/bash

linking() {
    if [ ! -e $2 ]; then
        ln -sf $(pwd)/$1 $2
    fi
}

cd $(dirname $0)

# linking  terminator_config  $HOME/.config/terminator/config

linking  bash_profile      $HOME/.bash_profile
linking  bash_sources      $HOME/.bash_sources
linking  bashrc            $HOME/.bashrc
linking  dosbox-0.74.conf  $HOME/.dosbox/dosbox-0.74.conf
linking  feh               $HOME/.config/feh/
linking  mpv/              $HOME/.config/mpv
linking  tmux.conf         $HOME/.tmux.conf
linking  vimrc             $HOME/.vimrc
linking  Xresources        $HOME/.Xresources
linking  zathura           $HOME/.config/zathura

cd - > /dev/null
