# initial setup
export ZSH="$HOME/.oh-my-zsh"

# zsh config
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

# setup aws profile
source "$HOME/.dotfiles/scripts/aws_current_profile.sh"

# fzf config
color_fg="-1"
color_bg="-1"
color_hl="#bd93f9"
color_fg_plus="#50fa7b"
color_bg_plus="-1"
color_hl_plus="#bd93f9"
color_info="#ffb86c"
color_prompt="#50fa7b"
color_pointer="#50fa7b"
color_marker="#ff79c6"
color_spinner="#ff79c6"

theme="--color=fg:$color_fg,bg:$color_bg,hl:$color_hl --color=fg+:$color_fg_plus,bg+:$color_bg_plus,hl+:$color_hl_plus --color=info:$color_info,prompt:$color_prompt,pointer:$color_pointer --color=marker:$color_marker,spinner:$color_spinner,header:$color_fg_plus"

export FZF_DEFAULT_OPTS="$theme \
  --marker='❯' \
  --pointer='❯' \
  --prompt='❯ ' \
  --scrollbar='│' \
  --cycle \
  --layout='reverse' \
  --info='right' \
  --preview-window='right:50%,wrap' \
  --height='100%'"

export LESSOPEN='|$HOME/.dotfiles/scripts/lessfilter.sh %s'
export FZF_COMPLETION_OPTS=" --cycle \
    --ansi \
    --walker-skip='.git,node_modules' \
    --walker='file,dir,follow,hidden'"

zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' menu no
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

export FZF_COMPLETION_TRIGGER='~~'

# options to fzf command
zstyle ':fzf-tab:complete:z:*' fzf-preview 'less ${(Q)realpath}'
zstyle ':fzf-tab:complete:eza:*' fzf-preview 'less ${(Q)realpath}'
zstyle ':fzf-tab:*' continuous-trigger '/'
zstyle ':fzf-tab:*' switch-group 'Left' 'Right'
zstyle ":fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*" fzf-flags "--preview-window=wrap" "${FZF_TAB_DEFAULT_FZF_FLAGS[@]}"
zstyle ":fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*" fzf-preview "[[ -n \${(P)word} ]] && echo \${(P)word} || echo \<unset\>"

# default fzf settings to apply globally
FZF_TAB_DEFAULT_FZF_FLAGS=(
  "--height=90%"
)
zstyle ":fzf-tab:*" fzf-flags "${FZF_TAB_DEFAULT_FZF_FLAGS[@]}"

# autosuggest config
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)

# starship config
export STARSHIP_CONFIG="$HOME/.dotfiles/starship.toml"

# docker completion config
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# eza config
zstyle ':omz:plugins:eza' 'dirs-first' yes
zstyle ':omz:plugins:eza' 'git-status' yes
zstyle ':omz:plugins:eza' 'header' yes
zstyle ':omz:plugins:eza' 'show-group' yes
zstyle ':omz:plugins:eza' 'icons' no
zstyle ':omz:plugins:eza' 'size-prefix' si

# alias-finder config
zstyle ':omz:plugins:alias-finder' autoload yes
zstyle ':omz:plugins:alias-finder' longer no
zstyle ':omz:plugins:alias-finder' exact no
zstyle ':omz:plugins:alias-finder' cheaper yes

# git-auto-fetch plugin config
GIT_AUTO_FETCH_INTERVAL=1200

# zoxide config
alias cd="z"

# fpath is used by zsh to find functions and completions
fpath+="$ZSH_CUSTOM/plugins/zsh-completions/src"

plugins=(
  alias-finder
  aliases
  argocd
  asdf
  brew
  common-aliases
  docker
  eza
  fd
  gcloud
  git
  git-auto-fetch
  golang
  kubectl
  npm
  pre-commit
  qrcode
  redis-cli
  safe-paste
  terraform
  thefuck
  tldr
  zoxide
  starship
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
  fzf
  fzf-tab
)

source "$ZSH/oh-my-zsh.sh"
