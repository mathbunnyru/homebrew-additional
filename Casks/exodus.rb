cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "25.46.5"
  sha256 arm:   "d456cd0c09afe46177df000fbdff275a235b97a5354f300efc031839d4345135",
         intel: "1c82436698ad73229df693e975b23e1f315e6c09c1f249b53fa8684a9e706fb9"

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
