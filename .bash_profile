# Supress "Bash no longer supported" message
export BASH_SILENCE_DEPRECATION_WARNING=1

## GENERAL OPTIONS ##

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

## SMARTER TAB-COMPLETION (Readline bindings) ##

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

## SANE HISTORY DEFAULTS ##

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

## BETTER DIRECTORY NAVIGATION ##

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projects folder
CDPATH="."

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars

# XDG directories

## User directories
[[ -z ${XDG_CONFIG_HOME:-} ]] && export XDG_CONFIG_HOME="$HOME/.config"
[[ -z ${XDG_CACHE_HOME:-} ]] && export XDG_CACHE_HOME="$HOME/.cache"
[[ -z ${XDG_DATA_HOME:-} ]] && export XDG_DATA_HOME="$HOME/.local/share"
if [[ -z ${XDG_RUNTIME_DIR:-} ]]; then
  export XDG_RUNTIME_DIR="$TMPDIR/xdg-$USER"
  [[ ! -d $XDG_RUNTIME_DIR ]] && mkdir -p "$XDG_RUNTIME_DIR"
fi

## User custom directories
[[ -z ${XDG_DESKTOP_DIR:-} ]] && export XDG_DESKTOP_DIR="$HOME/Desktop"
[[ -z ${XDG_DOCUMENTS_DIR:-} ]] && export XDG_DOCUMENTS_DIR="$HOME/Documents"
[[ -z ${XDG_DOWNLOAD_DIR:-} ]] && export XDG_DOWNLOAD_DIR="$HOME/Downloads"
[[ -z ${XDG_MUSIC_DIR:-} ]] && export XDG_MUSIC_DIR="$HOME/Music"
[[ -z ${XDG_PICTURES_DIR:-} ]] && export XDG_PICTURES_DIR="$HOME/Pictures"
[[ -z ${XDG_PUBLICSHARE_DIR:-} ]] && export XDG_PUBLICSHARE_DIR="$HOME/Public"
[[ -z ${XDG_TEMPLATES_DIR:-} ]] && export XDG_TEMPLATES_DIR="$HOME/tmp"
[[ -z ${XDG_VIDEOS_DIR:-} ]] && export XDG_VIDEOS_DIR="$HOME/Videos"

## System directories
# a set of preference ordered base directories relative to which data files should be searched
[[ -z ${XDG_DATA_DIRS:-} ]] && export XDG_DATA_DIRS="/usr/local/share:/usr/share"
# a set of preference ordered base directories relative to which configuration files should be searched
[[ -z ${XDG_CONFIG_DIRS:-} ]] && export XDG_CONFIG_DIRS="/etc/xdg"


# Free up ctrl+s and ctrl+q
stty -ixon -ixoff

export https_proxy=http://127.0.0.1:8234
export http_proxy=http://127.0.0.1:8234
export all_proxy=socks5://127.0.0.1:8235
export NO_PROXY=localhost,127.0.0.1

eval "$(/opt/homebrew/bin/brew shellenv)"

# StarShip Prompt
if type starship &> /dev/null; then
  eval "$(starship init bash)"
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Set the default editor
export EDITOR=nvim
export VISUAL=nvim

# for GPG signing
export GPG_TTY=$(tty)

# To have colors for ls and all grep commands such as grep, egrep and zgrep
alias ls="ls --color=auto -F"
alias brewup="brew update && brew upgrade && brew upgrade --cask && brew cleanup && brew doctor"
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
 
# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Bash Autocompletion
if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

# Node
# Increases the default memory limit for Node, so larger Angular projects can be built
export NODE_OPTIONS=--max_old_space_size=8192
 
# CoreUtils
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
# FindUtils
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
# grep
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
# curl
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include"
# gnu-sed                                                                       
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

# GEN
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
 
# asdf
. $(brew --prefix asdf)/libexec/asdf.sh
