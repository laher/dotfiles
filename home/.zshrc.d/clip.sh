#!/bin/bash


type pbcopy >/dev/null || alias pbcopy='xclip -selection clipboard'
type pbpaste >/dev/null || alias pbpaste='xclip -selection clipboard -o'

function pbtee {
   cat | xclip -selection clipboard
}

