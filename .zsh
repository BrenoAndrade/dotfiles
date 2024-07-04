# initial setup
export ZSH="$HOME/.oh-my-zsh"

# zsh config
DISABLE_LS_COLORS="true"

source <(fzf --zsh)

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
  --scrollbar='│' \
  --cycle \
  --layout='reverse' \
  --border='sharp' \
  --info='right' \
  --preview-window='right:50%,wrap' \
  --height='100%' \
  --min-height='100'" 

export LESSOPEN='|$HOME/.dotfiles/scripts/lessfilter.sh %s'
export FZF_COMPLETION_TRIGGER='**'
export FZF_COMPLETION_OPTS="--tiebreak=chunk,index \
    --cycle \
    --no-hscroll \
    --no-separator \
    --ansi \
    --walker-skip='.git,node_modules' \
    --walker='file,dir,follow,hidden' \
    --preview-window='top:50%,wrap'"

FZF_ALT_C_COMMAND= source <(fzf --zsh)

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' menu no
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
export FZF_COMPLETION_OPTS=$FZF_COMPLETION_OPTS' --border --info=inline --prompt="Search: "'

zstyle ':fzf-tab:complete:z:*' fzf-preview 'less ${(Q)realpath}' 
zstyle ':fzf-tab:complete:eza:*' fzf-preview 'less ${(Q)realpath}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'less ${(Q)realpath}'
zstyle ':fzf-tab:*' continuous-trigger '/'
zstyle ':fzf-tab:*' switch-group 'Left' 'Right'
zstyle ':fzf-tab:*' fzf-preview 'less'

# autosuggest config
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
ZSH_AUTOSUGGEST_USE_ASYNC="true"

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
zstyle ':omz:plugins:eza' 'icons' yes
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
fpath+="$ZSH_CUSTOM/zsh-completions/src"

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
