###################################################################
# General
###################################################################

# clear welcome message
set fish_greeting

set -gx TERM xterm-256color

set -gx EDITOR nvim

###################################################################
# Variables
###################################################################

# XDG base directory
if test -z "$XDG_DATA_HOME"
    set -g XDG_DATA_HOME $HOME/.local/share
end

if test -z "$XDG_DATA_DIRS"
    set -g XDG_DATA_DIRS /usr/local/share
end

if test -z "$XDG_CONFIG_HOME"
    set -g XDG_CONFIG_HOME $HOME/.config
end

if test -z "$XDG_CONFIG_DIRS"
    set -g XDG_CONFIG_DIRS /etc/xdg
end

if test -z "$XDG_CACHE_HOME"
    set -g XDG_CACHE_HOME $HOME/.cache
end

# XDG user directories

if test -z "$XDG_DESKTOP_DIR"
    set -g XDG_DESKTOP_DIR $HOME/Desktop
end


if test -z "$XDG_DOWNLOAD_DIR"
    set -g XDG_DOWNLOAD_DIR $HOME/Downloads
end

if test -z "$XDG_DOCUMENTS_DIR"
    set -g XDG_DOCUMENTS_DIR $HOME/Documents
end

if test -z "$XDG_MUSIC_DIR"
    set -g XDG_MUSIC_DIR $HOME/Music
end

if test -z "$XDG_PICTURES_DIR"
    set -g XDG_PICTURES_DIR $HOME/Pictures
end

if test -z "$XDG_VIDEOS_DIR"
    set -g XDG_VIDEOS_DIR $HOME/Movies
end

if test -z "$XDG_TEMPLATES_DIR"
    set -g XDG_TEMPLATES_DIR $HOME/Templates
end

if test -z "$XDG_PUBLICSHARE_DIR"
    set -g XDG_PUBLICSHARE_DIR $HOME/Public
end

# Non-standard directories

if test -z "$XDG_STATE_HOME"
    set -g XDG_STATE_HOME $HOME/.local/state
end

# surge proxy
export https_proxy=http://127.0.0.1:8234
export http_proxy=http://127.0.0.1:8234
export all_proxy=socks5://127.0.0.1:8235
export NO_PROXY=localhost,127.0.0.1

# Python
# set -g fish_user_paths "/usr/local/opt/python@3.9/bin" $fish_user_paths
# set -gx LDFLAGS "-L/usr/local/opt/python@3.9/lib"
# set -gx PKG_CONFIG_PATH "/usr/local/opt/python@3.9/lib/pkgconfig"

# set -Ux PYENV_ROOT "$HOME/.pyenv"
# set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths

# Golang
# set -x GOPATH $HOME/Projects/go
# set -x GOROOT /usr/local/opt/go/libexec
# set -x PATH $PATH /user/local/go/bin $GOPATH/bin
# set -x PATH $PATH $GOROOT/bin

# LLVM
# set -gx LLVM_DIR "/usr/local/opt/llvm"
# set -gx LDFLAGS "-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
# set -gx LDFLAGS "-L/usr/local/opt/llvm/lib"
# set -gx CPPFLAGS "-I/usr/local/opt/llvm/include"
# set -g fish_user_paths $fish_user_paths "/usr/local/opt/llvm/bin"
# set -gx LLVM_DIR "/usr/local/Cellar/llvm/8.0.1/lib/cmake"
# set -gx LLVM_INCLUDE_DIRS "/usr/local/opt/llvm/include"
# set -gx LLVM_HOME /Users/chess/Projects/llvm-project/build/bin
# set -x PATH /Users/chess/Projects/llvm-project/build/bin $PATH

# Java 8 for EECS 590
# set -gx JAVA_6_HOME (/usr/libexec/java_home -v1.6)
# set -gx JAVA_8_HOME (/usr/libexec/java_home -v1.8)
# set -gx JAVA_11_HOME (/usr/libexec/java_home -v11)
# set -gx JAVA_13_HOME (/usr/libexec/java_home -v13)

# alias java6='export JAVA_HOME=$JAVA_6_HOME'
# alias java8='export JAVA_HOME=$JAVA_8_HOME'
# alias java11='export JAVA_HOME=$JAVA_11_HOME'
# alias java13='export JAVA_HOME=$JAVA_13_HOME'

# status --is-interactive; and source (pyenv init -|psub)

# Flutter setup
set -g ANDROID_SDK_ROOT "/usr/local/share/android-sdk"
set -g ANDROID_HOME "/usr/local/share/android-sdk"
set -g INTERL_HAXM_HOME = "/usr/local/Caskroom/intel-haxm"
set -g JAVA_HOME (/usr/libexec/java_home -v 1.8)

# postgresql
# set -g fish_user_paths "/usr/local/opt/libpq/bin" $fish_user_paths
# set -gx LDFLAGS "-L/usr/local/opt/libpq/lib"
# set -gx CPPFLAGS "-I/usr/local/opt/libpq/include"
# set -gx PKG_CONFIG_PATH "/usr/local/opt/libpq/lib/pkgconfig"

