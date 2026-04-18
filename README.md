# alice

Hey — you found my dots. Welcome.

This is my NixOS system config. Everything I need to feel at home on a computer lives in here — the window manager, the terminal, the shell, the editor, the whole thing. One flake, one rebuild, done.

If you're just browsing, cool. If you're thinking about stealing something, also cool. Let me walk you through what's in here.

## What you're looking at

This is a [Nix flake](https://wiki.nixos.org/wiki/Flakes) built on [flake-parts](https://github.com/hercules-ci/flake-parts). The whole config is split into small, focused modules under `modules/` — no single file tries to do everything. The host machine is called **sin**, and the user is **alice**.

Here's the rough layout:

```
modules/
├── home/              # everything that follows alice around
│   ├── desktop/       # niri + noctalia (wm & bar)
│   ├── programs/      # kitty, zsh, neovim, browser, spotify, etc.
│   └── packages.nix   # standalone packages
├── hosts/sin/         # machine-specific system config
├── hardware/          # driver modules & hw profiles
└── gaming/            # steam, retroarch, lutris, the works
```

## The desktop

You'll find [Niri](https://github.com/YaLTeR/niri) here — a scrollable tiling Wayland compositor. It's clean, it's fast, and it stays out of your way. The bar is [Noctalia](https://github.com/noctalia-dev/noctalia-shell), which has its own color theme baked into the config.

Keybinds are vim-style (`Mod+H/J/K/L`), because of course they are. `Mod+Return` opens Kitty. `Mod+Q` closes things. You get the idea.

## The terminal & shell

[Kitty](https://sw.kovidgoyal.net/kitty/) with JetBrainsMono Nerd Font. Semi-transparent (`0.81` opacity), beam cursor with a cursor trail. It runs Zsh underneath.

Zsh comes with syntax highlighting, autosuggestions, and a few aliases you might recognize:

- `ls` → `eza --icons`
- `jj` → `lazygit`
- `quit` → `exit` (because sometimes you just want to say quit)

[Starship](https://starship.rs/) handles the prompt.

## The editor

Neovim, via [nvimdots](https://github.com/ayamir/nvimdots). LSP is set up for Bash, C/C++, Go, HTML, JSON, Lua, Python (Ruff), and Nix (nil). There's also an Undotree plugin wired to `<leader>u`, because undo history is underrated.

## The browser

[Helium](https://github.com/nickel-org/helium) — a Chromium fork. Comes with Proton Pass, Proton VPN, and Manus pre-installed as extensions.

## Gaming

Yeah, there's a gaming section. Steam runs through [Millennium](https://github.com/SteamClientHomebrew/Millennium), with Gamescope, Proton tools, and GameMode all ready to go. RetroArch and Lutris are there too. MangoHud + GOverlay for performance overlays.

## Music

Spotify through [Spicetify](https://spicetify.app/), with adblock and shuffle extensions. The color scheme is custom — dark with pink/red accents. It matches the rest of the desktop.

## Other tools worth mentioning

- **lazygit** + **gh** for git workflows
- **btop** for system monitoring
- **zoxide** for smarter `cd`
- **grim** + **slurp** + **swappy** for screenshots
- **cliphist** for clipboard history
- **pfetch** greeting on every new shell

## How it all gets built

If you actually want to use this (or parts of it), you'll need [Nix with flakes enabled](https://wiki.nixos.org/wiki/Flakes).

```bash
# build the system
sudo nixos-rebuild switch --flake .#sin
```

That's it. Everything else resolves from the flake.

There's also a GitHub Action that updates `flake.lock` on the first of every month, so inputs don't go stale without anyone noticing.

## One more thing

This is a personal config. It's shaped around how I use my machine — the keybinds, the colors, the tools, all of it. You're welcome to fork it, reference it, or pull pieces out of it. Just don't expect it to work perfectly for you out of the box. That's kind of the point of dotfiles — they're *yours*.

## License

[BSD 3-Clause](LICENSE)
