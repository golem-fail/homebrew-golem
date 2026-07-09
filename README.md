# homebrew-golem

Homebrew tap for [golem](https://github.com/golem-fail/golem) — a mobile UI testing framework.

```sh
brew install golem-fail/golem/golem
# or
brew tap golem-fail/golem
brew install golem
```

Installs a prebuilt, self-contained `golem` binary (the iOS/Android companions
are baked in). Driving devices still needs host tooling (`adb`, Xcode/simulators)
that Homebrew can't install — run `golem doctor` after installing to check.

macOS arm64 only for now.

## Maintenance

`Formula/golem.rb` is kept in sync automatically: `scripts/release.sh --formula`
in the golem repo rewrites the `url` / `version` / `sha256` lines on each release.
