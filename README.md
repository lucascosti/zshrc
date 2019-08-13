# Lucas' Zsh config

This is my Zsh configuration. Feel free to clone/copy and reuse.

In August 2019, I migrated my work MacBook over to use [Zsh](https://en.wikipedia.org/wiki/Z_shell) (with [oh-my-zsh](https://ohmyz.sh/)) as my default shell. This repo contains the configuration I use, which as much as possible aims to mirror and enhance [my previous bash configuration](https://github.com/lucascosti/bashrc).

The main oh-my-zsh plugin I use to enhance the prompt's git functionality is [`git-plugin`](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/git-prompt). Although it is not as functional as the fantastic [`bash-git-prompt`](https://github.com/magicmonty/bash-git-prompt), it is mostly there, and the rest of the Zsh functionality makes up for it.

The main files that do the work are:

* [`~/.zshrc`](.zshrc): Contains the templated oh-my-zsh options (mostly commented out), and also my custom git aliases and other miscellaneous functions.
* [`~/zshscripts/themes/lucas-theme.zsh-theme`](zshscripts/themes/lucas-theme.zsh-theme): The main theme file, which in addition to setting the style of a normal prompt, also significantly sets and configures the style for the `git-prompt` plugin.
  
  <img src="https://raw.githubusercontent.com/lucascosti/zshrc/master/git-prompt.png" width="50%"> 
  
  To use this theme in oh-my-zsh, it's easiest to copy or symlink this file to `~/.oh-my-zsh/themes/`. This theme requires that you use a [Powerline-patched font](https://github.com/powerline/fonts) in your terminal.
* [`~/zshscripts/lucas-colors.zsh`](zshscripts/lucas-colors.zsh): defines all the colors and powerline symbols as variables so I can easily use them for the shell prompt.
