#!/bin/zsh
tmux split-window -h -p 25 -c "#{pane_current_path}"
tmux split-window -v -c "#{pane_current_path}"
tmux select-pane -t 0
