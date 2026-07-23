# typed: false
# frozen_string_literal: true

# golem — mobile UI testing framework.
#
# The version / url / sha256 lines below are the release contract: they are
# rewritten in place by `scripts/release.sh --formula Formula/golem.rb` in the
# golem repo each time a release is cut, so this tap never drifts from what was
# actually shipped. The 0.0.0 placeholders below are populated at first release.
class Golem < Formula
  desc "Mobile UI testing framework"
  homepage "https://golem.fail"
  url "https://github.com/golem-fail/golem/releases/download/v0.8.2/golem-0.8.2-aarch64-apple-darwin.tar.gz"
  version "0.8.2"
  sha256 "3737fc26c753599acdd2b4a28106c667e86805e04eb3399ed0c86bdbd25c6ee9"
  # FSL-1.1-Apache-2.0 is source-available (converts to Apache-2.0 after 2y) and
  # is not an SPDX identifier, so it can't be represented as an SPDX license.
  license :cannot_represent

  # Prebuilt binary ships for macOS arm64 only (see the distribution plan).
  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "golem"
  end

  def caveats
    <<~EOS
      golem drives real devices, which needs host tooling this formula can't install:
        Android:  adb          →  brew install --cask android-platform-tools
        iOS:      Xcode + sims  →  xcode-select --install  (plus full Xcode from the App Store)

      Verify your environment:
        golem doctor
    EOS
  end

  test do
    assert_match "Mobile UI testing", shell_output("#{bin}/golem --help")
  end
end
