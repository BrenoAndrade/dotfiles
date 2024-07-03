# starship prompt

function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}
starship_precmd_user_func="set_win_title"

export STARSHIP_CONFIG=~/.dotfiles/starship.toml

eval "$(starship init zsh)"

# setup aws profile
source "$HOME/.dotfiles/scripts/aws_current_profile.sh"

# setup zinit
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# load a few important annexes, without Turbo
# (this is currently required for annexes)

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \
    Aloxaf/fzf-tab

zinit light-mode for \
    zdharma/fast-syntax-highlighting \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions \
    MichaelAquilina/zsh-auto-notify \
    MichaelAquilina/zsh-you-should-use

# setup fzf
source "$HOME/.dotfiles/fzf.zsh"

# setup zsh plugins
plugins=(
    # fzf
    # fzf-tab
    git 
    asdf 
    docker
    terraform
    zsh-kubectl-prompt
    kubectl
    brew
    zsh-navigation-tools
    git-auto-fetch
    bundler
    dotenv
    macos
    rake
    rbenv
    ruby
    aliases
    alias-finder
    per-directory-history
    zsh-interactive-cd
    docker-compose
    jump
    web-search
    npm
    yarn
    node
    thefuck
)

zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
zstyle ':omz:plugins:alias-finder' longer yes # disabled by default
zstyle ':omz:plugins:alias-finder' exact yes # disabled by default
zstyle ':omz:plugins:alias-finder' cheaper yes # disabled by default

eval "$(thefuck --alias fk)"
eval "$(zoxide init zsh)"

alias cd="z"