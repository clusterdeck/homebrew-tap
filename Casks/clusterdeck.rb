cask "clusterdeck" do
  arch arm: "arm64"

  version "0.1.0"
  sha256 "97c0482c861931ea932284708f70dd73722fab7cd63a5eaafc0d3231ccd6ce35"

  url "https://github.com/clusterdeck/releases/releases/download/v#{version}/Clusterdeck-darwin-#{arch}-#{version}.dmg"
  name "Clusterdeck"
  desc "Multi-cluster SSH workspace app (fork of Wave Terminal)"
  homepage "https://github.com/clusterdeck/app"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  auto_updates false

  app "Clusterdeck.app"

  zap trash: [
    "~/Library/Application Support/clusterdeck",
    "~/.config/clusterdeck",
  ]

  caveats do
    <<~EOS
      Clusterdeck is not (yet) code-signed or notarized. On first launch, macOS
      Gatekeeper will block it. To open it:

        Right-click Clusterdeck.app in Applications → Open → Open

      or clear the quarantine flag from the terminal:

        xattr -dr com.apple.quarantine /Applications/Clusterdeck.app
    EOS
  end
end
