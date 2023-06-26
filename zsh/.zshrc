#make globbing more powerful (uses #, ^, ~ for patterns)
setopt extendedglob

#make globbing case insensitive
setopt NO_CASE_GLOB

PATH=/usr/local/opt/llvm/bin:$PATH
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/.ghcup/bin
PATH=$PATH:$HOME/.cabal/bin
export PATH="/usr/local/opt/curl/bin:$PATH"

# for the sake of tmux-256color
export TERMINFO_DIRS="$TERMINFO_DIRS:$HOME/.local/share/terminfo"

export LSCOLORS=Exfxcxdxbxegedabagacad

work() {
    source "create-mount"
}
krow() {
    if [[ $(pwd) =~ "/Volumes/$1" ]]; then
        cd
    fi
    diskutil umount /Volumes/$1
}

# vcs prompt
autoload -Uz vcs_info
precmd_functions+=(vcs_info) # how did this work (after a 2nd source) w/o the parens?
setopt prompt_subst
PROMPT='%n@%m %1~${vcs_info_msg_0_} %# '
zstyle ':vcs_info:git:*' formats '(%F{red}%b%f)'

alias ls='ls --color'
alias grep='grep --color'

# keymaps
bindkey \^U backward-kill-line

# opam configuration
[[ ! -r /Users/henry/.opam/opam-init/init.zsh ]] || source /Users/henry/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
export PATH="/usr/local/opt/ruby/bin:$PATH"
