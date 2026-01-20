if status is-interactive
    # Commands to run in interactive sessions can go here
end
fish_add_path ~/.toolbox/bin/
eval "$(/opt/homebrew/bin/brew shellenv)"

if test (uname) = Darwin
    bind ctrl-left prevd-or-backward-word
    bind ctrl-right nextd-or-forward-word
    bind ctrl-backspace backward-kill-token
end
