# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init - bash)"

# なんか便利系
alias l=ls
alias ll="ls -la"
alias vim=nvim
alias vi=nvim

# 補完系
source /usr/local/etc/bash_completion.d/brew
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/npm
source /usr/local/etc/bash_completion.d/tig-completion.bash

# Go
PATH="$HOME/go/bin:$PATH"

# 固有の設定
if [ -e ~/.bash_profile.local ]; then
  source ~/.bash_profile.local
fi
