#!/bin/bash

SESSION="main"

# Check if the session already exists
tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
    # Create a new session and detach
    tmux new-session -d -s $SESSION

    # Split window vertically (left and right panes)
    tmux split-window -h -t $SESSION:0

    # Move cursor to the first panel (left side)
    tmux select-pane -t $SESSION:0.0

    # Attach to the session
    tmux attach-session -t $SESSION
else
    # If session exists, just attach
    tmux attach-session -t $SESSION
fi

