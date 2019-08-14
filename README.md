# Lucas' Zsh config

This is my Zsh configuration. Feel free to clone/copy and reuse.

In August 2019, I migrated my work MacBook over to use [Zsh](https://en.wikipedia.org/wiki/Z_shell) (with [oh-my-zsh](https://ohmyz.sh/)) as my default shell. This repo contains the configuration I use, which as much as possible aims to mirror and enhance [my previous bash configuration](https://github.com/lucascosti/bashrc).

I use [powerlevel10k](https://github.com/romkatv/powerlevel10k) (which is a faster implementation of [powerlevel9k](https://github.com/Powerlevel9k/powerlevel9k)) to customise the look of the prompt. 

The main files that do the work are:

* [`~/.zshrc`](.zshrc): Contains the templated oh-my-zsh options (mostly commented out), and also my custom git aliases and other miscellaneous functions.
* [`~/zshscripts/themes/p10k-lucas.zsh`](zshscripts/themes/p10k-lucas.zsh): My custom powerlevel10k theme file. Powerlevel10k and this theme file are sourced in `.zshrc`. This theme uses glyphs that require a [Nerd Fonts-patched font](https://github.com/ryanoasis/nerd-fonts) in your terminal.
  
  <img src="https://raw.githubusercontent.com/lucascosti/zshrc/master/git-prompt.png" width="50%"> 

Also included in this repo are the files for my old and briefly-used [oh-my-zsh theme](zshscripts/themes/old_oh-my-zsh_theme).