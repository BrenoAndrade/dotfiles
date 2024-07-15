echo "starting dotfiles setup"

echo "checking if homebrew is installed"
if test ! $(which brew); then
    echo "installing homebrew"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "checking if zsh is installed"
if test ! $(which zsh); then
    echo "installing zsh"
    brew install zsh
fi

if [ -z "$ZSH" ]; then
    export ZSH="${ZSH:-$HOME/.oh-my-zsh}"
fi

if [ -z "$ZSH_CUSTOM" ]; then
    export ZSH_CUSTOM="${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}"
fi

echo "change default shell to zsh"
chsh -s $(which zsh)

echo "checking if oh-my-zsh is installed"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "installing oh-my-zsh"
    zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "installing homebrew packages"
cmd="brew install \
    lesspipe \
    exiftool \
    chafa \
    fzf \
    bat \
    fd \
    ripgrep \
    pygments \
    starship
"
eval $cmd

echo "installing oh-my-zsh plugins with git"

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
git clone https://github.com/Aloxaf/fzf-tab $ZSH_CUSTOM/plugins/fzf-tab
git clone https://github.com/bigH/git-fuzzy.git $ZSH_CUSTOM/plugins/git-fuzzy
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting