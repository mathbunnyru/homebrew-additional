cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "25.28.4"
  sha256 arm:   "99813c57cad2e2ccf45b16c9172ff683bb4820095d69454745726a8b02820bbb",
         intel: "2e9ccd8d88fbb5ac0048a36a369c69d6d70d6a6ff1cb0f0cf9194dbd61053b66"

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
