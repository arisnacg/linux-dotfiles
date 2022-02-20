# alias
alias cat="bat"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias ls="exa --icons --git"
alias ll="exa -l --icons --git"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias so='source ~/.zshrc'
alias k="kubectl"
alias py="python3"

# zsh plugins
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/autojump/autojump.zsh

# zsh syntax highlight configuration
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
ZSH_HIGHLIGHT_STYLES[precommand]=none
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green
ZSH_HIGHLIGHT_STYLES[command]=fg=blue

# nvm configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# starship
eval "$(starship init zsh)"

