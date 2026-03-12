if status is-interactive
end

if test (uname) = Darwin
    eval "$(/opt/homebrew/bin/brew shellenv)"
    bind ctrl-left prevd-or-backward-word
    bind ctrl-right nextd-or-forward-word
    bind ctrl-backspace backward-kill-token
end

set -Ux EDITOR "vim"
set -Ux SHELL "fish"

starship init fish | source
