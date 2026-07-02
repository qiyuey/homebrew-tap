# qiyuey Homebrew Tap

Homebrew tap for qiyuey's macOS apps.

## Casks

| Cask | App | Requirement |
| --- | --- | --- |
| `bing-wallpaper-now` | [Bing Wallpaper Now](https://github.com/qiyuey/bing-wallpaper-now) | Apple Silicon, macOS 10.15+ |
| `lid` | [Lid](https://github.com/qiyuey/lid) | macOS 26+ |

## Install

```bash
brew tap qiyuey/tap
brew install --cask bing-wallpaper-now
brew install --cask lid
```

You can also install directly without tapping first:

```bash
brew install --cask qiyuey/tap/bing-wallpaper-now
brew install --cask qiyuey/tap/lid
```

## Update

```bash
brew update
brew upgrade --cask bing-wallpaper-now
brew upgrade --cask lid
```

## Uninstall

```bash
brew uninstall --cask bing-wallpaper-now
brew uninstall --cask lid
```

Both casks clear Gatekeeper quarantine after installation so first launch and
background components work consistently from Homebrew installs.
