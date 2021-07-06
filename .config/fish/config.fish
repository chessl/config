###################################################################
# General
###################################################################

# clear welcome message
set fish_greeting

set -gx TERM xterm-256color

set -gx EDITOR nvim

###################################################################
# Theme
###################################################################

# starship prompt
starship init fish | source

# activate .dircolors
test -r "~/.dir_colors" && eval (dircolors ~/.dir_colors)

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
# Alias
###################################################################

command -qv nvim && alias vim nvim

# better ls
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"

# alias preview="fzf --preview 'bat --color \"always\" {}'"
# alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
# alias help='tldr'
# alias vimdiff="nvim -d"
alias brewup="brew update; brew upgrade; brew upgrade --cask; brew cleanup; brew doctor"

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
# Function
###################################################################

function brew
    set -xl PATH $PATH # Protect global PATH by local PATH
    if type -q pyenv; and contains (pyenv root)/shims $PATH
        set -e PATH[(contains -i (pyenv root)/shims $PATH)]
    end

    command brew $argv
end

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


# asdf
source (brew --prefix asdf)/asdf.fish
. ~/.asdf/plugins/java/set-java-home.fish

source path.fish
