# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

# Select the oh-my-zsh and p10k as the zsh settings "base"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

DEFAULT_USER=$(whoami) 

# Turn on zsh command corrections
ENABLE_CORRECTION="true"

#Plugins
plugins=(
  git 
  zsh-syntax-highlighting 
  brew
  docker-compose
  docker
  golang
  python
  copyfile
  copydir
  colorize
  web-search
  zsh-z
  )

# Activate oh-my-zsh and p10k
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Keep zsh-symtax-highlighting from having a fit with long copy pastes
export ZSH_HIGHLIGHT_MAXLENGTH=60
export CLICOLOR=1

# Aliases
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias dcd='docker-compose down --remove-orphans'
alias dclean='docker stop $(docker ps -a -q);docker rm -v $(docker ps -a -q); docker rmi -f $(docker images -q)'
alias dcu='docker-compose down; docker-compose up'
alias dcud='docker-compose down; docker-compose up -d'
alias dcub='docker-compose down; docker-compose up --build'
alias reload="exec $SHELL -l"
alias ls="ls -ApCh --group-directories-first --color"


# # Add fzf fuzzy matching for ctrl-r
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Make Pyenv auto de/activate venvs when moving through directories
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

eval $(ssh-agent) > /dev/null


 