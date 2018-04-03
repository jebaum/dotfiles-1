######################
### BASHRC_PROFILE ###
######################

# Disable XON flow control
stty -ixon

# Green text (I'm hacker!)
# setterm -foreground green -store

# Source .bashrc
source $HOME/.bashrc

# Update xterm on start
# xrdb -load $HOME/.Xresources &
# xrdb -merge $HOME/.Xresources

# Update .tmux.conf on start
tmux source $HOME/.tmux.conf
