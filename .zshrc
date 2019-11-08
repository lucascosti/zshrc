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
source ~/zshscripts/themes/p10k-lucas.zsh

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

# Load completions (e.g. for git completion)
autoload -Uz compinit && compinit

# User configuration

######## Lucas' extra stuff below here ########

# allow commands to be executed in the prompt:
setopt PROMPT_SUBST
# allow comments in interactive shells (like Bash does)
setopt INTERACTIVE_COMMENTS
# Live life on the edge: like bash, don't prompt for confirmation when doing rm -rf *
setopt RM_STAR_SILENT
# set git autofetching to be once every 20 minutes
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/git-auto-fetch
GIT_AUTO_FETCH_INTERVAL=1200 #in seconds
# Bind Home/End keys for beginning/end of line.
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# Set custom LSCOLORS for MacOS (see https://geoff.greer.fm/lscolors/)
# (on other Linux systems, it is the differently-formated LS_COLORS)
## OLD OSX default: Gxfxcxdxbxegedabagacad
## NEW:             Exfxcxdxcxegedabagacad
LSCOLORS='Exfxcxdxcxegedabagacad'
## LS_COLORS equivalent: 
LS_COLORS='di=1;34:ln=35:so=32:pi=33:ex=32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
# Set zsh's completion colors to use the above colors too (needs to use LS_COLORS):
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# This script enables syntax highlighting on the prompt (it must be sourced after all the other plugins/theme stuff above).
# https://github.com/zsh-users/zsh-syntax-highlighting
source ~/zshscripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
## Set the highlighters we want:
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
## Some custom highlighter colors:
### Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES
### Have paths colored blue instead of underlined (and a bit more vibrant blue than the ls one above):
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
alias gremotes='git remote -v'
alias {cdr,cdg,gcd}='cd ~/repos/'
### Function to take git interactive rebase argument. e.g.: gir 2
gri() { git rebase -i HEAD~$1; }
gir() { git rebase -i HEAD~$1; }
### Checkout remote MRs/PRs on my local machine
#### For GitLab: e.g. gcmr upstream 12345
#### From https://docs.gitlab.com/ee/user/project/merge_requests/#checkout-merge-requests-locally
gcmr() { git fetch $1 merge-requests/$2/head:mr-$1-$2 && git checkout mr-$1-$2; }
# This autocompletes the above function with the list of remotes
compdef -e 'words[1]=(git remote show); service=git; (( CURRENT+=2 )); _git' gcmr
#### For GitHub: e.g gcpr origin 12345
gcpr() { git fetch $1 pull/$2/head:pr-$1-$2 && git checkout pr-$1-$2; }
# This autocompletes the above function with the list of remotes
compdef -e 'words[1]=(git remote show); service=git; (( CURRENT+=2 )); _git' gcpr

