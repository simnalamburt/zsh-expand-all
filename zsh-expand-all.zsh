expand-all() {
  zle _expand_alias
  zle expand-word
  zle self-insert
}
zle -N expand-all

expand-all-enter() {
  zle _expand_alias
  zle expand-word
  zle accept-line
}
zle -N expand-all-enter
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(expand-all-enter)

# space expands all aliases, including global
bindkey -M emacs " " expand-all
bindkey -M viins " " expand-all
bindkey -M emacs "^M" expand-all-enter
bindkey -M viins "^M" expand-all-enter

# control-space to make a normal space
bindkey -M emacs "^ " magic-space
bindkey -M viins "^ " magic-space

# normal space during searches
bindkey -M isearch " " magic-space
