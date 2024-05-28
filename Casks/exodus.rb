cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "24.21.3"
  sha256 arm:   "646cc93e95cdae9ec44e916726c50d41c45007cdcd5f19e9d930045d7a8d8446",
         intel: "3c8e156f2e532a4359f564b0db9f049222e698612678da47f56faaa206d3b400"

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
