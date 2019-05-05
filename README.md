# dotfiles

These are my dotfiles, managed by stow or xstow

## Ubuntu setup (requires curl):

    apt install curl
    bash <(curl -s https://raw.githubusercontent.com/laher/dotfiles/master/setup-ubuntu.sh)

    now cd into ~/dotfiles/ and ./install-pt2.sh

## Sync:

    `./push.sh` pushes all your stuff to package lists in `./packages/`
    `pmpy` does git push/pull
    `./pull.sh` installs/updates all your packages from lists in `./packages/` 
