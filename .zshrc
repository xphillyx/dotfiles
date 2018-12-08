export ZSH="/home/saddaddy/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
alias subl="subl3 --add"
export XDG_CONFIG_HOME="${HOME}/.config"
export PATH="${HOME}/.local/bin:${PATH}"

# nodejs modules do not override PATH
export PATH="${PATH}:${HOME}/.local/nodebin"
