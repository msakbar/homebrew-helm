# homebrew-helm

Homebrew tap for [Helm](https://github.com/msakbar/helm-terminal) — a menu-bar dashboard
for your Terminal windows.

## Install

```sh
brew install msakbar/helm/terminal
```

(or `brew tap msakbar/helm` once, then `brew install terminal`)

Helm builds from source, so it isn't Gatekeeper-quarantined — no "unidentified developer"
wall and no notarization required. Requires macOS 13+ and the Xcode Command Line Tools
(which Homebrew already depends on).

After install, link it into Applications and launch:

```sh
ln -sf "$(brew --prefix)/opt/terminal/Helm.app" /Applications/Helm.app
open /Applications/Helm.app
```

Update with `brew upgrade terminal`.

## Note

This tap (and the source repo) are currently private; the formula becomes installable by
others once both are made public.