# ruby
# set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
# set -gx LDFLAGS "-L/usr/local/opt/ruby/lib"
# set -gx CPPFLAGS "-I/usr/local/opt/ruby/include"
# set -gx PKG_CONFIG_PATH "/usr/local/opt/ruby/lib/pkgconfig"

# JAVA Maven
set -gx MAVEN_HOME "/usr/local/apache-maven-3.8.1"
fish_add_path /usr/local/apache-maven-3.8.1/bin

# for compatibility issue
# fish_add_path /usr/bin


###################################################################
# Theme
###################################################################

# starship prompt
if type -q starship
    starship init fish | source
end

# activate .dircolors
test -r "$XDG_CONFIG_HOME/.dir_colors" && eval (dircolors -c $XDG_CONFIG_HOME/.dir_colors)

# Fish syntax highlighting
set -g fish_color_autosuggestion '555'  'brblack'
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape 'bryellow'  '--bold'
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match 'bryellow'  '--background=brblack'
set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

###################################################################
# Apps
###################################################################

if type -q brew
    fish_add_path (brew --prefix)/opt
    fish_add_path (brew --prefix)/bin
    fish_add_path (brew --prefix)/sbin
    fish_add_path (brew --cellar)

    # coreutils: compatible issue with asdf plugins
    fish_add_path (brew --prefix coreutils)/libexec/gnubin

    # findutils
    fish_add_path (brew --prefix findutils)/libexec/gnubin


    set -x MANPATH (brew --prefix coreutils)/libexec/gnuman $MANPATH

    set -x PATH /usr/local/opt/libxml2/bin $PATH
    set -x PATH /usr/local/opt/libxslt/bin $PATH

    set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
    set -g fish_user_paths "/usr/local/opt/texinfo/bin" $fish_user_paths

    # curl
    fish_add_path /opt/homebrew/opt/curl/bin
    set -gx LDFLAGS "-L/opt/homebrew/opt/curl/lib"
    set -gx CPPFLAGS "-I/opt/homebrew/opt/curl/include"
    set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/curl/lib/pkgconfig"

    alias brewup="brew update; brew upgrade; brew upgrade --cask; brew cleanup; brew doctor"

    if test -d (brew --prefix)"/share/fish/completions"
        set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
    end

    if test -d (brew --prefix)"/share/fish/vendor_completions.d"
        set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    end

    function brew
        set -xl PATH $PATH # Protect global PATH by local PATH
        if type -q pyenv; and contains (pyenv root)/shims $PATH
            set -e PATH[(contains -i (pyenv root)/shims $PATH)]
        end

        command brew $argv
    end
end


if type -q asdf
    # asdf
    source (brew --prefix asdf)/asdf.fish
    . ~/.asdf/plugins/java/set-java-home.fish
end


###################################################################
# Alias
###################################################################

command -qv nvim && alias vim nvim

# better ls
# alias ls "ls -p -G"
# alias la "ls -A"
# alias ll "ls -l"
# alias lla "ll -A"

# alias preview="fzf --preview 'bat --color \"always\" {}'"
# alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
# alias help='tldr'
# alias vimdiff="nvim -d"

# Git
# alias gitsync="git branch -r | grep -v '\->' | while read remote; do git branch --track "$remote#origin/" "$remote"; done && git pull --all"
# alias gpom="git pull origin master"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# config for backup
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

# powerline font
set fish_function_path $fish_function_path "{repository_root}/powerline/bindings/fish"

# set yarn binaries on path
# must be below the .asdf source commands ^
# set -x PATH (yarn global bin) $PATH

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# exa for ls
if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end


###################################################################
# Auto Completion
###################################################################

###################################################################
# Function
###################################################################

# repeat previous command with administrator rights
function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

# shortcut to browse parent directory
function ..
    cd ..
end
function cd..
    cd ..
end
# source /usr/local/opt/asdf/asdf.fish

# Transfer
function transfer
    if test (count $argv) -eq 0
        echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
        return 1
    end
    ## get temporarily filename, output is written to this file show progress can be showed
    set tmpfile ( mktemp -t transferXXX )
    ## upload stdin or file
    set file $argv[1]
    #if tty -s;
    #then
    set basefile (basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g')
    #    if [ ! -e $file ];
    #    then
    #        echo "File $file doesn't exists."
    #        return 1
    #    fi
    if test -d $file
        # zip directory and transfer
        set zipfile ( mktemp -t transferXXX.zip )
        # echo (dirname $file)
        #cd (dirname $file) and echo (pwd)
                    zip -r -q - $file >> $zipfile
                    curl --progress-bar --upload-file "$zipfile" "https://transfer.sh/$basefile.zip" >> $tmpfile
        rm -f $zipfile
    else
    # transfer file
        curl --progress-bar --upload-file "$file" "https://transfer.sh/$basefile" >> $tmpfile
    end
    #else
    #    # transfer pipe
    #    curl --progress-bar --upload-file "-" "https://transfer.sh/$file" >> $tmpfile
    #fi
    ## cat output link
    cat $tmpfile
    ## cleanup
    rm -f $tmpfile
end

# Del
function del
    mv "$argv" ~/.Trash/ && find ~/.Trash -mtime +30 -delete
end


