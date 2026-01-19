# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# The theme is at ~/.oh-my-zsh/themes/aflynn.zsh-theme
ZSH_THEME="aflynn"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Stop displaying annoying omz update prompt
export DISABLE_UPDATE_PROMPT=true
export DISABLE_AUTO_UPDATE=true

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git shrink-path juju-aflynn tmux)

# Autostart tmux (works with the tmux plugin)
ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

source /usr/share/doc/fzf/examples/key-bindings.zsh

# User configuration

# tmux user config
tmux set -g status off

export EDITOR='vim'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Use nvim for vim
alias vim="nvim"
alias v="nvim"

# Some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Search
alias rgt="rg -g '!*_{test,mock}.go'"

# Go test
alias got='go test ./... -check.v'
alias gotv='go test -v ./... -check.vv'
alias gotf='go test ./... -check.v -check.f'
alias gotr='go test ./... -check.v -race'
# Go test juju
gotj() {
    echo "go test -v -tags=libsqlite3,dqlite $(echo $(pwd) | sed 's#.*juju[0-9]*/#./#g')/... -check.v -check.f Suite"
    go test -v -tags=libsqlite3,dqlite $(pwd)/... -check.v -check.f Suite
}

alias gpom='git checkout main && git pull origin main && git checkout -'
alias gpum='git checkout main && git pull upstream main && git checkout -'
alias gpuma='git checkout master && git pull upstream master && git checkout -'
alias gpl='git pull upstream $(git rev-parse --abbrev-ref HEAD)'
alias gcf='git commit --verbose --fixup'
alias gcfh='git commit --verbose --fixup HEAD'
alias gcaf='git commit -a --verbose --fixup'
alias gcafh='git commit -a --verbose --fixup HEAD'
gcopr() {
    git fetch upstream pull/$1/head:PR-$1
    git checkout PR-$1
}

# alias jhack='python3 /home/aflynn50/Canonical/jhack/jhack/main.py'
#
alias gt='gnome-terminal'

export EDITOR=vim

export GOPATH=$HOME/go
# Prepend
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

# This is where the go website reccomends we install it
# export PATH=$PATH:/usr/local/go/bin

export PATH=$PATH:$HOME/.cargo/bin

# Fucking pyenv shit
# Put on path
export PATH=$PATH:$HOME/.pyenv/bin
# Let it fuck with my path
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Put python virtual env on the path to use it as normal
export PATH=/home/aflynn/pythonenv/bin:$PATH

replace() {
    rg -l "$1" | xargs sed -i 's/$1/$2/g'
}

# Juju
# Ignore tests that fail in make static-analysis
# Note, this breaks the jenkins-qa make static-analysis
# export STATIC_ANALYSIS_JOB=test_static_analysis_go
# controllers
alias jcs='juju controllers'
alias jkc='juju kill-controller --no-prompt'
alias jkcs='juju list-controllers --format=json | jq ".controllers | keys | .[]" | xargs -I% juju kill-controller --no-prompt -t 0s %'
# status
alias js='juju status --color'
alias jsr='juju status --color --relations'
alias jsc='juju status --color -m controller'
# Watch status
alias jws='watch -c juju status --color'
alias jwsr='watch -c juju status --color --relations'
alias jwsc='watch -c juju status --color -m controller'
# debug log
alias jdb='juju debug-log'
alias jdbr='juju debug-log --replay'
alias jdbc='juju debug-log -m controller'
alias jdbcr='juju debug-log -m controller --replay'
alias jdbrc='juju debug-log -m controller --replay'
# destroy
alias jdc='juju destroy-controller --destroy-all-models --destroy-storage --no-prompt'
alias jdcf='juju destroy-controller --destroy-all-models --destroy-storage --no-prompt --force --no-wait'
alias sjdc='/snap/bin/juju destroy-controller --destroy-all-models --destroy-storage --no-prompt'
alias sjdcf='/snap/bin/juju destroy-controller --destroy-all-models --destroy-storage --no-prompt --force --no-wait'
alias jdm='juju destroy-model --destroy-storage --no-prompt'
alias jdmf='juju destroy-model --destroy-storage --no-prompt --force --no-wait'
# switch
alias jsw='juju switch'
# login
alias jch='juju change-user-password'
alias jchap='echo "p" | juju change-user-password admin --no-prompt'
alias jlin='juju login -u'
alias jlo='juju logout'
alias jg='juju grant'
# delete all lxd containers
alias lxcda='lxc list -fcsv -cn | xargs lxc delete -f'
# Juju binary
alias snuju='/snap/bin/juju'
alias sj='/snap/bin/juju'
alias j='juju'
# Testing
alias dqlite-test='TEST_PACKAGES="${pwd}/... -count=1 -race" TEST_FILTER="Suite" make run-go-tests'
# Terraform
alias terreset='rm -r .terraform && rm .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup'
# Microk8s
alias microk8s-refresh='sudo microk8s refresh-certs --cert ca.crt && sudo microk8s refresh-certs --cert front-proxy-client.crt && sudo microk8s refresh-certs --cert server.crt'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
