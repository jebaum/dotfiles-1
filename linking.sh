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

linking  $x  bash/bash_profile       $HOME/.bash_profile
linking  $x  bash/bashrc             $HOME/.bashrc
linking  $x  feh                     $HOME/.config/feh
linking  $x  mpv/                    $HOME/.config/mpv
linking  $x  mysql/my.cnf            $HOME/.my.cnf
linking  $x  mysql/myclirc           $HOME/.myclirc
linking  $x  other/bvirc             $HOME/.bvirc
linking  $x  other/dosbox-0.74.conf  $HOME/.dosbox/dosbox-0.74.conf
linking  $x  other/inputrc           $HOME/.inputrc
linking  $x  other/profile           $HOME/.profile
linking  $x  other/tmux.conf         $HOME/.tmux.conf
linking  $x  other/Xresources        $HOME/.Xresources
linking  $x  other/zathurarc         $HOME/.config/zathura/zathurarc
linking  $x  vim/init.vim            $HOME/.config/nvim/init.vim
linking  $x  vim/UltiSnips           $HOME/.vim/UltiSnips
linking  $x  vim/vimrc               $HOME/.vimrc

# linking  $x  other/terminator_config $HOME/.config/terminator

cd - > /dev/null

mkdir -p $HOME/.vim/cache/backup
mkdir -p $HOME/.vim/cache/undo