### Some icons for the functions below (prefixed so they won't annoy me in autocompletion on the shell.) Requires a Nerd Fonts patched font.
local lcicon_infoi="$FG[033]$reset_color" # blue i
local lcicon_trash="$FG[166]$reset_color" # orange trash
local lcicon_scissors="$FG[003]$reset_color"
local lcicon_tick="$FG[046]$reset_color" # green tick
local lcicon_question="$FG[192]ﲉ$reset_color" # yellow question
local lcicon_fail="$FG[009]$reset_color" # red x
local lcicon_runarrow="$FG[077]$reset_color"
local lcicon_sync="$FG[077]$reset_color"
local lcicon_warning="$FG[226]$reset_color"
local lcicon_undo="$FG[003]\ufa4c$reset_color"
### This is an internal function that prints a border around command exections.
#### If called with no arguments, it prints a simple border.
#### Otherwise, it must be called with 3 arguments: the current step, the total number of steps, and the step title message.
#### e.g: lcfunc_step_border 1 3 "First step in a 3 step process!"
lcfunc_step_border() {
  local lcicon_border="$FG[013]====$reset_color"
  # if no arguments, return a border.
  if [ $# -eq 0 ]
  then
    print -P "$lcicon_border"
  else
    print -P "$lcicon_border $FG[013]$1/$2:$reset_color $3 $lcicon_border"
  fi
}
### This function prunes references to deleted remote branches and
### deletes local branches that have been merged and/or deleted from the remotes.
### It is intended to be run when on a master branch, and warns when it isn't.
gclean() {
  local BRANCH=`git rev-parse --abbrev-ref HEAD`
  local response=""
  # Warning if not on a master* branch
  if [[ $BRANCH != master* ]]
  then
    print -P "$lcicon_warning$lcicon_warning $FG[009]WARNING: It looks like you are not on a master branch!$reset_color $lcicon_warning$lcicon_warning"
    vared -p "$lcicon_question Are you sure you want to continue? [y/N] " -c response
    if ! [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
    then
      print -P "$lcicon_fail Aborted! Nothing was changed."
      return 1
    fi
  fi
  print -P "$lcicon_infoi Simulating a clean on $BRANCH ..." \
  && lcfunc_step_border 1 2 "$lcicon_scissors simulating pruning origin $lcicon_scissors" \
  && git remote prune origin --dry-run \
  && lcfunc_step_border 2 2 "$lcicon_trash simulating cleaning local branches merged to $BRANCH $lcicon_trash" \
  && git branch --merged $BRANCH | grep -v "^\**\s*master"
  lcfunc_step_border
  print -P "$lcicon_infoi Simulation complete."
  vared -p "$lcicon_question Do you want to proceed with the above clean? [y/N] " -c response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    print -P "$lcicon_runarrow Running a clean on $BRANCH ..." \
    && lcfunc_step_border 1 2 "$lcicon_scissors pruning origin $lcicon_scissors" \
    && git remote prune origin \
    && lcfunc_step_border 2 2 "$lcicon_trash cleaning local branches merged to $BRANCH $lcicon_trash" \
    && git branch --merged $BRANCH | grep -v "^\**\s*master" | xargs git branch -d \
    && lcfunc_step_border \
    && print -P "$lcicon_tick Clean finished!"
  else
    print -P "$lcicon_fail Aborted! Nothing was changed."
    return 1
  fi
}
### Sync function for my current workflow, which only has a remote origin.
### Fetches origin and rebases current branch from origin.
gsync (){
  local BRANCH=`git rev-parse --abbrev-ref HEAD`
  print -P "$lcicon_sync Syncing the current branch: $BRANCH"
  lcfunc_step_border 1 2 "fetching origin" \
  && git fetch origin \
  && lcfunc_step_border 2 2 "rebasing $BRANCH" \
  && git rebase origin/$BRANCH \
  && lcfunc_step_border \
  && print -P "$lcicon_tick Syncing finished!"
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
  print -P "$lcicon_warning $FG[009]WARNING:$reset_color This will delete all untracked files, and undo all changes since the previous commit."
  vared -p "$lcicon_question Are you sure? [y/N] " -c response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    print -P "$lcicon_runarrow Undoing to the previous commit ..."
    lcfunc_step_border 1 2 "$lcicon_undo git reset --hard HEAD $lcicon_undo" \
    && git reset --hard HEAD \
    && lcfunc_step_border 2 2 "$lcicon_trash git clean -fd \$(git rev-parse --show-toplevel) $lcicon_trash" \
    && git clean -fd $(git rev-parse --show-toplevel) \
    && lcfunc_step_border \
    && print -P "$lcicon_tick Done!"
  else
    print -P "$lcicon_fail Aborted! Nothing was changed."
    return 1
  fi
}

#########
# Required for GitHub docs builds bootstrap
eval "$(rbenv init -)"
eval "$(nodenv init -)"

# Build GitHub docs
alias bcurrent='bdocs'
bdocs() {
  # If server-lite exists, run that
  if [ -f "script/server-lite" ]; then
    echo "Running script/server-lite..."
    script/server-lite
  # Otherwise, run the normal server
  elif [ -f "script/server" ]; then
    echo "Running script/server..."
    script/server
  else
    print -P "$lcicon_fail Can't find a server script! Are you sure you are in a docs repo?"
    return 1
  fi
}
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
