### Bind commands
## Auto completion
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'

### Exports
## History control
export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTIGNORE="ls:exit:df:w:h:ll:apollo:top"
shopt -s histappend
## General stuff
export EDITOR="vim"
# Use Vim as man viewer
export PAGER="col -b | vim -R -c 'set ft=man nomod nolist' -"
export PATH=$PATH:/opt/local/bin:/opt/local:/opt/local/sbin
export MANPATH=$MANPATH:/opt/local/share/man
export IGNOREEOF=1

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

# Change Directory to the active Finder window (else ~/Desktop)
function cdf()
{
  local fPath=`osascript -e '
  tell app "finder"
     try
        set folderPath to (folder of the front window as alias)
     on error
        set folderPath to (path to desktop folder as alias)
     end try
     POSIX path of folderPath
  end tell'
  `;
  echo "cd $fPath";
  cd "$fPath" > /dev/null
}

#ip shows ip addresses for eth0, eth1 and external
function ip()
{
  echo -e "Ethernet:\t `ipconfig getifaddr en0 2> /dev/null`"
  echo -e "WiFi:\t\t `ipconfig getifaddr en1 2> /dev/null`"
  echo -e "External:\t `curl -s http://checkip.dyndns.org/` | `grep -o '[0-9][0-9]*.[0-9][0-9]*.[0-9][0-9]*.[0-9]*'`"
  echo ""
}

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

### Startup messages
clear
echo "Welcome to "`scutil --get ComputerName`"/"`ipconfig getifaddr en0` "["`sw_vers -productName`"@"`sw_vers -productVersion`"]"
df -hl | grep 'disk0s2' | awk '{print $4"/"$2" free ("$5" used)"}'
w

# See http://www.shellperson.net/using-sudo-with-an-alias/
alias sudo='sudo '
 
# This helps me edit files that my user isn't the owner of
alias edit='SUDO_EDITOR="open -FWne" sudo -e'
 
# The alias that takes me here - to editing these very aliases
alias edit_profile='open -e ~/.bash_profile'
 
# I do a lot of web development, so I need to edit these non-owned files fairly often
alias edit_hosts='edit /etc/hosts'
 
# Some of my goto commands, including one to open the php extension folder for when I need to install custom extensions
alias goto_web='cd ~/www'
 
# This alias recursively destroys all .DS_Store files in the folder I am currently in
alias killDS='find . -name *.DS_Store -type f -delete'

# Alii
alias ls='ls -GFh'
alias ll='ls -laGfh'
alias aws01='ssh ubuntu@aws01.toughmudder.com'

# Boxes
alias rs01='ssh admin@rs01.toughmudder.com'
alias rs16='ssh admin@rs16.toughmudder.com'
alias igori="ssh bobby@192.168.1.2"
alias igorr="ssh bobby@igor.bdon.co"

# Git alii
alias s="git status -s"

## Processes
alias tu='top -o cpu' #cpu
alias tm='top -o vsize' #memory

## Finds
alias findn='find . -name '"${1}"''

## Various
alias df='df -h'
alias h='history'
alias cdd='cd -'
alias claer='clear'
alias c='clear'
# alias ip='ipconfig getifaddr en0' #internal IP
alias count='du -a | cut -d/ -f2 | sort | uniq -c | sort -nr'
alias grep='grep --colour'
alias psaux='ps aux | grep -v grep | grep -i'
#alias mytree='find . -type d | sed -e 1d -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|-/''
alias bak='cp "${1}" "${1}.bak"'
alias routeprint='netstat -r'
alias gedit="open -a gedit"
alias cc="compass compile"

# Vagrant aliases
alias vl="VBoxManage list runningvms"
alias vu="vagrant up"
alias vd="vagrant suspend"
alias vr="vagrant reload"
alias vs="vagrant ssh"
alias va="vagrant rsync-auto"
alias vh="vagrant halt"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# MacPorts Installer addition on 2014-03-24_at_16:46:41: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

TH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## Chef-DK - berkshelf.com
PATH=$HOME/.chefdk/gem/ruby/2.1.0/bin:/opt/chefdk/bin:$PATH

export PATH="/usr/local/mysql/bin:$PATH"

# MacPorts Installer addition on 2015-05-15_at_17:58:55: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export MONGODB_URI="mongodb://bobby:h3ll099@ds023452.mlab.com:23452/heroku_hzb3fsgc"