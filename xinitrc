#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#redshift -l 40.74:-73.98 &
redshift -P -O 4500k
sxhkd &
./code/scripts/dwm-bar.sh &
picom -b &
dunst &
feh --randomize --bg-fill ~/pix/wall/gruvboxy
unclutter &
setxkbmap -layout us,br -option grp:rctrl_rshift_toggle -option caps:escape_shifted_capslock
tmux new-session -d -s master -n sm 'nvim'
tmux new-window -t master -n fm 'nnn'
tmux new-window -t master -n new 'newsboat'
tmux new-window -t master -n chat 'cordless'
tmux new-window -t master -n mus 'cmus'
 
exec /usr/local/bin/dwm
#exec /usr/bin/spectrwm
#exec /usr/bin/awesome
