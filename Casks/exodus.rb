cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "26.1.5"
  sha256 arm:   "6073577bc0dfd578847457fc1bf73c616a4b44f064876af632c3a1618ef99782",
         intel: "06c13788a614a348c4e04d1946a2892c4e63063e592b4f5afaaebdbb052c5e03"

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
