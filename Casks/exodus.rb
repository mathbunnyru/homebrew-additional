cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "25.40.5"
  sha256 arm:   "b6cba9031cc839da0d64667a5f31b67b82c932f794d12488284575160154e4d9",
         intel: "53e986826de6cb32769d1e5abcf7d5c225d49db74485ed285e0510d98a95cf56"

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
