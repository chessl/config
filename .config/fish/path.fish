# surge proxy
export https_proxy=http://127.0.0.1:8234
export http_proxy=http://127.0.0.1:8234
export all_proxy=socks5://127.0.0.1:8235
export NO_PROXY=localhost,127.0.0.1

fish_add_path /opt/homebrew/bin

# coreutils: compatible issue with asdf plugins
# fish_add_path (brew --prefix coreutils)/libexec/gnubin

# findutils
fish_add_path (brew --prefix findutils)/libexec/gnubin


# set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

set -x PATH /usr/local/opt/libxml2/bin $PATH
set -x PATH /usr/local/opt/libxslt/bin $PATH

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/texinfo/bin" $fish_user_paths

# Python
set -g fish_user_paths "/usr/local/opt/python@3.9/bin" $fish_user_paths
# set -gx LDFLAGS "-L/usr/local/opt/python@3.9/lib"
# set -gx PKG_CONFIG_PATH "/usr/local/opt/python@3.9/lib/pkgconfig"

set -Ux PYENV_ROOT "$HOME/.pyenv"
# set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths

# Golang
set -x GOPATH $HOME/Projects/go
set -x GOROOT /usr/local/opt/go/libexec
set -x PATH $PATH /user/local/go/bin $GOPATH/bin
set -x PATH $PATH $GOROOT/bin

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
set -g fish_user_paths "/usr/local/opt/libpq/bin" $fish_user_paths
set -gx LDFLAGS "-L/usr/local/opt/libpq/lib"
set -gx CPPFLAGS "-I/usr/local/opt/libpq/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/libpq/lib/pkgconfig"

# ruby
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
set -gx LDFLAGS "-L/usr/local/opt/ruby/lib"
set -gx CPPFLAGS "-I/usr/local/opt/ruby/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/ruby/lib/pkgconfig"

# JAVA Maven
set -gx MAVEN_HOME "/usr/local/apache-maven-3.8.1"
fish_add_path /usr/local/apache-maven-3.8.1/bin

# curl
fish_add_path /opt/homebrew/opt/curl/bin
set -gx LDFLAGS "-L/opt/homebrew/opt/curl/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/curl/include"
set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/curl/lib/pkgconfig"

# for compatibility issue
# fish_add_path /usr/bin
