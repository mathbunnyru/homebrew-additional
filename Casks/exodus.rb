cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "25.40.6"
  sha256 arm:   "4258b15ed52821c7e757e62d063c9d83bc9988a227aab7c9a91005ac8076ea48",
         intel: "43048e766d730ad853d35982e7056ea810ee3323dda342caa6a0e81ee48185c8"

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
