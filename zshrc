export LANG=en_US.UTF-8

# Fixed directory for user specific data
export PATH=$HOME/.local/bin:$PATH

# Swift lsp (sourcekit-lsp)
export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp

# Ripgrep file configuration
export RIPGREP_CONFIG_PATH=$HOME/.config/.ripgreprc

# NPM installed globally
export PATH=$PATH:/usr/local/lib/node_modules

# DataWarrior program
export PATH=$PATH:$HOME/Documents/Rust/DataWarrior/target/release

# Neovide
# release was moved to .local/bin
#export PATH=$PATH:$HOME/neovide/target/release

# Homebrew
export PATH="/usr/local/sbin:$PATH"

#Julia lang
export PATH=$PATH:/Applications/Julia-1.7.app/Contents/Resources/julia/bin

# Aseprite bin
export PATH=$PATH:$HOME/aseprite/build/bin/

#**************************
# Tools and aliases
#**************************

# Neovide opening with some flags
alias nv="neovide --geometry=80x40 --multigrid"

# Aseprite launch
alias aseprite="nohup aseprite &"

# ls change to exa 
alias ls="exa --icons"

alias tree="exa --icons -T"

# cat change to bat
alias cat="bat"

# Fix usb problem connecting/disconnecting iphone
alias usbfix="sudo killall -STOP -c usbd"

# cd change to zoxide 
eval "$(zoxide init zsh)"
alias cd=z

# ******************************************
# Prompt
# ******************************************
# Starship configuration
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"

# Old prompt
#PROMPT='%F{78}%(!.#. )%f '
#PROMPT='%B%F{5}%1~ %f%b%F{10}%(!.#. )%f '
#PROMPT='%B%F{10}%1~ %f%b%F{31}%(!.#.λ:)%f '
#PROMPT='%B%F{blue}%(!.#.λ)%f %F{10}|%2~|%b%f '

# Write an empty line before prompt and 
# write the current directory in the title
#precmd () {
#    print ""
#    print -Pn "\e]0;%~\a"
#}

# ******************************************
# ******************************************

PATH="/Users/louis/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/louis/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/louis/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/louis/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/louis/perl5"; export PERL_MM_OPT;

alias luamake=/Users/louis/lua-language-server/3rd/luamake/luamake

fpath+=${ZDOTDIR:-~}/.zsh_functions
