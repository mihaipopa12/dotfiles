export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"
export PATH=bin:node_modules/.bin:.bundle/binstubs:$PATH
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
alias g=git
alias bi="bundle install"
alias be="bundle exec"
alias ss="spring stop"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
alias rc="git diff origin/master --name-only --diff-filter=ACMRTUXB | grep '\.rb$' | tr '\n' ' ' | xargs bundle exec rubocop"
export RUBY_GC_MALLOC_LIMIT=107374182400 # 1GiB
export GLOBALPGPORT=32793
alias da="direnv allow"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"

