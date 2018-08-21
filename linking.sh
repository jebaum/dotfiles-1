#!/bin/bash


linking() {
    if [[ $1 == "-f" ]]; then
        rm -rf $3
    fi

    if [ ! -e $3 ]; then
        mkdir -p "$(dirname $3)"
        ln -sf $(pwd)/$2 $3
    fi
}


if [[ $1 == "-f" ]]; then
    x="-f"
else
    x="n"
fi

cd $(dirname $0)

linking  $x  bash/bash_profile  $HOME/.bash_profile
linking  $x  bash/bash_sources  $HOME/.bash_sources
linking  $x  bash/bashrc        $HOME/.bashrc
linking  $x  dosbox-0.74.conf   $HOME/.dosbox/dosbox-0.74.conf
linking  $x  feh                $HOME/.config/feh
linking  $x  inputrc            $HOME/.inputrc
linking  $x  mpv/               $HOME/.config/mpv
linking  $x  profile            $HOME/.profile
linking  $x  tmux.conf          $HOME/.tmux.conf
linking  $x  vim/vimrc          $HOME/.vimrc
linking  $x  Xresources         $HOME/.Xresources
linking  $x  zathura            $HOME/.config/zathura

# linking  $x  terminator $HOME/.config/terminator

cd - > /dev/null

mkdir $HOME/.vimtmp
