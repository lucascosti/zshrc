# Lucas' .zshrc file. 

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/Users/lucascosti/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
## Lucas: not needed because powerlevel10k (see below) handles the theming.
#ZSH_THEME="lucas-theme"

## Source powerlevel10k & my theme
source ~/zshscripts/powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/zshscripts/themes/p10k-lucas.zsh ]] && source ~/zshscripts/themes/p10k-lucas.zsh

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git-auto-fetch)

source $ZSH/oh-my-zsh.sh

# User configuration

######## Lucas' extra stuff below here ########

# allow commands to be executed in the prompt:
setopt PROMPT_SUBST
# allow comments in interactive shells (like Bash does)
setopt INTERACTIVE_COMMENTS
# set git autofetching to be once every 20 minutes
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/git-auto-fetch
GIT_AUTO_FETCH_INTERVAL=1200 #in seconds
# Bind Home/End keys for beginning/end of line.
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# This script enables syntax highlighting on the prompt (it must be sourced after all the other plugins/theme stuff above).
# https://github.com/zsh-users/zsh-syntax-highlighting
source ~/zshscripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
## Set the highlighters we want:
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
## Some custom highlighter colors:
### Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES
### Have paths colored blue instead of underlined
ZSH_HIGHLIGHT_STYLES[path]='fg=33'

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Regular aliases
## zsh sudo last command:
alias ffs='sudo $(fc -ln -1)'
alias bi='brew install'
alias br='brew uninstall'
alias bu='brew update'

# Git
## Git aliases
alias g='git'
alias gfu='git fetch upstream'
alias gfo='git fetch origin'
alias gr='git rebase'
alias gpull='git pull'
alias gs='git status'
alias gc='git checkout'
alias gl="git log --pretty=format:'%Cblue%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset' --abbrev-commit --date=relative"
alias gbranches='git branch -a'
alias gnb='git checkout -b'
alias gnewbranch='git checkout -b'
alias grmbranch='git branch -d'
alias gd='git diff'
alias gss='git stash save'
alias gsp='git stash pop'
alias gsd='git stash drop'
alias gsl='git stash list'
alias ga='git add'
alias gaa='git add -A'
alias gcom='git commit'
alias gcomm='git commit -m'
alias gcomam='git add -A && git commit -m'
alias gcoma='git add -A && git commit'
alias gcommend='git add -A && git commit --amend --no-edit'
alias gm='git merge'
alias gcp='git cherry-pick'
alias gpoh='git push origin HEAD'
alias grom='git rebase origin/master'
alias cdr='cd ~/repos/'
### Function to take git interactive rebase argument. e.g.: gir 2
gri() { git rebase -i HEAD~$1; }
gir() { git rebase -i HEAD~$1; }
### From https://docs.gitlab.com/ee/user/project/merge_requests/#checkout-merge-requests-locally : e.g. gcmr upstream 12345
gcmr() { git fetch $1 merge-requests/$2/head:mr-$1-$2 && git checkout mr-$1-$2; }
### This function prunes references to deleted remote branches and
### deletes local branches that have been merged and/or deleted from the remotes.
### It is intended to be run when on a master branch, and warns when it isn't.
gclean() {
  local BRANCH=`git rev-parse --abbrev-ref HEAD`
  local response=""
  # Warning if not on a master* branch
  if [[ $BRANCH != master* ]]
  then
    echo -e "\e[91m!! WARNING: It looks like you are not on a master branch !!\e[39m"
    vared -p "Are you sure you want to continue? [y/N] " -c response
    if ! [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
    then
      echo "Aborted. Nothing was changed."
      return 1
    fi
  fi
  echo "Simulating a clean on $BRANCH ..." \
  && echo "===== 1/2: simulating pruning origin =====" \
  && git remote prune origin --dry-run \
  && echo "===== 2/2: simulating cleaning local branches merged to $BRANCH =====" \
  && git branch --merged $BRANCH | grep -v "^\**\s*master"  \
  && echo "=====" \
  && echo "Simulation complete."
  vared -p "Do you want to proceed with the above clean? [y/N] " -c response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    echo "Running a clean on $BRANCH ..."
    echo "===== 1/2: pruning origin =====" \
    && git remote prune origin \
    && echo "===== 2/2: cleaning local branches merged to $BRANCH =====" \
    && git branch --merged $BRANCH | grep -v "^\**\s*master" | xargs git branch -d \
    && echo "=====" \
    && echo "Clean finished."
  else
    echo "Aborted. Nothing was changed."
  fi
}
### Sync function for my current workflow, which only has a remote origin.
### Fetches origin and rebases current branch from origin.
gsync (){
  local BRANCH=`git rev-parse --abbrev-ref HEAD`
  echo "Syncing the current branch: $BRANCH"
  echo "===== 1/2: fetching origin =====" \
  && git fetch origin \
  && echo "===== 2/2: rebasing $BRANCH =====" \
  && git rebase origin/$BRANCH \
  && echo "=====" \
  && echo "Syncing finished."
}
### Sync function for my previous workflow, which had upstream+originfork+local.
### Syncs local and origin branch from a remote: runs a fetch from specified remote + rebase local + push to origin.
OLDgsync (){
  local BRANCH=`git rev-parse --abbrev-ref HEAD`
  echo "Syncing the current branch: $BRANCH"
  echo "===== 1/3: fetching $1 =====" \
  && git fetch $1 \
  && echo "===== 2/3: rebasing $BRANCH =====" \
  && git rebase $1/$BRANCH \
  && echo "===== 3/3: pushing to origin/$BRANCH =====" \
  && git push origin $BRANCH \
  && echo "=====" \
  && echo "Syncing finished."
}
### Function to undo all changes (including stages) back to the last commit, with a confirmation.
gundoall () {
  local response=""
  echo "WARNING: This will delete all untracked files, and undo all changes since the last commit."
  vared -p "Are you sure? [y/N] " -c response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    echo "===== 1/2: git reset --hard HEAD =====" \
    && git reset --hard HEAD \
    && echo "===== 2/2: git clean -fd \$(git rev-parse --show-toplevel) =====" \
    && git clean -fd $(git rev-parse --show-toplevel)
  else
    echo "Aborted. Nothing was changed."
  fi
}

#########
# Required for GitHub docs builds bootstrap
eval "$(rbenv init -)"
eval "$(nodenv init -)"

# Build GitHub dev docs
alias bcurrent='script/server'
# Runs a backport then a build. 
bbackport() {
  # if there a no arguments, build all versions. For one or more specified versions as arguments, build those specified.
  if [ -z "$1" ]
    then
      versions=( 2.18 2.17 2.16 2.15 )
    else
      versions=( "$@" )
  fi
  for v in "${versions[@]}"
    do script/enterprise-backport $v
  done
  bcurrent
}
