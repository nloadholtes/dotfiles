#zmodload zsh/zprof

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

# From https://github.com/mrnugget/dotfiles/blob/2bdf21b659cbf34f21a0716bfac1f90914426a87/zshrc?utm_source=substack&utm_medium=email#L18-L35
# But might not be needed is using atuin (see bottom of this file)
setopt INC_APPEND_HISTORY     # Immediately append to history file.
setopt EXTENDED_HISTORY       # Record timestamp in history.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS       # Dont record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_SPACE      # Dont record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS      # Dont write duplicate entries in the history file.
setopt SHARE_HISTORY          # Share history between all sessions.
unsetopt HIST_VERIFY          # Execute commands using history (e.g.: using !$) immediately

# Useful
alias upgrade_zoom="curl -L -o /tmp/zoom_amd64.deb https://zoom.us/client/latest/zoom_amd64.deb && sudo dpkg -i /tmp/zoom_amd64.deb"

[ -f ~/.quantumrc ] && source ~/.quantumrc

export WORKSPACE="$HOME/workspace"

# Force autocompletion to work by activating compdef
autoload -Uz compinit
compinit

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

on() {
    local title="$@"
	local snake_case_title=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed 's/ /_/g')
    local date=$(date +%Y-%m-%d)
    local filename="$HOME/projects/github/improved-memory/inbox/${date}_${snake_case_title// /_}.md"

    mkdir -p "$(dirname "$filename")"

    cat << EOF > "$filename"
---
title: $title
date: $date
tags:
  - 
---

# $title


EOF

    # Open the file in Neovim
    vi "$filename"
}

# A great way to clean up docker containers and images that aren't used anymore
alias dockercleancontainers="docker rm \$(docker ps -a --no-trunc | grep 'Exit' | awk '{print \$1}')"
alias dockercleanimages='docker rmi $(docker images -f dangling=true -q)'
alias dockerclean='dockercleancontainers && dockercleanimages'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

#zprof

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/nick.loadholtes/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

source ~/powerlevel10k/powerlevel10k.zsh-theme

# Not sure why/what added this, but it is gone now.
#. "$HOME/.local/bin/env"
