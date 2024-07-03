
# personalized command fzf
source <(fzf --zsh)

plugins=(
  fzf
  fzf-tab
)

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# fzf theme
export FZF_DEFAULT_OPTS="
  --color=fg:-1,bg:-1,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:-1,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#50fa7b --color=marker:#ff79c6,spinner:-1,header:#6272a4 \
  --padding=0,1 --prompt='' \
  --marker='❯' --pointer='❯' --separator='' --scrollbar='│' --cycle \
  --layout='reverse' --info='right' --border='sharp' --no-header --preview-window='right:50%'"


export LESSOPEN='|$HOME/.dotfiles/scripts/lessfilter.sh %s'

# fzf
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no

# fzf-tab
zstyle ':fzf-tab:complete:z:*' fzf-preview 'less ${(Q)realpath}'
zstyle ':fzf-tab:complete:cat:*' fzf-preview 'less ${(Q)realpath}'
zstyle ':fzf-tab:*:git-checkout:*' fzf-preview 'less ${(Q)realpath}'