#!/bin/bash

CW=$(dirname $(realpath $0))
source $CW/credentials.env

if [[ -n $1 ]]; then
  env='development'
else
  env='production'
fi

# create session
session='chocorp_web'
tmux new-session -d -s $session || exit 1

# Nginx window
tmux rename-window -t $session:0 'nginx'
tmux send-keys -t $session:0 'tail -f /var/log/nginx/access.log' C-m
tmux split-window -t $session:0 -v
tmux send-keys -t $session:0 'tail -f /var/log/nginx/error.log' C-m

# Web server, htop and logs
tmux new-window -t $session:1 -n 'rails'
tmux send-keys -t $session:1 "source config.env; ./bin/rails assets:precompile; puma -b unix:///home/pi/chocorp_web/tmp/sockets/puma.sock -e $env" C-m
tmux split-window -t $session:1 -v
tmux send-keys -t $session:1 "tail -f log/$env.log" C-m
tmux selectp -t $session:1.0
tmux splitw -t $session:1 -h
tmux send-keys -t $session:1 'htop' C-m
tmux selectp -t $session:1.0
