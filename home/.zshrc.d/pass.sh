#!/bin/bash

function passg {
        pass generate --clip "$1"
}


randpw(){ < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16};echo; }

