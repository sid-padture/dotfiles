export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

DEFAULT_USER=$(whoami) 

# UI
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "

# Git
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

# Prompt elements & structure
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator time dir_writable vpn_ip ram background_jobs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Displays directories like: ../Documents/project/src
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_DELIMITER=".."

# Clock
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"
POWERLEVEL9K_TIME_BACKGROUND='white'

# RAM
POWERLEVEL9K_RAM_BACKGROUND='yellow'

# Command return code config
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=true

# Make virtualenv display properly with the fancy stuff above
VIRTUAL_ENV_DISABLE_PROMPT=1

# Turn on zsh command corrections
ENABLE_CORRECTION="true"

#Plugins
plugins=(
  git 
  git-open 
  zsh-syntax-highlighting 
  aws
  brew
  docker-compose
  docker-machine
  docker
  golang
  python
  copyfile
  copydir
  colorize
  web-search
  )

source $ZSH/oh-my-zsh.sh

# Keep zsh-symtax-highlighting from having a fit with long copy pastes
export ZSH_HIGHLIGHT_MAXLENGTH=60

# Aliases
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias dcd='docker-compose down --remove-orphans'
alias dclean='docker stop $(docker ps -a -q);docker rm -v $(docker ps -a -q); docker rmi -f $(docker images -q)'
alias dcu='docker-compose down; docker-compose up'
alias dcub='docker-compose down; docker-compose up --build'
alias reload="exec $SHELL -l"
alias pip="pip3"

#Functions
dex(){
  docker exec -ti "$1" bash
}
 
dbash() {
  docker exec -ti $(docker ps -qf "name=$1") bash;
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
