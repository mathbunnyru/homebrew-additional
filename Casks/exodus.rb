cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "25.24.2"
  sha256 arm:   "0b4b30a19829057eb5fcb980cc26729776dd84210038fa9679cb0bdd7909c971",
         intel: "67042e3eeeb298be9d0070a42c0e81a1e7e412bacc5bbc1021adb0d71d12a91d"

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
