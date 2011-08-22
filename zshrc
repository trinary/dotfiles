# The following lines were added by compinstall
autoload -Uz vcs_info
typeset -U fpath path
fpath=($fpath $HOME/.zsh/func)

zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

autoload -U url-quote-magic
zle -N self-insert url-quote-magic

export TERM=xterm-color
export CLICOLOR=1
setopt appendhistory autocd extendedglob notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
#autoload -U promptinit
#promptinit
export EDITOR="vim"
path=(/Users/ewc/bin /opt/local/bin /opt/local/lib/postgresql84/bin /usr/local/mysql/bin /bin /usr/bin /usr/local/bin /sbin/ /usr/sbin /usr/local/sbin/ /usr/local/pgsql/bin /usr/local/git/bin /usr/X11/bin/ /Users/ewc/Code/incanter/bin /opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin/)
export MANPATH="$MANPATH:/usr/local/man:/usr/local/git/man"
export PIVOTAL_TOKEN="894d7aaa96b175de480fd077c4259af5"
export PIV_WEB_ID=1807
export PIV_DASH_ID=6396
export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk/

alias grep="grep --color=auto"
#alias ls="ls --color=auto"
#alias dcurl="curl --config ~/util/curljsonrc"

alias f="find . ! -wholename '*.svn*' | xargs grep -i --colour=auto -E "
alias scr='vim ~/util/scratch'
alias pscr='vim ~/util/scratch +1 -c ":r!xclip -o";cat ~/util/scratch |xclip -i'
alias pacman='pacman-color'

alias startnginx='sudo /opt/nginx/sbin/nginx'
alias stopnginx='sudo kill `cat /opt/nginx/logs/nginx.pid `'
alias restartnginx='stopnginx; startnginx'

# Arch
alias p="sudo pacman-color"
alias y="yaourt --aur"
#
# # git
#alias gc='git commit'
#alias gca='git commit -a'
#alias gst='git status'
#alias gco='git checkout'
#alias gp='git pull'
#alias gpu='git push'
#alias gaa='git add .'
#alias gb='git branch'

# rubyee
alias ruby-ee='/opt/ruby-enterprise/bin/ruby'
alias vi=vim

alias rubyee='/opt/ruby-enterprise/bin/ruby'
alias gemee='/opt/ruby-enterprise/bin/gem'
alias rakeee='/opt/ruby-enterprise/bin/rake'
alias merbee='/opt/ruby-enterprise/bin/ruby ./bin/merb -a thin'

# ruby19
alias ruby19='/opt/ruby1.9/bin/ruby'

#pg84
alias psql=psql84

# Pivotal webservice stuff
function pc {
  curl -v -H "X-TrackerToken: $PIVOTAL_TOKEN" -H "Content-type: application/xml" $@
}

function pweb {
  pc http://www.pivotaltracker.com/services/v1/projects/$PIV_WEB_ID
}
function pdash {
  pc http://www.pivotaltracker.com/services/v1/projects/$PIV_DASH_ID
}

function lmv {
[ -e "$1" -a -d "$2" ] && mv "$1" "$2"/ && ln -s "$2"/"$(basename "$1")" "$(dirname "$1")";
}

function calc {
  awk "BEGIN{ print $* }"
}



bindkey '^o' push-line-or-edit

#zstyle ':vcs_info:*' formats '%r/%b'
#function vcsinfo_precmd() {
#  psvar=()
#  vcs_info
#  [[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"
#}
#
#precmd_functions+=(vcsinfo_precmd)
source ~/.zsh/func/ssbe-zsh/ssbe-web.zsh

#export PS1="%n@%m %F{cyan}%1~%f %(1v.%F{green}%1v%f.) %# "

export ARCHFLAGS='-arch x86_64'

export GOROOT="$HOME/Code/go"
export GOBIN="$HOME/bin"
export GOOS="darwin"
export GOARCH="amd64"

export API_WORKSPACE=code/svn

#git theming default: Variables for theming the git info prompt
ZSH_THEME_GIT_PROMPT_PREFIX="git:("         # Prefix at the very beginning of the prompt, before the branch name
ZSH_THEME_GIT_PROMPT_SUFFIX=")"             # At the very end of the prompt
ZSH_THEME_GIT_PROMPT_DIRTY="*"              # Text to display if the branch is dirty
ZSH_THEME_GIT_PROMPT_CLEAN=""               # Text to display if the branch is clean

# Setup the prompt with pretty colors
setopt prompt_subst

# Load the theme

# get the name of the branch we are on
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

parse_git_dirty () {
  if [[ $((git status 2> /dev/null) | tail -n1) != "nothing to commit (working directory clean)" ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

# Aliases
alias g='git'
alias gst='git status'
alias gco='git checkout'
alias gl='git pull'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gd='git diff | mate'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'



source "/Users/ewc/.zsh/themes/clean.zsh-theme"

if [[ -s /Users/ewc/.rvm/scripts/rvm ]] ; then source /Users/ewc/.rvm/scripts/rvm ; fi

