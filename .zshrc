# KEY BINDINGS
# bindkey -v
#bindkey -s 'd' 'bleh'
# TAB AUTO COMPLETION

autoload -U compinit && compinit
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

# Different colors based on filetypes
eval "$(dircolors)"
# Pagination for long lists of files
export COLUMNS # for subprocesses to know the number of columns on the screen

function ls {
    command ls -F -h --color=always -v --author --time-style=long-iso -C "$@" | less -R -X -F
}

## CLEARING DUPLICATE SEARCH HISTORY

HISTSIZE=2000
HISTFILE=~/.zsh_history
SAVEHIST=2000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ALIASES

## LS aliases

alias ll='ls -l'
alias la='ls -l -a'

alias c='clear'
alias p='echo'
alias vimconf='vim ~/.vimrc'
alias zconf='vim ~/.zshrc'
alias aweconf='vim ~/.config/awesome/rc.lua'
alias tconf='vim ~/.config/awesome/default/theme.lua'

# GIT CONFIGS

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
# WIP conditional function
# function kaomoji_exec() {
#     if [\$? = 0]
#     then
#         echo "%F{46}\(^_^\)%f"
#     else
#         echo "%F{009}\(O_O\)%f"
#     fi
# }
#✗

# MY COLOURS
ruby_red='#E0115F'
sea_green='#46cf76'
golden='#FFC300'
neon_aqua='51'
sky_blue='#26ABFF'
lt_cobalt='39'
blue_green='#75E6DA'
lavender='#CF9FFF'
plum='#CF268A'
plush='#E65C9C'
slate_blue='#6A5ACD'
plumm='#dda0dd'
purple='#c83fa9'
light_pink='#f3b0dc'
some_blue='#b6c0cc'
proc2_fg='#d5ad67'

# PROMPT SETUP
cmd_check="%(?.%F{$light_pink}(^_^)%f.%F{$golden}(O_O%)%f)" #ternary: %(?.either.or)
setopt PROMPT_SUBST
PS1='$cmd_check %{%F{$proc2_fg}%}[%1~]%f%{%F{85}%}$(parse_git_branch)%f %F{$some_blue}%u@%h \%f '

#export NVM_DIR="/home/titli/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

source /home/anusha/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ZSH SYNTAX HIGHLIGHT CUSTOMIZATIONS

ZSH_HIGHLIGHT_STYLES[alias]=fg=$blue_green,bold
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=$golden
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=$light_pink,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=$light_pink,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=$light_pink
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=$plush
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=$sky_blue
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=$sky_blue
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=250
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=8

alias config='/usr/bin/git --git-dir=/home/anusha/dotfiles --work-tree=/home/anusha'
