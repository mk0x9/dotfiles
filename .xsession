#!/bin/bash

unset SSH_AGENT_PID
unset SSH_AUTH_SOCK

eval $(gnome-keyring-daemon -ds)

export SSH_AUTH_SOCK
export GPG_AGENT_INFO

xrdb -load $HOME/.Xresources

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

xcompmgr -C &
setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle,grp_led:scroll,compose:menu" &
ibus-daemon -x -r &
xsetroot -cursor_name left_ptr &
/usr/bin/emacs --daemon &
synclient TapButton1=1 TapButton2=2 TapButton3=3 CircularPad=1 CircularScrolling=1 &
urxvt256c-mld -q &
systemd-lock-handler slock &
exec xmonad
