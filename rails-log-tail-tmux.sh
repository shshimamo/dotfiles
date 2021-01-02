#!/bin/zsh
# tmux new-window -n name
# tmux rename-window name
tmux split-window -h
tmux split-window -v -t 0
tmux split-window -v -t 2
tmux send-keys -t 0 'tail -f log/development.log' C-m
tmux send-keys -t 1 'tail -f log/development.log | grep -E "GET|POST|PUT|PATCH|DELETE"' C-m
tmux send-keys -t 2 'tail -f log/development.log | grep -E "SELECT"' C-m
tmux send-keys -t 3 'tail -f log/development.log | grep -E "UPDATE|INSERT|DELETE"' C-m
