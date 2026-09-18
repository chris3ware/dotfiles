# github.com/chris3ware/dotfiles

chris3ware's dotfiles, managed with [chezmoi](https://www.chezmoi.io).

> [!IMPORTANT]
> macOS requires Xcode Command Line Tools.
> Install with: `xcode-select --install` if required

Install them with:

```zsh
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --persistent-state "$HOME/.local/state/chezmoi/chezmoistate.boltdb" --source "$HOME/Developer/github.com/chris3ware/dotfiles" --apply chris3ware
```

This command will:

1. Download `chezmoi` to `~/.local/bin`
2. Clone this repository to `~/Developer/github.com/chris3ware/dotfiles` via HTTPS
3. Prompt for `age` passphrase to decrypt protected files
4. Store chezmoi state in `~/.local/state/chezmoi/chezmoistate.boltdb`
5. Apply dotfiles, install Homebrew packages via `Brewfile` and run `mise bootstrap`
