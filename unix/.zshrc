# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# For some reason zsh isn't doing this automattically
source ~/.zprofile

#
## zsh stuff
export SAVEHIST=1000000000
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTFILE=~/.zsh_history
export HISTTIMEFORMAT="[%F %T] "
#
setopt HIST_FIND_NO_DUPS
# following should be turned off, if sharing history via setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY


[ -f ~/.quantumrc ] && source ~/.quantumrc

export WORKSPACE="$HOME/workspace"

# To customize prompt, run `p10k configure` or edit ~/projects/github/dotfiles/unix/.p10k.zsh.
[[ ! -f ~/projects/github/dotfiles/unix/.p10k.zsh ]] || source ~/projects/github/dotfiles/unix/.p10k.zsh

if command -v kubectl > /dev/null 2>&1 ; then
	source <(kubectl completion zsh)
fi

if command -v k3d > /dev/null 2>&1; then
	source <(k3d completion zsh)
fi

if command -v helm > /dev/null 2>&1; then
	source <(helm completion zsh)
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
