cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "25.13.3"
  sha256 arm:   "83010e2c10687aa31ca2b710b6884f4542254dc874cbd6077495a092db5b1b0f",
         intel: "617f9e082fabb07d2d5543fb9e3664986ca228810f5059a42c375c8636766a64"

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
