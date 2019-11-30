#!/usr/bin/env bash
set -eu
if [ "$(uname)" == "Darwin" ]; then
    copy_cmd="pbcopy"
else
    copy_cmd="xclip -i -f -selection primary | xclip -i -selection clipboard"
fi

buf=$(cat "$@")
printf "%s" "$buf" | eval "$copy_cmd"
