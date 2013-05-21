# Theme
set fish_theme robbyrussell

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

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

set -gx EDITOR vim

set -gx GOROOT /usr/local/Cellar/go/1.1beta2/
set -gx GOPATH /usr/local/lib/go

set -gx PATH /usr/X11/bin /Users/ewc/Code/incanter/bin $PATH
set -gx PATH /bin /usr/bin /sbin /usr/sbin /usr/local/sbin /usr/local/pgsql/bin /usr/local/git/bin $PATH
set -gx PATH /opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin $PATH
set -gx PATH /Users/ewc/bin/android-sdk-mac_x86/tools /Developer/usr/bin $PATH
set -gx PATH /Users/ewc/Code/crawl/crawl-ref/source $PATH
set -gx PATH /Users/ewc/.rbenv/bin /Users/ewc/.rbenv/shims $PATH
set -gx PATH /opt/local/bin /Users/ewc/bin /opt/local/lib/postgresql86/bin /usr/local/mysql/bin /usr/local/bin $PATH

function _git_branch_name
  echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set -l blue   (set_color blue)
  set -l green  (set_color green)
  set -l red    (set_color red)
  set -l normal (set_color normal)

  set -l arrow "λ"
  set -l cwd $blue(basename (prompt_pwd))

  if [ (_git_branch_name) ]
    set git_info $green(_git_branch_name)
    set git_info ":$git_info"

    if [ (_is_git_dirty) ]
      set -l dirty $red(echo " ✗")
      set git_info "$git_info$dirty"
    else
      set -l dirty $green(echo " ✔")
      set git_info "$git_info$dirty"
    end
  end

  echo -n -s $cwd $git_info $normal ' ' $arrow ' '
end

function cdf
  cd (osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')
end
