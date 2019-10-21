#!/bin/zsh
tmux split-window -h -c "#{pane_current_path}"
tmux split-window -v -c "#{pane_current_path}"
tmux select-pane -t 0
tmux split-window -v -c "#{pane_current_path}"
tmux select-pane -t 3
tmux send-keys "htop" C-m
tmux select-pane -t 0
