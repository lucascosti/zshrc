# Lucas' custom powerlevel10k theme.
# Based on romkatv/powerlevel10k/config/p10k-lean.zsh, checksum 34415.
# Type `p10k configure` to generate another config.
#
#
# Tip: Looking for a nice color? Here's a one-liner to print colormap.
#
#   for i in {0..255}; do print -Pn "%${i}F${(l:3::0:)i}%f " ${${(M)$((i%8)):#7}:+$'\n'}; done

if [[ -o 'aliases' ]]; then
  # Temporarily disable aliases.
  'builtin' 'unsetopt' 'aliases'
  local p10k_lean_restore_aliases=1
else
  local p10k_lean_restore_aliases=0
fi

() {
  emulate -L zsh
  setopt no_unset
  local LC_ALL=C.UTF-8

  # Unset all configuration options. This allows you to apply configiguration changes without
  # restarting zsh. Edit ~/.p10k.zsh and type `source ~/.p10k.zsh`.
  unset -m 'POWERLEVEL9K_*'
  
  # Disable right prompt:
  typeset -g POWERLEVEL9K_DISABLE_RPROMPT=true
  
  # The list of segments shown on the left. Fill it with the most important segments.
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
      # =========================[ Line #1 ]=========================
      status                 # return status of last command
      time                    # current time
      dir                     # current directory
      vcs                     # git status
      # =========================[ Line #2 ]=========================
      newline
      prompt_char             # prompt symbol
  )

  # # The list of segments shown on the right. Fill it with less important segments.
  # # Right prompt on the last prompt line (where you are typing your commands) gets
  # # automatically hidden when the input line reaches it. Right prompt above the
  # # last prompt line gets hidden if it would overlap with left prompt.
  # typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  #     # =========================[ Line #1 ]=========================
  #     status                  # exit code of the last command
  #     command_execution_time  # duration of the last command
  #     background_jobs         # presence of background jobs
  #     virtualenv              # python virtual environment (https://docs.python.org/3/library/venv.html)
  #     anaconda                # conda environment (https://conda.io/)
  #     pyenv                   # python environment (https://github.com/pyenv/pyenv)
  #     nodenv                  # node.js version from nodenv (https://github.com/nodenv/nodenv)
  #     nvm                     # node.js version from nvm (https://github.com/nvm-sh/nvm)
  #     nodeenv                 # node.js environment (https://github.com/ekalinin/nodeenv)
  #     # node_version          # node.js version
  #     # go_version            # go version (https://golang.org)
  #     # rust_version          # rustc version (https://www.rust-lang.org)
  #     rbenv                   # ruby version from rbenv (https://github.com/rbenv/rbenv)
  #     rvm                     # ruby version from rvm (https://rvm.io)
  #     kubecontext             # current kubernetes context (https://kubernetes.io/)
  #     context                 # user@host
  #     nordvpn                 # nordvpn connection status, linux only (https://nordvpn.com/)
  #     # =========================[ Line #2 ]=========================
  #     newline
  #     # public_ip             # public IP address
  #     # battery               # internal battery
  #     # time                  # current time
  #     # example               # example user-defined segment (see prompt_example function below)
  # )

  # Basic style options that define the overall look of your prompt. You probably don't want to
  # change them.

  # No default background
  typeset -g POWERLEVEL9K_BACKGROUND=
  # typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=  # no surrounding whitespace
  # Separator between same-color segments on the left.
  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='%244F\uE0B1'
  # Separator between different-color segments on the left.
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'
  # The right end of left prompt.
  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
  # The left end of left prompt.
  typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
  # Left prompt terminator for lines without any segments.
  typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
  

  # To disable default icons for all segments, set POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION=''.
  #
  # To enable default icons for all segments, don't define POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION
  # or set it to '${P9K_VISUAL_IDENTIFIER}'.
  #
  # To remove spaces from all default icons, set POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION
  # to '${P9K_VISUAL_IDENTIFIER// }'. You'll know that you you need this option if you see extra
  # spaces after icons.
  #
  # To enable default icons for one segment (e.g., dir), set
  # POWERLEVEL9K_DIR_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER}'.
  #
  # To assign a specific icon to one segment (e.g., dir), set
  # POWERLEVEL9K_DIR_VISUAL_IDENTIFIER_EXPANSION='⭐'.
  #
  # To assign a specific icon to a segment in a given state (e.g., dir in state NOT_WRITABLE),
  # set POWERLEVEL9K_DIR_NOT_WRITABLE_VISUAL_IDENTIFIER_EXPANSION='⭐'.
  #
  # Note: You can use $'\u2B50' instead of '⭐'. It's especially convenient when specifying
  # icons that your text editor cannot render. Don't forget to put $ and use single quotes when
  # defining icons via Unicode codepoints.
  #
  # Note: Many default icons cannot be displayed with system fonts. You'll need to install a
  # capable font to use them. See POWERLEVEL9K_MODE below.
  #### Lucas: disable icons for segments (I will enable the ones i like individually)
  #typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER}'
  typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION=

  # This option makes a difference only when default icons are enabled for all or some prompt
  # segments (see POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION above). LOCK_ICON can be printed as
  # $'\uE0A2', $'\uE138' or $'\uF023' depending on POWERLEVEL9K_MODE. The correct value of this
  # parameter depends on the provider of the font your terminal is using.
  #
  #   Font Provider                    | POWERLEVEL9K_MODE
  #   ---------------------------------+-------------------
  #   Powerline                        | powerline
  #   Font Awesome                     | awesome-fontconfig
  #   Adobe Source Code Pro            | awesome-fontconfig
  #   Source Code Pro                  | awesome-fontconfig
  #   Awesome-Terminal Fonts (regular) | awesome-fontconfig
  #   Awesome-Terminal Fonts (patched) | awesome-patched
  #   Nerd Fonts                       | nerdfont-complete
  #   Other                            | compatible
  #
  # If this looks overwhelming, either stick with a preinstalled system font and set
  # POWERLEVEL9K_MODE=compatible, or install a font from https://github.com/ryanoasis/nerd-fonts
  # and set POWERLEVEL9K_MODE=nerdfont-complete. "Meslo LG S Regular Nerd Font Complete Mono" from
  # https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Meslo/S/Regular/complete is
  # very good.
  typeset -g POWERLEVEL9K_MODE=nerdfont-complete

  # When set to true, icons appear before content on both sides of the prompt. When set
  # to false, icons go after content. If empty or not set, icons go before content in the left
  # prompt and after content in the right prompt.
  #
  # You can also override it for a specific segment:
  #
  #   POWERLEVEL9K_STATUS_ICON_BEFORE_CONTENT=false
  #
  # Or for a specific segment in specific state:
  #
  #   POWERLEVEL9K_DIR_NOT_WRITABLE_ICON_BEFORE_CONTENT=false
  typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=true

  # Add an empty line before each prompt.
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

  # Ruler, a.k.a. the horizontal line before each prompt. If you set it to true, you'll
  # probably want to set POWERLEVEL9K_PROMPT_ADD_NEWLINE=false above and
  # POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' ' below.
  typeset -g POWERLEVEL9K_SHOW_RULER=true
  typeset -g POWERLEVEL9K_RULER_CHAR='─'        # reasonable alternative: '·'
  typeset -g POWERLEVEL9K_RULER_FOREGROUND=240

  # Filler between left and right prompt on the first prompt line. You can set it to '·' or '─'
  # to make it easier to see the alignment between left and right prompt and to separate prompt
  # from command output. It serves the same purpose as ruler (see above) without increasing
  # the number of prompt lines. You'll probably want to set POWERLEVEL9K_SHOW_RULER=false
  # if using this. You might also like POWERLEVEL9K_PROMPT_ADD_NEWLINE=false for more compact
  # prompt.
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '
  if [[ $POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR != ' ' ]]; then
    # The color of the filler.
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=240
    # Add a space between the end of left prompt and the filler.
    typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=' '
    # Add a space between the filler and the start of right prompt.
    typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL=' '
    # Start filler from the edge of the screen if there are no left segments on the first line.
    typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
    # End filler on the edge of the screen if there are no right segments on the first line.
    typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'
  fi

  #################################[ os_icon: os identifier ]##################################
  # OS identifier color.
  typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=
  # Make the icon bold.
  typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='%B${P9K_CONTENT}'

  ####################################[ time: current time ]####################################
  # Current time color.
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=black
  typeset -g POWERLEVEL9K_TIME_BACKGROUND=007
  # Format for the current time: 09:51. See `man 3 strftime`.
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'
  # If set to true, time will update when you hit enter. This way prompts for the past
  # commands will contain the start times of their commands as opposed to the default
  # behavior where they contain the end times of their preceding commands.
  typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=true
  # Custom icon.
  # typeset -g POWERLEVEL9K_TIME_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # Custom prefix.
  # typeset -g POWERLEVEL9K_TIME_PREFIX='%fat '

  ################################[ prompt_char: prompt symbol ]################################
  # # Green prompt symbol if the last command succeeded.
  # typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS}_FOREGROUND=76
  # # Red prompt symbol if the last command failed.
  # typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS}_FOREGROUND=196
  # # Default prompt symbol.
  # Lucas green prompt for both ok and error state
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_{VIINS,VICMD,VIVIS}_FOREGROUND=76
  # Lucas no whitespace around the prompt character
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_{LEFT,RIGHT}_WHITESPACE=''
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
  # Prompt symbol in command vi mode.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
  # Prompt symbol in visual vi mode.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='Ⅴ'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=''

  ##################################[ dir: current directory ]##################################
  # Default current directory color.
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=252 # almost white
  typeset -g POWERLEVEL9K_DIR_BACKGROUND=004
  # Lucas enable icons for the directory segment
  typeset -g POWERLEVEL9K_DIR_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER}'
  # If directory is too long, shorten some of its segments to the shortest possible unique
  # prefix. The shortened directory can be tab-completed to the original.
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_middle
  # Replace removed segment suffixes with this symbol.
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=…
  # Color of the shortened directory segments.
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=
  # Color of the anchor directory segments. Anchor segments are never shortened. The first
  # segment is always an anchor.
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=39
  # Display anchor directory segments in bold.
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=false
  # Don't shorten directories that contain files matching this pattern. They are anchors.
  typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER='(.shorten_folder_marker|.bzr|CVS|.git|.hg|.svn|.terraform|.citc)'
  # Don't shorten this many last directory segments. They are anchors.
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
  # Shorten directory if it's longer than this even if there is space for it. The value can
  # be either absolute (e.g., '80') or a percentage of terminal width (e.g, '50%'). If empty,
  # directory will be shortened only when prompt doesn't fit.
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=50
  # If set to true, embed a hyperlink into the directory. Useful for quickly
  # opening a directory in the file manager simply by clicking the link.
  # Can also be handy when the directory is shortened, as it allows you to see
  # the full directory that was used in previous commands.
  typeset -g POWERLEVEL9K_DIR_HYPERLINK=false

  # Enable special styling for non-writable directories.
  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=true
  # Show this icon when the current directory is not writable. POWERLEVEL9K_DIR_SHOW_WRITABLE
  # above must be set to true for this parameter to have effect.
  # POWERLEVEL9K_DIR_NOT_WRITABLE_VISUAL_IDENTIFIER_EXPANSION='⭐'

  # Custom prefix.
  # typeset -g POWERLEVEL9K_DIR_PREFIX='%fin '

  # POWERLEVEL9K_DIR_CLASSES allows you to specify custom icons for different directories.
  # It must be an array with 3 * N elements. Each triplet consists of:
  #
  #   1. A pattern against which the current directory is matched. Matching is done with
  #      extended_glob option enabled.
  #   2. Directory class for the purpose of styling.
  #   3. Icon.
  #
  # Triplets are tried in order. The first triplet whose pattern matches $PWD wins. If there
  # are no matches, the directory will have no icon.
  #
  # Example:
  #
  #   typeset -g POWERLEVEL9K_DIR_CLASSES=(
  #       '~/work(/*)#'  WORK     '(╯°□°）╯︵ ┻━┻'
  #       '~(/*)#'       HOME     '⌂'
  #       '*'            DEFAULT  '')
  #
  # With these settings, the current directory in the prompt may look like this:
  #
  #   (╯°□°）╯︵ ┻━┻ ~/work/projects/important/urgent
  #
  # Or like this:
  #
  #   ⌂ ~/best/powerlevel10k
  #
  # You can also set different colors for directories of different classes. Remember to override
  # FOREGROUND, SHORTENED_FOREGROUND and ANCHOR_FOREGROUND for every directory class that you wish
  # to have its own color.
  #
  #   typeset -g POWERLEVEL9K_DIR_WORK_FOREGROUND=12
  #   typeset -g POWERLEVEL9K_DIR_WORK_SHORTENED_FOREGROUND=4
  #   typeset -g POWERLEVEL9K_DIR_WORK_ANCHOR_FOREGROUND=39
  #
  # typeset -g POWERLEVEL9K_DIR_CLASSES=()

  #####################################[ vcs: git status ]######################################
  # Branch icon. Set this parameter to '\uF126 ' for the popular Powerline branch icon.
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON='\uF126 '
  
  # Lucas set colors:
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=254 # almost white
  typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND=28 #green
  typeset -g POWERLEVEL9K_VCS_{MODIFIED,UNTRACKED}_FOREGROUND=000 # black
  typeset -g POWERLEVEL9K_VCS_{MODIFIED,UNTRACKED}_BACKGROUND=003 # yellow/orange

  # Icons:
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON=''
  typeset -g POWERLEVEL9K_VCS_MODIFIED_ICON=''
  typeset -g POWERLEVEL9K_VCS_STASH_ICON=''
  typeset -g POWERLEVEL9K_VCS_CONFLICT_ICON=''
  typeset -g POWERLEVEL9K_VCS_STAGED_ICON='ﱣ'

  # Git status: feature:master#tag ⇣42⇡42 *42 merge ~42 +42 !42 ?42.
  #
  # You can edit the lines below to customize how Git status looks.
  #
  # VCS_STATUS parameters are set by gitstatus plugin. See reference:
  # https://github.com/romkatv/gitstatus/blob/master/gitstatus.plugin.zsh.
  local vcs=''
  # 'feature' or '@72f5c8a' if not on a branch.
  vcs+='${${VCS_STATUS_LOCAL_BRANCH:+'${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}'${VCS_STATUS_LOCAL_BRANCH//\%/%%} }'
  vcs+=':-%f@${VCS_STATUS_COMMIT[1,8]}}'
  # ':master' if the tracking branch name differs from local branch.
  vcs+='${${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH}:+%f:${VCS_STATUS_REMOTE_BRANCH//\%/%%} }'
  # '#tag' if on a tag.
  vcs+='${VCS_STATUS_TAG:+%f#${VCS_STATUS_TAG//\%/%%}}'
  # ⇣42 if behind the remote.
  vcs+='${${VCS_STATUS_COMMITS_BEHIND:#0}:+⇣${VCS_STATUS_COMMITS_BEHIND}}'
  # ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
  # If you want '⇣42 ⇡42' instead, replace '${${(M)VCS_STATUS_COMMITS_BEHIND:#0}:+ }' with ' '.
  vcs+='${${VCS_STATUS_COMMITS_AHEAD:#0}:+${${(M)VCS_STATUS_COMMITS_BEHIND:#0}:+}⇡${VCS_STATUS_COMMITS_AHEAD} }'
  #  if have stashes.
  vcs+='${${VCS_STATUS_STASHES:#0}:+%025F${POWERLEVEL9K_VCS_STASH_ICON}${VCS_STATUS_STASHES}}'
  # 'merge' if the repo is in an unusual state.
  vcs+='${VCS_STATUS_ACTION:+%001F${VCS_STATUS_ACTION//\%/%%} }'
  #  if have merge conflicts.
  vcs+='${${VCS_STATUS_NUM_CONFLICTED:#0}:+%001F${POWERLEVEL9K_VCS_CONFLICT_ICON}${VCS_STATUS_NUM_CONFLICTED}}'
  #  if have staged changes.
  vcs+='${${VCS_STATUS_NUM_STAGED:#0}:+%021F${POWERLEVEL9K_VCS_STAGED_ICON}${VCS_STATUS_NUM_STAGED}}'
  #  if have unstaged changes.
  vcs+='${${VCS_STATUS_NUM_UNSTAGED:#0}:+%124F${POWERLEVEL9K_VCS_MODIFIED_ICON}${VCS_STATUS_NUM_UNSTAGED}}'
  #  if have untracked files.
  vcs+='${${VCS_STATUS_NUM_UNTRACKED:#0}:+%008F'${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}'${VCS_STATUS_NUM_UNTRACKED}}'
  # If P9K_CONTENT is not empty, leave it unchanged. It's either "loading" or from vcs_info.
  vcs="\${P9K_CONTENT:-$vcs}"

  # Disable the default Git status formatting.
  typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
  # Install our own Git status formatter.
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_CONTENT_EXPANSION=$vcs
  # When Git status is being refreshed asynchronously, display the last known repo status in grey.
  typeset -g POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION=${${vcs//\%f}//\%<->F}
  typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=244
  # Enable counters for staged, unstaged, etc.
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1

  # Icon color.
  typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_COLOR=76
  # Custom icon.
  # typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # Custom prefix.
  # typeset -g POWERLEVEL9K_VCS_PREFIX='%fon '

  # Show status of repositories of these types. You can add svn and/or hg if you are
  # using them. If you do, your prompt may become slow even when your current directory
  # isn't in an svn or hg reposotiry.
  typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)


  ##########################[ status: exit code of the last command ]###########################
  # Status on success. No content, just an icon.
  # Enable OK_PIPE, ERROR_PIPE and ERROR_SIGNAL status states to allow us to enable, disable and
  # style them independently from the regular OK and ERROR state.
  typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=false
  # Lucas: don't show the error code
  typeset -g POWERLEVEL9K_STATUS_VERBOSE=false

  # Status on success. No content, just an icon. No need to show it if prompt_char is enabled as
  # it will signify success by turning green.
  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=70
  typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'

  # Status when it's just an error code (e.g., '1'). No need to show it if prompt_char is enabled as
  # it will signify error by turning red.
  typeset -g POWERLEVEL9K_STATUS_ERROR=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=255
  typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=001
  typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'


  ###################[ command_execution_time: duration of the last command ]###################
  # Show duration of the last command if takes longer than this many seconds.
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
  # Show this many fractional digits. Zero means round to seconds.
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
  # Execution time color.
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=101
  # Duration format: 1d 2h 3m 4s.
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
  # Custom icon.
  # typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # Custom prefix.
  # typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PREFIX='%ftook '

  #######################[ background_jobs: presence of background jobs ]#######################
  # Don't show the number of background jobs.
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
  # Background jobs color.
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=70
  # Icon to show when there are background jobs.
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER}'

  ####################################[ context: user@host ]####################################
  # Default context color.
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=180
  # Default context format: %n is username, %m is hostname.
  typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

  # Context color when running with privileges.
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=227
  # Context format when running with privileges: %n is username, %m is hostname.
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%n@%m'

  # Don't show context unless running with privileges on in SSH.
  typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=
  typeset -g POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true

  # Custom icon.
  # typeset -g POWERLEVEL9K_CONTEXT_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # Custom prefix.
  # typeset -g POWERLEVEL9K_CONTEXT_PREFIX='%fwith '


  # Example of a user-defined prompt segment. Function prompt_example will be called on every
  # prompt if `example` prompt segment is added to POWERLEVEL9K_LEFT_PROMPT_ELEMENTS or
  # POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS. It displays an icon and orange text greeting the user.
  #
  # Type `p10k help segment` for documentation and a more sophisticated example.
  function prompt_example() {
    p10k segment -f 208 -i '⭐' -t 'hello, %n'
  }

  # User-defined prompt segments can be customized the same way as built-in segments.
  typeset -g POWERLEVEL9K_EXAMPLE_FOREGROUND=208
  typeset -g POWERLEVEL9K_EXAMPLE_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER}'
}

(( ! p10k_lean_restore_aliases )) || setopt aliases
'builtin' 'unset' 'p10k_lean_restore_aliases'
