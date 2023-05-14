# dotfiles

These are my dotfiles, managed by stow or xstow

## Ubuntu setup (requires curl)

    sudo apt install curl
    bash <(curl -s https://raw.githubusercontent.com/laher/dotfiles/master/install.sh)

## Sync

    `./snapshot.sh` records all your packages (unversioned) to package lists in `./packages/`
    `pmpy` does a git commit->pull->push
    `./update.sh` installs/updates all your packages from lists in `./packages/`
