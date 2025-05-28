cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "25.13.7"
  sha256 arm:   "fb66ded1c2419e71ea5e7cae97d4511bc1e1a6e0b94e6771de495fb92ba5af11",
         intel: "931b3c845c1e83483d163e0772360be168c5cbd9d84b91a7094644f8f1a1c54b"

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
