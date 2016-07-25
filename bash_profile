# git auto completeion
#source ~/.git-completion.bash
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# function_exists() {
#     declare -f -F $1 > /dev/null
#     return $?
# }

# for al in `__git_aliases`; do
#     alias g$al="git $al"

#     complete_func=_git_$(__git_aliased_command $al)
#     function_exists $complete_fnc && __git_complete g$al $complete_func
# done

# Enable temrinal colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# show current directory in bash prompt
# show git branch name in bash prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#export PS1="\u@\h \[\033[32m\]\w\$(parse_git_branch)\[\033[00m\] $ "
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Alii
alias ls='ls -GFh'
alias ll='ls -laGfh'

# Git alii
alias s="git status -s"