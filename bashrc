# BASHRC #

# ALIASES {{{1

alias ap1='sudo create_ap wlo1 wlo1 x I_love_BASH' # semi open WiFi network
alias cal='cal -m'
alias du='du -h'
alias grep='grep --color'
alias i3-logout="i3-msg exit"
alias less='less -R'
alias ll='ls -alhF | less -R'
alias ls='ls -F'
alias mkdir='mkdir -p'
alias mnt='udisksctl mount -b'
alias off='shutdown -h now'
alias op='xdg-open'
alias pacman-purge='pacman -Rns $(pacman -Qtdq)'
alias qmv='command qmv -v -f "do"'
alias su='sudo su'
alias sudo='sudo '
alias suspend='systemctl suspend'
alias umnt='udisksctl unmount -b'
alias update-grub='grub-mkconfig -o /boot/grub/grub.cfg'
alias vi='nvim -p'
alias wicd='wicd-curses'
alias wine-lnk='env WINEPREFIX="$HOME/.wine" wine C:\\windows\\command\\start.exe /Unix'

# COMPLETION {{{1

# Enable programmable completion features
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Better autocompletion (like in zsh), but use Shift-Tab
bind '"\e[Z":menu-complete'

# Enable extended globbing
shopt -s extglob

# Magic space
bind Space:magic-space

# FUNCTIONS {{{1

i3-get-window-criteria() {
    match_int='[0-9][0-9]*'
    match_string='".*"'
    match_qstring='"[^"\\]*(\\.[^"\\]*)*"' # NOTE: Adds 1 backreference

    {
        xprop |
        sed -nr \
            -e "s/^WM_CLASS\(STRING\) = ($match_qstring), ($match_qstring)$/instance=\1\nclass=\3/p" \
            -e "s/^WM_WINDOW_ROLE\(STRING\) = ($match_qstring)$/window_role=\1/p" \
            -e "/^WM_NAME\(STRING\) = ($match_string)$/{s//title=\1/; h}" \
            -e "/^_NET_WM_NAME\(UTF8_STRING\) = ($match_qstring)$/{s//title=\1/; h}" \
            -e '${g; p}'
    } | sort | tr "\n" " " | sed -r 's/^(.*) $/[\1]\n/'
}

gpu-switch() {
    if [ ! -z $(command -v optimus-manager) ]; then
        if [[ "$(glxinfo | grep "OpenGL vendor")" =~ .*Intel.* ]] && \
                [[ "$(cat '/sys/bus/pci/devices/0000:01:00.0/power/control')" == "auto" ]]
        then
            read -p "Are you sure? System will reboot! [Y/n] " -r
            if [[ ! $REPLY =~ ^[Nn]$ ]]; then
                optimus-manager --set-startup nvidia_once
                reboot
            fi
        else
            optimus-manager --switch auto
            i3-msg exit
        fi
    fi
}

install-from-list() {
    for file in $@; do
        if [ -e $file ]; then
            if [[ ${file: -5} == ".list" ]]; then
                while IFS= read -r pkg; do
                    list=$list' '$(echo $pkg | cut -f1 -d"#")
                done < "$file"
            else
                echo "$file - file in not a list"
            fi
        else
            echo "$file - file does not exist"
        fi
    done

    read -r -p 'Installation command: ' installation_command
    $installation_command $list

    unset list
}

rebuild-hosts-file() {
    set -e

    sudo echo "# Created $(command date '+%F %T') by $USER" > /tmp/hosts
    sudo echo >> /tmp/hosts

    cat $HOME/.hosts/* \
        | tr A-Z a-z \
        | tr -d '\r' \
        | awk '{gsub("#.*$", ""); gsub(" *$",""); if (NF==2) {print $1 " " $2;}}' \
        | grep -v '^localhost$' \
        | sed 's/\.$//' \
        | sort -k 2\
        | uniq  \
        | sed 's/\.$//' \
        | awk '{printf("%-20s %s\n", $1, $2);}' \
        >> /tmp/hosts

    sudo mv /tmp/hosts /etc/hosts
}

umount-ios() {
    cd
    for i in $@; do
        fusermount -u $HOME/.mount/ios$i
    done
    rmdir $HOME/.mount/* &> /dev/null
    cd - &> /dev/null
}

windows() {
    command sudo grub-reboot 2
    command sudo reboot
}

# HISTORY {{{1

# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE
HISTSIZE=1000
HISTFILESIZE=2000

# WINDOW {{{1

# Check the window size after each command and update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Set window title to "command | user@host:dir"
case "$TERM" in
    xterm*|rxvt*|screen*)
        PS1="\[\e]0;\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# WRAPPERS {{{1

feh() {
    nohup feh -B black -. --start-at "$@" > /dev/null 2>&1
}

find() {
    command find $@ 2> /dev/null
}

mpv() {
    if [[ -z "$1" ]]; then
        command mpv ./
    elif [[ "$1" == "-l" ]]; then
        if [ -z "$2" ]; then
            command mpv --loop-playlist ./
        else
            shift 1
            command mpv --loop-playlist "$@"
        fi
    else
        command mpv "$@"
    fi
}

# OTHER {{{1

# Use Vi mode
set -o vi

# Make 'less' more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Update Xresources
if [ -f $HOME/.Xresources ]; then
    xrdb -load $HOME/.Xresources
fi

# Update .tmux.conf on start
if [ -n $TMUX ]; then
    tmux source $HOME/.tmux.conf
fi

# Exports
source $HOME/.profile

# PROMPT
PS1='\[\e[1m\]\u@\h:\[\033[90m\]\w\[\033[0m\]\[\033[1m\]\$\[\e[0m\] '

# If there is display then on tty1 startx
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    sudo /usr/bin/prime-switch
    exec startx
fi

# vim: fdm=marker foldenable: