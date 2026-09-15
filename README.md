# chris3ware dotfiles

dotfiles, managed by `chezmoi`, for my machines.

## Fresh Mac Setup

On a brand new Mac, run:

```zsh
xcode-select --install
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --source "$HOME/Developer/github.com/chris3ware/dotfiles" --apply chris3ware
```

This single command will:

1. Download `chezmoi`
2. Clone this repository to `~/Developer/github.com/chris3ware/dotfiles` via HTTPS
3. Prompt for your `age` passphrase to decrypt protected files
4. Apply dotfiles, install Homebrew packages via `Brewfile`, and run `mise bootstrap`
