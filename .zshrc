# Set PATH and other env vars
export JAVA_HOME=$(/usr/libexec/java_home -v 21.0.5)
export PATH=$HOME/.local/bin:/opt/local/bin:$JAVA_HOME/bin:$PATH

LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8


# Setup zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Setup starsship
if [ which starship &> /dev/null ]; then
	curl -sS https://starship.rs/install.sh | sh
fi

# Setup zoxide
if [ which zoxide &> /dev/null ]; then
	curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi


# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load completions
autoload -U compinit && compinit
# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={a-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


# Keybindings
set -o emacs
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# FZF keybindings
eval "$(fzf --zsh)"

export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

# Aliases
alias ls="lsd -lah --git"
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias glp='git log --pretty=format:"%C(yellow)%h%Creset - %C(green)%an%Creset, %ar : %s"'

alias antlr4='java -Xmx500M -cp "$HOME/Downloads//antlr-4.13.2-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java -Xmx500M -cp "$HOME/Downloads/antlr-4.13.2-complete.jar:./build:$CLASSPATH" org.antlr.v4.gui.TestRig'


# End of zshrc

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if [[ "$(uname -s)" == "Linux" ]]; then
	# Linux-specific commands
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
