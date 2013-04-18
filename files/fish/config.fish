set BROWSER 'open'

alias grep="grep --color=auto"
alias scr='vim ~/util/scratch'
alias pscr='vim ~/util/scratch +1 -c ":r!xclip -o";cat ~/util/scratch |xclip -i'
alias gf='git flow'
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias g='git'
alias gst='git status'
alias gco='git checkout'
alias gl='git pull'
alias gp='git push'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias be='bundle exec'
alias vi=vim

set -gx CDPATH /Users/ewc/Code .

set -gx PATH /usr/X11/bin /Users/ewc/Code/incanter/bin $PATH
set -gx PATH /bin /usr/bin /sbin /usr/sbin /usr/local/sbin /usr/local/pgsql/bin /usr/local/git/bin $PATH
set -gx PATH /opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin $PATH
set -gx PATH /Users/ewc/bin/android-sdk-mac_x86/tools /Developer/usr/bin $PATH
set -gx PATH /Users/ewc/Code/crawl/crawl-ref/source $PATH
set -gx PATH /Users/ewc/.rbenv/bin /Users/ewc/.rbenv/shims $PATH
set -gx PATH /opt/local/bin /Users/ewc/bin /opt/local/lib/postgresql86/bin /usr/local/mysql/bin /usr/local/bin $PATH

. $HOME/.config/fish/functions/rbenv.fish

function fish_prompt -d "Write the prompt"
  printf '%s@mac%s%s%s> ' (whoami) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

