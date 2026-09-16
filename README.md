# chris3ware dotfiles

dotfiles, managed by `chezmoi`, for my machines.

## New Mac Setup

On a new Mac, run:

```zsh
xcode-select --install
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin" -- --persistent-state "$HOME/.local/state/chezmoi/chezmoistate.boltdb" init --source "$HOME/Developer/github.com/chris3ware/dotfiles" --apply chris3ware
```

This command will:

1. Download `chezmoi` to `~/.local/bin`
2. Clone this repository to `~/Developer/github.com/chris3ware/dotfiles` via HTTPS
3. Prompt for `age` passphrase to decrypt protected files
4. Store chezmoi state in `~/.local/state/chezmoi/chezmoistate.boltdb`
5. Apply dotfiles, install Homebrew packages via `Brewfile` and run `mise bootstrap`
