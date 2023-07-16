#!/bin/bash

languages=$(echo "golang c cpp typescript rust" | tr " " "\n")
core_utils=$(echo "find xargs sed awk" | tr " " "\n")

selected=$(echo -e "${languages}\n${core_utils}" | fzf --reverse)
if [[ -z "${selected}" ]]; then
    exit 1
fi

read -p "Enter Query: " query

if echo "${languages}" | grep -qs "${selected}"; then
    query=$(echo "${query}" | tr " " "+")
    tmux neww bash -c "curl --no-progress-meter cht.sh/${selected}/${query} | less -R"
else
    tmux neww bash -c "curl --no-progress-meter cht.sh/${selected}~${query} | less -R"
fi
