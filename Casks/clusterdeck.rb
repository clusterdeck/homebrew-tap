cask "clusterdeck" do
  arch arm: "arm64"

  version "0.1.1"
  sha256 "f08dca19e13fa14dafa78c190c673a924d625a9c4f3d727770ef24df91df169f"

  url "https://github.com/clusterdeck/releases/releases/download/v#{version}/Clusterdeck-darwin-#{arch}-#{version}.dmg"
  name "Clusterdeck"
  desc "Multi-cluster SSH workspace app (fork of Wave Terminal)"
  homepage "https://github.com/clusterdeck/app"

  auto_updates false
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Clusterdeck.app"

  zap trash: [
    "~/.config/clusterdeck",
    "~/Library/Application Support/clusterdeck",
  ]

  caveats do
    <<~EOS
      No admin rights? Install without sudo, into your user Applications folder:

        brew install --appdir=~/Applications --cask clusterdeck

      Clusterdeck is not (yet) code-signed or notarized, so macOS Gatekeeper will
      block it on first launch. To open it:

        Right-click Clusterdeck.app in Applications → Open → Open

      or clear the quarantine flag from the terminal:

        xattr -dr com.apple.quarantine ~/Applications/Clusterdeck.app
        (or /Applications/Clusterdeck.app if installed system-wide)
    EOS
  end
end
