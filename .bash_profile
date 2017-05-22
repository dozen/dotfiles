export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init - bash)"

alias vim=nvim
alias vi=nvim

source ~/.config/git/git-completion.bash

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

PATH="$HOME/go/bin:$PATH"

if [ -e ~/.bash_profile.local ]; then
  source ~/.bash_profile.local
fi
