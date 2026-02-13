if status is-interactive
end

eval "$(/opt/homebrew/bin/brew shellenv)"

if test (uname) = Darwin
    bind ctrl-left prevd-or-backward-word
    bind ctrl-right nextd-or-forward-word
    bind ctrl-backspace backward-kill-token
end

set -Ux EDITOR "vim"
