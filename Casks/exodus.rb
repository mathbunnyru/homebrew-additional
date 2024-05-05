cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "24.17.5"
  sha256 arm:   "da022621d3bc644c4cce6816a6c06a20227b6ea0710b4cef8e813cb4766c22cd",
         intel: "ffd8629eb43e578cd887468ae36e2c5250df95a92fd4cf2fd352727f790bccc7"

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
