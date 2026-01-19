setopt prompt_subst
PS1='%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}$(shrink_path -f)%{$reset_color%} $(juju_prompt)$(git_prompt_info)'



ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

ZSH_THEME_JUJU_PROMPT_PREFIX="%{$fg_bold[magenta]%}[$FG[166]"
ZSH_THEME_JUJU_PROMPT_SUFFIX="%{$fg_bold[magenta]%}]%{$reset_color%}"
