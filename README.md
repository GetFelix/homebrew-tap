# GetFelix Homebrew tap

Homebrew formulae for [Felix](https://github.com/GetFelix/felix). It has one formula, `felixctl`, the
command-line tool for working with and managing a Felix cluster.

## Install

```bash
brew install getfelix/tap/felixctl
felixctl --version
```

This adds the tap and installs the latest release in one step. To add the tap first and use the short name:

```bash
brew tap getfelix/tap
brew install felixctl
```

The formula installs prebuilt binaries from the
[Felix releases](https://github.com/GetFelix/felix/releases), checked against their SHA-256:

| Platform | Architectures |
| --- | --- |
| macOS | Apple silicon (arm64), Intel (x86_64) |
| Linux | arm64, x86_64 |

It also installs the man page (`man felixctl`) and completions for bash, zsh and fish.

## Upgrade and uninstall

```bash
brew update && brew upgrade felixctl
```

```bash
brew uninstall felixctl
brew untap getfelix/tap
```

## Versions

Felix is in preview, and the formula tracks the newest release, previews included. There is one formula, so
an older version can't be installed side by side. For a specific version, download its archive from the
release page.

If `felixctl` was also installed with `cargo install`, run `which -a felixctl`. The first path listed is
the copy your shell runs.

## How the formula is updated

The Felix release workflow generates `Formula/felixctl.rb` for each release tag and pushes it here. Don't
edit it by hand: the next release overwrites it. Change the generator instead, in
[`scripts/homebrew_formula.py`](https://github.com/GetFelix/felix/blob/main/scripts/homebrew_formula.py).

## Help

- felixctl documentation: <https://docs.getfelix.dev/getting-started/felixctl/>
- Issues with felixctl or the formula: <https://github.com/GetFelix/felix/issues>

felixctl is licensed under AGPL-3.0-only.
