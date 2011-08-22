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
HISTSIZE=10000
SAVEHIST=10000

autoload -U url-quote-magic
zle -N self-insert url-quote-magic


#export TERM=xterm-color
export CLICOLOR=1
setopt appendhistory extendedglob notify
unsetopt beep
bindkey -e
cdpath=(~/Code ~/Code/api)

# End of lines configured by zsh-newuser-install
#autoload -U promptinit
#promptinit
export EDITOR="vim"
path=(/Users/ewc/bin /opt/local/bin /opt/local/lib/postgresql84/bin /usr/local/mysql/bin /bin /usr/local/bin /usr/bin /sbin/ /usr/sbin /usr/local/sbin/ /usr/local/pgsql/bin /usr/local/git/bin /usr/X11/bin/ /Users/ewc/Code/incanter/bin /opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin/ /Users/ewc/bin/android-sdk-mac_x86/tools /Developer/usr/bin)
export MANPATH="$MANPATH:/usr/local/man:/usr/local/git/man"
export PIV_WEB_ID=1807
export PIV_DASH_ID=6396


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
alias gf='git flow'

# rubyee
alias ruby-ee='/opt/ruby-enterprise/bin/ruby'
alias vi=vim
alias mvi=mvim

alias rubyee='/opt/ruby-enterprise/bin/ruby'
alias gemee='/opt/ruby-enterprise/bin/gem'
alias rakeee='/opt/ruby-enterprise/bin/rake'
alias merbee='/opt/ruby-enterprise/bin/ruby ./bin/merb -a thin'

# ruby19
alias ruby19='/opt/ruby1.9/bin/ruby'


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

export NODE_PATH=/usr/local/lib/node_modules

# Setup the prompt with pretty colors
setopt prompt_subst

# Load the theme

# get the name of the branch we are on
function git_prompt_info() {
#  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  GST=$( git status 2>/dev/null|tail -n1 )
  if [[ $GST != "nothing to commit (working directory clean)" ]]; then
    GP="$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    GP="$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
  if [[ $GST == "" ]] ; then
    echo -n ""
  else
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$GP$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

parse_git_dirty () {
  GST=$( git status 2>/dev/null|tail -n1 )
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

#if [ "`uname`" = "Darwin" ]; then
#  compctl -f -x 'p[2]' -s "`/bin/ls -d1 /Applications/*/*.app /Applications/*.app | sed 's|^.*/\([^/]*\)\.app.*|\\1|;s/ /\\\\ /g'`" -- open
#  alias run='open -a'
#fi

export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"


source "/Users/ewc/.zsh/themes/clean.zsh-theme"



function epoch() {
  ruby -e "puts Time.at($*)"
}

function servethis() {
  python -m SimpleHTTPServer $*
}


if [[ -s /Users/ewc/.rvm/scripts/rvm ]] ; then source /Users/ewc/.rvm/scripts/rvm ; fi

source /Users/ewc/Dropbox/private.zsh
