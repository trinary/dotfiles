function servethis
  python -m SimpleHTTPServer $argv
end

function -d "List all running tmux sessions." tmux-list-sessions
  tmux list-sessions
end

function -d "Attach to a running tmux session." tmux-attach-session
  tmux attach -t $argv
end

function -d "Create a named tmux session" tmux-new-session
  tmux new-session -s $argv
end

alias tl=tmux-list-sessions
alias ta=tmux-attach-session
alias tn=tmux-new-session
