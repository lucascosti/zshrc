# Create a symlink in ~/.oh-my-zsh/themes that points to this file.
# Colors are defined in ~/zshscripts/lucas-colors.zsh

# Set colors for each section
local bg_retfail="${bg_red}"
local fg_retfail="${white}"
local fg_retfail_sep="${red}"
local bg_time="${bg_lgray}"
local fg_time="${black}"
local fg_time_sep="${lightgray}"
local bg_pwd="${bg_blue}"
local fg_pwd="${white}"
local fg_pwd_sep="${blue}"
local bg_git="${bg_magenta}"
local fg_git="${white}"
local bg_gitdirty="${bg_yellow}"
local bg_gitclean="${bg_green}"
local bg_git_sep="${bg_normal}"
local fg_gitdirty_sep="${yellow}"
local fg_gitclean_sep="${green}"

# git-prompt plugin settings
## Git part
ZSH_THEME_GIT_PROMPT_PREFIX="${bg_git}${fg_git} ${PWRLN_BRA}"
ZSH_THEME_GIT_PROMPT_BRANCH="${bg_git}${fg_git}"
ZSH_THEME_GIT_PROMPT_SEPARATOR="${bg_git} "
ZSH_THEME_GIT_PROMPT_BEHIND="${bg_git}↓"
ZSH_THEME_GIT_PROMPT_AHEAD="${bg_git}↑"
## Clean repo
ZSH_THEME_GIT_PROMPT_CLEAN="${bg_gitclean}${fg_git} ✔ ${fg_gitclean_sep}${bg_git_sep}${PWRLN_SEP}%{$reset_color%}"
## Dirty Repo
ZSH_THEME_GIT_PROMPT_CHANGED="${bg_gitdirty}${maroon}✚"      # the number of changed files
ZSH_THEME_GIT_PROMPT_STAGED="${bg_gitdirty}${brightblue}●"   # the number of staged files
ZSH_THEME_GIT_PROMPT_CONFLICTS="${bg_gitdirty}${red}✖"       # the number of files in conflict
ZSH_THEME_GIT_PROMPT_UNTRACKED="${bg_gitdirty}${darkgray}…"  # untracked files
# End (is mainly defined in the below function)
ZSH_THEME_GIT_PROMPT_SUFFIX=""

function create_prompt () {
  # Fetch the git section from git-prompt
  local git_string=$(git_super_status)
  
  # The return status section: blank for success, red ✘ for failure
  local ret_status="%(?::${bg_retfail}${fg_retfail} ✘ ${fg_retfail_sep}${bg_time}${PWRLN_SEP}%{$reset_color%})"
  # Time section at prompt start
  local time_sect="${bg_time}${fg_time} %T ${fg_time_sep}${bg_pwd}${PWRLN_SEP}"
  # pwd section
  local dir_sect="${bg_pwd}${fg_pwd} %2~ %{$reset_color%}"
  # if there is a git section, have the pwd section merge into it.
  if [[ -z $git_string ]] ; then
    dir_sect="${dir_sect}${fg_pwd_sep}${PWRLN_SEP}"
  else
    dir_sect="${dir_sect}${fg_pwd_sep}${bg_git}${PWRLN_SEP}"
  fi
  # check the ahead/behind characters, and insert a space before the section
  ## if there is both, insert the space before the ↓
  if [[ $git_string =~ '↓.*↑' ]]; then
    git_string=${git_string//↓/ ↓}
  # else if it is just behind:
  elif [[ $git_string =~ '↓' ]]; then
    git_string=${git_string//↓/ ↓}
  # else if it is just ahead:
  elif [[ $git_string =~ '↑' ]]; then
    git_string=${git_string//↑/ ↑}
  fi
  # insert a space after the first instance of a dirty background
  git_string=${git_string/"${bg_gitdirty}"/"${bg_gitdirty} "}

  #check the last character and set appropiate ending string
  ## if it has these symbols (from the above variables), the repo must be dirty, so add a dirty ending to the string.
  if [[ $git_string =~ [✚✖…●] ]]; then
    git_string="${git_string}${bg_gitdirty} ${fg_gitdirty_sep}${bg_git_sep}${PWRLN_SEP}%{$reset_color%}"
  fi
  # end section showing the $ prompt on the next line
  local end_sect="
${lightgreen}❯ %{$reset_color%}"
  
  # Return the completed prompt
  echo "${ret_status}${time_sect}${dir_sect}${git_string}${end_sect}"
}

# The completed prompt (with a newline at the beginning so there is a gap before the result of the previous command.
PROMPT='
$(create_prompt)'
# No right prompt
RPROMPT=""


