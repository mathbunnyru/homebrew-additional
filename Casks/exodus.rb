cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "25.34.6"
  sha256 arm:   "77fb480152d2fd65061f0fd99f31910a45927054141eba0d082da3b71f567e54",
         intel: "3c488196662b9ea0c96153a17c7e28436910f5e8d0e3d83e2317b54f5f247124"

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
