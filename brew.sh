#!/usr/bin/env bash

###################################################################
# Shell
###################################################################

brew install fish
brew install starship
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

###################################################################
# Basics
###################################################################

# Install GNU core utilities (those that come with OS X are outdated).
brew install coreutils
# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
brew install grep
brew install curl
# Install `wget` with IRI support.
brew install wget --with-iri
brew install gpg
# Install GnuPG to enable PGP-signing commits.
brew install gnupg
brew install tree
brew install tmux
brew install reattach-to-user-namespace

###################################################################
# Development
###################################################################

brew install asdf
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
# Command-line wrapper for git that makes working with GitHub easy
brew install hub
brew install ssh-copy-id
brew install httpie


###################################################################
# Media
###################################################################

brew install imagemagick --with-webp
brew install ffmpeg --with-libvpx --with-webp --with-x265
# CLI for extracting streams from various websites to a video player of your choosing
brew install streamlink
brew install youtube-dl

###################################################################
# Productive tools
###################################################################

# Fastest search tool, faster than grep, ack, and ag
brew install ripgrep
# cd command that learns
brew install autojump
# Replacement for 'ls' written in Rust
brew instal exa
# Command-line fuzzy finder
brew install fzf
# Fetches system/theme information in terminal for Linux desktop screenshots
brew install neofetch
# Instant code answers and examples from the command line
brew install howdoi
# Simplified and community-driven man pages
brew install tldr
# a lightweight and flexible command-line JSON processor
brew install jq

###################################################################
# Other tools
###################################################################

# converts source code to formatted text with syntax highlighting
brew install highlight
# speed test
brew install speedtest_cli
# tor
brew install tor


###################################################################
# macOS tools
###################################################################

# CLI tool that moves files or folder to the trash
brew install trash
# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install homebrew/x11/xpdf
# brew install xz

# Install other useful binaries.
# brew install ack
# brew install dark-mode
# brew install exiv2

# Core casks
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="~/Applications" iterm2

# Development tool casks
brew cask install --appdir="/Applications" sublime-text

# Misc casks
brew cask install --appdir="/Applications" google-chrome


# Remove outdated versions from the cellar.
brew cleanup
