# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"
# setting variables
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000

# prompt variables
PROMPT="%F{104}[%m] %f%F{208}%n%%%f "
RPROMPT="[%1(v|%F{82}%1v%f|) %~]"
SPROMPT="correct: %R -> %r ? "

# emacs keybind
bindkey -e

# completion setting
FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit
# Speed up compinit by checking cache once per day
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump 2>/dev/null) ]; then
  compinit
else
  compinit -C
fi

# VCS
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' actionformats '%b|%a'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# cdr
autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs

# zmv
autoload -Uz zmv

# history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# colorize list
zstyle ':completion:*' list-colors ''
autoload -Uz vcs_info

# colorize by name
autoload -Uz colors
colors

# word separation
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|."
zstyle ':zle:*' word-style unspecified

# disable ^Q/^S flow control
setopt no_flow_control

# ignore duplication command history list
setopt hist_ignore_dups

# share command history data
setopt share_history

# cd command abbriviation
setopt auto_cd

# execute pushd automatically
setopt auto_pushd

# block beep sound
setopt no_beep

# list files/directories automatically
setopt auto_list

# show identifier mark in listing
setopt list_types

# file name completion
setopt auto_param_keys
setopt auto_param_slash
setopt auto_remove_slash
setopt no_menu_complete

# **/* glob
setopt extended_glob

# transient RPROMPT
setopt transient_rprompt

# deployment variables to prompt
setopt prompt_subst

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# command line highlighting
#source ~/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.dotfiles/zsh-syntax-highlighting/themes/catppuccin_macchiato-zsh-syntax-highlighting.zsh

# User specific environment and startup programs
PATH=$HOME/.bin:$HOME/.rbenv/bin:/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/Applications/android-sdk-macosx/platform-tools:/Applications/android-sdk-macosx/tools:/usr/local/opt/go/libexec/bin:/usr/local/share/dotnet/:~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools
#export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
#PATH=${JAVA_HOME}/bin:${PATH}
#LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/opt/mysql/server-5.6/lib
#PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
#SCALA_HOME=/usr/local/scala
export GOPATH=$HOME/.go

# OSのタイプによって切り分け
case "$OSTYPE" in
  darwin*)
    PATH=/opt/chefdk/bin:/usr/local/Cellar/gradle/bin:$PATH
    export GRADLE_HOME=/usr/local/Cellar/gradle/2.2.1
    alias ls="ls -G"
    export LANG="ja_JP.UTF-8"
    export LANGUAGE="ja_JP.UTF-8"
    export LC_ALL="ja_JP.UTF-8"
    ;;
  linux*)
    alias ls="ls --color"
    export LANG="ja_JP.UTF-8"
    export LANGUAGE="ja_JP.UTF-8"
    export LC_ALL="ja_JP.UTF-8"
    ;;
esac

# Environment variables
export LD_LIBRARY_PATH
export PKG_CONFIG_PATH
export PATH
export SCALA_HOME

alias ag=rg
alias vi=nvim
alias vim=nvim
alias r=rails
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -m'
alias gca='git commit --amend --no-edit'
alias gco='git checkout'
alias gcdf='git clean -df'
alias gd='git diff'
alias gs='git status'

alias dcb='docker compose build'
alias dcbnc='docker compose build --no-cache'
alias dcd='docker compose down'
alias dcp='docker compose ps'
alias dcu='docker compose up -d'
alias gw='cd ~/work'

alias run_localstack='docker run --rm -it -d -p 127.0.0.1:4566:4566 -p 127.0.0.1:4510-4559:4510-4559 -v /var/run/docker.sock:/var/run/docker.sock localstack/localstack'

alias gw='cd /Volumes/DataVault/work/'
# XDEBUG
# export XDEBUG_CONFIG="idekey=DBGP"
# export XDEBUG_SESSION_START=DBGP
# # Lazy load rbenv for faster shell startup
alias rbenv='unalias rbenv ruby bundle gem; eval "$(rbenv init -)" && rbenv'
alias ruby='unalias rbenv ruby bundle gem; eval "$(rbenv init -)" && ruby'
alias bundle='unalias rbenv ruby bundle gem; eval "$(rbenv init -)" && bundle'
alias gem='unalias rbenv ruby bundle gem; eval "$(rbenv init -)" && gem'

# ctags for GNU Global
export GTAGSLABEL=exuberant-ctags

# Default Editor
export EDITOR=nvim

setopt nonomatch

export XDG_CONFIG_HOME=~/.config

# For Tmux PowerLine
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
# Lazy load rbenv for faster shell startup
alias rbenv='unalias rbenv ruby bundle gem; eval "$(rbenv init -)" && rbenv'
alias ruby='unalias rbenv ruby bundle gem; eval "$(rbenv init -)" && ruby'
alias bundle='unalias rbenv ruby bundle gem; eval "$(rbenv init -)" && bundle'
alias gem='unalias rbenv ruby bundle gem; eval "$(rbenv init -)" && gem'

#export PATH="/usr/local/opt/php@7.2/bin:$PATH"
#export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
#export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
# Lazy load NVM for faster shell startup
alias nvm='unalias nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm'
alias node='unalias nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; node'
alias npm='unalias nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; npm'
alias npx='unalias nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; npx'

export PATH="$PATH":"$HOME/.pub-cache/bin"
alias python="python3"
alias pip="pip3"

#export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#eval "$(pyenv init -)"

function docker_search_tags() {
  curl -s -S "https://registry.hub.docker.com/v1/repositories/$1/tags" | jq '.[]["name"]'
}

#if which ruby >/dev/null && which gem >/dev/null; then
#    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
#fi

#export PATH="/usr/local/Cellar/git/2.31.1/bin:$PATH"

function git_current_branch_name()
{
  git branch | grep '^\*' | sed 's/^\* *//'
}
alias -g cbn='"$(git_current_branch_name)"'

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# Lazy load pyenv for faster shell startup
alias pyenv='unalias pyenv python python3 pip pip3; eval "$(pyenv init -)" && pyenv'

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/kuboshima/.config/.dart-cli-completion/zsh-config.zsh ]] && . /Users/kuboshima/.config/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

export PATH="$PATH:$HOME/.pub-cache/bin"

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"
