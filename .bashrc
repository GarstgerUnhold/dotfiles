# If not running interactively, don't do anything.
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then . /etc/bashrc; fi

#define all colors
if [ $(uname) != "SunOS" ] && [ "$TERM" != "dumb" ]; then
   COLOR_RED="\[\033[00;31m\]"
   COLOR_GREEN="\[\033[00;32m\]"
   COLOR_YELLOW="\[\033[00;33m\]"
   COLOR_BLUE="\[\033[00;34m\]"
   COLOR_MAGENTA="\[\033[00;35m\]"
   COLOR_CYAN="\[\033[00;36m\]"
   COLOR_RED_BOLD="\[\033[01;31m\]"
   COLOR_GREEN_BOLD="\[\033[01;32m\]"
   COLOR_YELLOW_BOLD="\[\033[01;33m\]"
   COLOR_BLUE_BOLD="\[\033[01;34m\]"
   COLOR_MAGENTA_BOLD="\[\033[01;35m\]"
   COLOR_CYAN_BOLD="\[\033[01;36m\]"
   COLOR_NONE="\[\033[00m\]"
fi

# Function to resolve soft links
function delink()
{
  f=$1
  while [ -h "$f" ]; do
    ls=`ls -ld "$f"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then f="$link"
    else f=`dirname "$f"`/"$link"
    fi
  done
  echo $f
}

# General Settings
export DOTFILES=$(dirname `delink ~/.bashrc` )
export PATH="$HOME/bin:$HOME/.bin:$HOME/.local/bin:$HOME/gtk/inst/bin:/usr/local/bin:/Developer/usr/bin:/usr/bin:/usr/ucb:$PATH:/opt/bin:/opt/local/bin:."
export PWD_LENGTH=30
set -o ignoreeof
set -o notify
shopt -s cdspell >/dev/null 2>&1
shopt -s checkwinsize >/dev/null 2>&1
shopt -s dotglob >/dev/null 2>&1
shopt -s extglob >/dev/null 2>&1
shopt -s hostcomplete >/dev/null 2>&1
shopt -s interactive_comments >/dev/null 2>&1
shopt -u mailwarn >/dev/null 2>&1
shopt -s no_empty_cmd_completion >/dev/null 2>&1

# Bash History
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear"
export HISTCONTROL=ignoreboth
shopt -s histappend >/dev/null 2>&1

# Ruby Settings
export RUBY_VERSION=1.9.2
export RUBY_PATH=/usr/lib/ruby
export GEM_OPEN_EDITOR='rc'

if [[ -s ~/.rvm/scripts/rvm ]] ; then
  source ~/.rvm/scripts/rvm ;
  rvm use ree # evil temp fix
fi

# Fix Ruby version
if [ !`which install_ruby 2>/dev/null` ] && [ `which ruby 2>/dev/null` ]; then
  export RUBY_VERSION=$(ruby --version | sed -e "s/^ruby \(.\..\..\).*$/\1/")
fi

function spwd {
  FIXED_PWD=$(echo $PWD | sed "s:^$HOME:~:g")
  if [ ${#FIXED_PWD} -gt $(($PWD_LENGTH)) ]; then
    echo "${FIXED_PWD:0:$((4))}...${FIXED_PWD:$((${#PWD}-$PWD_LENGTH+7)):$(($PWD_LENGTH-7))}"
  else
    echo "$FIXED_PWD"
  fi
}

function prompt {

  # Show last commands exit-code by smiley
  if [ $? = 0 ]; then
    EXITCODE="${COLOR_GREEN_BOLD}✔"
  else
    EXITCODE="${COLOR_RED_BOLD}✘"
  fi
  EXITCODE=$EXITCODE${COLOR_NONE}

  # set variable identifying the chroot you work in (used in the prompt below)
  if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
  fi

  PS1="${debian_chroot:+($debian_chroot)}"

  USER=$(whoami)
  if [ -z $HOSTNAME ]; then
    export HOSTNAME=`hostname -s`
    echo $HOSTNAME
  fi
  # set user and host
  if [ $USER == "root" ]; then
    MACHINE="${COLOR_RED_BOLD}"
  else
    extras=true
    MACHINE="${COLOR_GREEN}"
  fi
  MACHINE="${MACHINE}${USER}@${HOSTNAME}${COLOR_NONE}"

  PS1="${MACHINE}${COLOR_YELLOW_BOLD} \$(spwd)${COLOR_NONE}"


  # Show the current branch
  if [ "$extras" = true ]; then
    source "$HOME"/bin/bash_vcs.sh
    VCS=`echo -e $(__prompt_command)`
  fi
  if [ -z "$VCS" ]; then
    EXITCODE=" ${EXITCODE}"
  else
    VCS="${COLOR_YELLOW_BOLD} ❰${VCS}${COLOR_YELLOW_BOLD}❱ ${COLOR_NONE}"
  fi
  if [ "$extras" = true ]; then
    PS1="$PS1$VCS"
    if [ -f "Rakefile" ] && [ `which ruby 2>/dev/null` ]; then
      PS1="$PS1$RUBY_VERSION "
      # PS1="$PS1 $RUBY_VERSION \$(~/.rvm/bin/rvm-prompt u)"
    fi
  fi

  PS1="$PS1$EXITCODE "
}

# Disable XON/XOFF flow control (^s/^q).
stty -ixon

USER_NAME="jwollert"
USER_EMAIL="johannes.wollert@gmail.com"
# Setting up git.
if [ ! -f ~/.gitconfig ]; then
  git config --global alias.ps push
  git config --global alias.pl "pull --no-ff"
  git config --global alias.mr "merge --no-ff"
  git config --global alias.b branch
  git config --global alias.c clone
  git config --global alias.ci commit
  git config --global alias.co checkout
  git config --global alias.st status
  git config --global alias.chp cherry-pick
  git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset %Cblue%aN%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
  git config --global user.name "$USER_NAME"
  git config --global user.email "$USER_EMAIL"
  git config --global merge.tool vimdiff
  git config --global color.branch auto
  git config --global color.diff auto
  git config --global color.grep auto
  git config --global color.interactive auto
  git config --global color.ui auto
  git config --global help.autocorrect 1
  git config --global push.default matching
  git config --global github.user "GarstgerUnhold"
  git config --global core.excludesfile ~/.global_gitignore
  echo "please add your github token to ~/.gitconf"
else
  if [ "$(git config --global user.name)" != "$USER_NAME" ]; then
    echo "WARNING: git's user.name is $(git config --global user.name)"
  fi
  if [ "$(git config --global user.email)" != "$USER_EMAIL" ]; then
    echo "WARNING: git's user.email is $(git config --global user.email)"
  fi
fi

# OS specific config.
case `uname` in
  Darwin)
    export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home"
    export ALT_BOOTDIR=$JAVA_HOME
	export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/cuda/lib
if [ $(which redcar) ]; then
      export EDITOR="rc"
    fi
    function fullscreen() { printf "\e[3;0;0;t\e[8;0;0t"; return 0; }
	function pdfman() { man -t $1 | open -a /Applications/Preview.app -f; }
    alias ls='ls -G'
    for p in /usr/local/*/bin /usr/*/bin /usr/local/sbin; do
      export PATH=$p:$PATH
    done
    unset p
    gitx() { open -a GitX $@; }
	PATH=$PATH:/usr/local/mysql/bin
    ;;
  Linux)
    export EDITOR="vi"
    for p in /usr/local/*/bin /usr/*/bin; do
      export PATH=$p:$PATH
    done
    unset p
    JAVA_HOME="/usr/lib/jvm/java-6-openjdk"
    PATH=$PATH:/var/lib/gems/1.8/bin:/var/lib/gems/1.9/bin
    alias ls='ls --color=auto'
    ;;
  SunOS)
    stty istrip
    export PATH=/opt/csw/bin:/opt/sfw/bin:$PATH:/etc
    ;;
  *) echo "OS unknown to bashrc." ;;
esac

#JAVA settings
export ALT_BOOTDIR=$JAVA_HOME

# setting up editor
[ -z "$EDITOR" ] && EDITOR="vi"
[ -z "$SVN_EDITOR" ] && SVN_EDITOR="$EDITOR"
git config --global --replace-all core.editor "$SVN_EDITOR"

# Enable color support. Don't add ls here, it behaves different on Darwin/BSD.
if [ -x /usr/bin/dircolors ]; then eval "`dircolors -b`"; fi
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Some more aliases.
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias l.="ls -d .*"
alias pdflatex='pdflatex -shell-escape'
alias vi='vim'
alias screen='screen -U'
alias use='rvm use'
alias gems='gem list | less'
alias less='less -R'
alias gsvn='git svn'
alias gdiff='git diff'
alias st='git st'
alias log='git lg'
alias ciam='git ci -am'
alias cim='git ci -m'
alias gap='git add --patch'
alias gcam='git commit --amend -m'
alias cd..='cd ..'
alias dcommit='git svn dcommit'
alias rebase='git svn rebase'
alias ss='script/server'
alias sc='script/console'
alias bess='bundle exec script/server'
alias besc='bundle exec script/console'
alias be='bundle exec'
alias rc='ruby $HOME/workspace/redcar/bin/redcar --quick '
alias multiforce='$HOME/user-apps/multiforcer/CUDA-Multiforcer '
alias jtr='$HOME/user-apps/dist_john/run/john '
alias john='$HOME/user-apps/dist_john/run/john '
alias nix='$HOME/user-apps/nix/64/brute'

if [ "$extras" = true ]; then
  source ~/.git-completion.bash
fi

# common typos by me
alias dc='cd'
alias sl='ls'
alias gti='git'
alias lg='log'
for cmd in st ci add b c chp lg clone clean push; do alias git$cmd='git $cmd'; done

#if which hub > /dev/null; then
#  alias git=hub
#fi

function et() {
  cmd=$EDITOR
  if [ $# = 0 ]; then
    paths="."
  else
    paths=$@
  fi
  for path in $paths; do
    for file in $path/*; do
      case $(basename $file) in
        .git|.svn|.DS_Store|*~|vendor|log|*cache*) ;;
        *) cmd=$cmd" "$file
      esac
    done
  done
  $cmd
}

# shorthands - i do this a lot
ruby_version() { if [ -z $1 ]; then echo $RUBY_VERSION; else RUBY_VERSION=$1; fi; }

# if cat is called on a directory, call ls instead
cat() {
  if [ $# = 1 ] && [ -d $1 ]; then
    ls $1
  else
    `which cat` "$@"
  fi
}

# push SSH public key to another box
push_ssh_cert() {
  local _host
  test -f ~/.ssh/id_dsa.pub || ssh-keygen -t dsa
  for _host in "$@"; do
    echo $_host
    ssh $_host 'mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_dsa.pub
  done
}

# push dotfiles to remote host
push_dotfiles() {
  local _host
  for _host in "$@"; do
    echo $_host
    ssh $_host '
      if [ ! $(which git) ]; then
        for installer in apt-get yum port brew; do
          if [ $(which $installer) ]; then break; fi
        done
        sudo $installer install git-core || exit
      fi
      git clone git://github.com/GarstgerUnhold/dotfiles.git $HOME/dotfiles
      ln -sf $HOME/.dot/{.bash_profile,.bashrc,.git_completion,.screenrc} $HOME/'
  done
}

# directory for project
d() {
  for dir in $HOME/workspace/$1 $HOME/Repositories/$1 $HOME/Repositories/*-$1 $HOME/$1 $1 $RUBY_PATH/$RUBY_VERSION/lib/ruby/gems/*/gems/$1-*; do
    if [ -d $dir ]; then
      echo $dir
      break
    fi
  done
  unset dir
}

# do stuff with project
with_project() {
  target=$(d $1)
  if [ $target ]; then
    echo $2 $target
    $2 $target
  else
    echo "unknown project"
  fi
  unset target
}

# cd to project
c() { with_project $1 cd; }

# open project in editor
e() { with_project $1 $EDITOR; }

# Enable programmable completion features.
if [ -f /etc/bash_completion ]; then . /etc/bash_completion; fi
if [ -f ~/.tabtab.bash ]; then . ~/.tabtab.bash; fi
set show-all-if-ambiguous on

# set prompt
PROMPT_COMMAND=prompt

# Clean up.
unset script this dir bin
