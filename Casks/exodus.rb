cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "24.29.2"
  sha256 arm:   "7487b43d2290cc6b6e50f481660e6ac43bfbaedaf7d091a224e27503c323165a",
         intel: "a65871cb259fc9aa5781a9c282354a0570efee6bfaa72ac61896679a266a1912"

  url "https://downloads.exodus.com/releases/exodus-#{arch}-#{version}.dmg",
      user_agent: :fake
  name "Exodus"
  desc "Desktop wallet for cryptocurrency assets"
  homepage "https://www.exodus.com/"

  livecheck do
    url "https://www.exodus.com/releases/"
    regex(%r{/hashes[._-]exodus[._-]?v?(\d+(?:\.\d+)+)\.txt}i)
  end

  auto_updates true

  app "Exodus.app"

  zap trash: [
    "~/Library/Application Support/Exodus",
    "~/Library/Preferences/com.electron.exodus.helper.plist",
    "~/Library/Preferences/com.electron.exodus.plist",
    "~/Library/Saved Application State/com.electron.exodus.savedState",
  ]
end
