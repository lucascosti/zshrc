# This contains variable settings for colours that I use in zsh themes and plugins

# The formatting %{...%} is needed around the color codes to declare them as 'zero-width' characters, so when zsh does it's fancy autocompletion stuff, it replaces the characters in the right position on the terminal.

# See http://askubuntu.com/a/558422, http://misc.flogisoft.com/bash/tip_colors_and_formatting for a good list
## Foreground colours
normal=$'%{\033[39m%}'
black=$'%{\033[30m%}'
darkgray=$'%{\033[90m%}'
red=$'%{\033[31m%}'
lightred=$'%{\033[91m%}'
green=$'%{\033[32m%}'
lightgreen=$'%{\033[92m%}'
yellow=$'%{\033[33m%}'
blue=$'%{\033[34m%}'
lightblue=$'%{\033[34m%}'
brightblue=$'%{\033[38;5;27m%}'
stashblue=$'%{\033[38;5;26m%}'
magenta=$'%{\033[35m%}'
lightpurple=$'%{\033[35m%}'
maroon=$'%{\033[38;5;88m%}'
cyan=$'%{\033[36m%}'
lightcyan=$'%{\033[36m%}'
lightgray=$'%{\033[37m%}'
white=$'%{\033[37m%}'
orange=$'%{\033[38;5;166m%}'
lightmagenta=$'%{\033[38;5;95m%}'
## Background colours
bg_normal=$'%{\033[49m%}'
bg_black=$'%{\033[40m%}'
bg_red=$'%{\033[41m%}'
bg_green=$'%{\033[42m%}'
bg_yellow=$'%{\033[43m%}'
bg_blue=$'%{\033[44m%}'
bg_magenta=$'%{\033[45m%}'
bg_cyan=$'%{\033[46m%}'
bg_lgray=$'%{\033[47m%}'
bg_gray=$'%{\033[100m%}'
bg_lred=$'%{\033[101m%}'
bg_lgreen=$'%{\033[102m%}'
bg_lyellow=$'%{\033[103m%}'
bg_lblue=$'%{\033[104m%}'
bg_lmagenta=$'%{\033[105m%}'
bg_lcyan=$'%{\033[106m%}'
bg_white=$'%{\033[107m%}'


# Powerline characters
## For Powerline characters see: echo -e "\ue0a0\ue0a1\ue0a2\ue0b0\ue0b1\ue0b2\ue0b3"
## Powerline font downloads: https://github.com/powerline/fonts
## Modern unicode patterns for Linux:
### PWRLN_SEP=$'\ue0b0'
### PWRLN_BRA=$'\ue0a0'
## I have replaced the unicode delarations with a simple copy+paste of the symbol, which seems to work in iTerm2 on MacOS.
PWRLN_SEP=$''
PWRLN_SEP_REV=$''
PWRLN_BRA=$''
