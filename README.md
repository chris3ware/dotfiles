# github.com/chris3ware/dotfiles

chris3ware's dotfiles, managed with [chezmoi](https://www.chezmoi.io).

> [!TIP]
> Add machines configuration in `.chezmoidata.toml`. Update the hostname if desired prior to installation

Install them with:

```zsh
curl -fsLS https://raw.githubusercontent.com/chris3ware/dotfiles/main/install.sh | sh
```

This command will will run `install.sh` which will:

1. Download `chezmoi` to `~/.local/bin`
2. Clone this repository to `~/Developer/github.com/chris3ware/dotfiles` via HTTPS
3. Prompt for `age` passphrase to decrypt protected files
4. Store chezmoi state in `~/.local/state/chezmoi/chezmoistate.boltdb`
5. Apply dotfiles, install Homebrew packages via `Brewfile` and run `mise bootstrap`
