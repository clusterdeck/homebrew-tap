cask "clusterdeck" do
  arch arm: "arm64"

  version "0.1.3"
  sha256 "8bc6132d1a96fd15cbede03c79e9e1e3d17f3c2bc056bcd0d62306f86d520c37"

  url "https://github.com/clusterdeck/releases/releases/download/v#{version}/Clusterdeck-darwin-#{arch}-#{version}.dmg"
  name "Clusterdeck"
  desc "Multi-cluster SSH workspace app (fork of Wave Terminal)"
  homepage "https://github.com/clusterdeck/app"

  auto_updates false
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Clusterdeck.app"

  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-dr", "com.apple.quarantine", "#{appdir}/Clusterdeck.app"]
  end

  zap trash: [
    "~/.config/clusterdeck",
    "~/Library/Application Support/clusterdeck",
  ]

  caveats do
    <<~EOS
      Clusterdeck is not (yet) code-signed or notarized by Apple. The quarantine
      flag is cleared automatically after install/upgrade, so macOS should let it
      open normally.

      If it's still blocked on first launch, clear it manually:

        Right-click Clusterdeck.app in Applications → Open → Open

      or from the terminal:

        xattr -dr com.apple.quarantine ~/Applications/Clusterdeck.app
        (or /Applications/Clusterdeck.app if installed system-wide)
    EOS
  end
end
