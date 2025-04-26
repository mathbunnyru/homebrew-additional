cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "25.13.6"
  sha256 arm:   "3b5b580e0a36da5775b855eb37e93487c451050345750e87fed1d034e9805143",
         intel: "d8f369669b21e621063a7b13a76d4f3e635da524820cc9dfb86bc71471ff93e7"

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
