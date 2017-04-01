# Fix VTE functions
source /etc/profile.d/vte.sh

# Colors, caches!
export PATH="/usr/lib/colorgcc/bin/:$HOME/bin:/usr/local/bin:$PATH"
export CCACHE_PATH="/usr/bin"

# Command not found!
source /usr/share/doc/pkgfile/command-not-found.zsh

# The fuck?
eval "$(thefuck --alias)"

# Fix Bundler
GEM_HOME=$(ruby -e 'print Gem.user_dir')

# Speed up Wine
export WINEDEBUG=-all

# Reset swap
alias swapclean="sudo sh -c 'swapoff -a; swapon -a'"

# No more frustration with directories
md() {
  mkdir -p "$1" && cd "$1";
}

ZPLUG_HOME=~/.local/share/zplug

source ~/.local/share/zplug/init.zsh

# Build upon Zim
zplug "Eriner/zim"

# Zim hasn't got these built-in
zplug "zsh-users/zsh-autosuggestions"
zplug "plugins/systemd",   from:oh-my-zsh
zplug "plugins/archlinux", from:oh-my-zsh
zplug "plugins/sudo",      from:oh-my-zsh

# No local plugins yet
#zplug "~/.zsh", from:local

# Let's speed up the process and disable this
# Install plugins if there are plugins that have not been installed
#if ! zplug check --verbose; then
    #printf "Install? [y/N]: "
    #if read -q; then
        #echo; zplug install
    #fi
#fi

# Then, source plugins and add commands to $PATH
zplug load #--verbose

# Neither too bright, neither too cold
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg\=244

# Shorter wait on changing modes
KEYTIMEOUT=25

# Change the prompt when in normal mode
VIM_PROMPT="❯"
PROMPT='%(?.%F{magenta}.%F{red})${VIM_PROMPT}%f '

prompt_pure_update_vim_prompt() {
  zle || {
    print "error: pure_update_vim_prompt must be called when zle is active"
    return 1
  }
  VIM_PROMPT=${${KEYMAP/vicmd/%S❯%s}/(main|viins)/❯}
  zle .reset-prompt
}

function zle-line-init zle-keymap-select { 
    prompt_pure_update_vim_prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

bindkey -s '\el' 'ls\n' 
