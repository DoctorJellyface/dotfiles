export DEFAULT_USER=juraj

alias mutt="torify mutt 2>/dev/null"

# Powerline!
. /usr/share/zsh/site-contrib/powerline.zsh

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# The fuck?
eval "$(thefuck --alias)"

# ccache dir
export CCACHE_DIR=/build/ccache

# Reset swap
alias swapclean='sudo swapoff -a && sudo swapon -a'

# Fuzzy matching of completions for when you mistype them:

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# And if you want the number of errors allowed by _approximate to
# increase with the length of what you have typed so far:

zstyle -e ':completion:*:approximate:*' \
        max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# Completing process IDs with menu selection:

#zstyle ':completion:*:*:kill:*' menu yes select
#zstyle ':completion:*:kill:*'   force-list always

# If you end up using a directory as argument, this will remove the
# trailing slash (usefull in ln)

zstyle ':completion:*' squeeze-slashes true

# cd will never select the parent directory (e.g.: cd ../<TAB>):

zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Another method for quick change directories. Add this to your ~/.zshrc,
# then just enter “cd ..../dir”

rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot
