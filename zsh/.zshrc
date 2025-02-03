#make globbing more powerful (uses #, ^, ~ for patterns)
setopt extendedglob

#make globbing case insensitive
setopt NO_CASE_GLOB

PATH=/usr/local/opt/llvm/bin:$PATH
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/.ghcup/bin
PATH=$PATH:$HOME/.cabal/bin
PATH=$PATH:$HOME/go/bin
export PATH="/usr/local/opt/curl/bin:$PATH"

export LSCOLORS=Exfxcxdxbxegedabagacad

# vcs prompt
autoload -Uz vcs_info
precmd_functions+=(vcs_info) # how did this work (after a 2nd source) w/o the parens?
setopt prompt_subst
PROMPT='%n@%m %1~${vcs_info_msg_0_} %# '
zstyle ':vcs_info:git:*' formats '(%F{red}%b%f)'

alias ls='ls --color'
alias grep='grep --color'
alias air='air -build.stop_on_error=true -misc.clean_on_exit=true -screen.clear_on_rebuild=true'

# widgets
run_sessionizer() {
    # undo zshzle fd overwrites
    exec </dev/tty
    exec <&1
    tmux-sessionizer
}
zle -N run_sessionizer

# keybinds for Non-ZVM (may be overwritten by ZVM source below)
bindkey \^U backward-kill-line
bindkey \^F run_sessionizer

#zsh-vi-mode package
ZVM_INIT_MODE=sourcing # prevents overwriting of my keybinds below this
source /usr/local/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# keymaps during/overwriting ZVM
zvm_bindkey viins \^F run_sessionizer
zvm_bindkey vicmd \^F run_sessionizer

# opam configuration
[[ ! -r /Users/henry/.opam/opam-init/init.zsh ]] || source /Users/henry/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
export PATH="/usr/local/opt/ruby/bin:$PATH"
