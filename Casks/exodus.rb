cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "26.2.4"
  sha256 arm:   "29b33b000ace3ddb9a6bb3ec1fcb9ab9484dd93d91d69277fd34c59b0ad6b43a",
         intel: "524c2c09fc52406de4a2e4373f1c58e923f83b72e76c893e1766a12008d91b38"

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
