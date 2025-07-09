cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "25.28.3"
  sha256 arm:   "c05f43a3c40f64ee8d0ec268cf9204bc919428afa4b7a2023a5cf1132ab25ae4",
         intel: "776fb345dbf1369480922a84bd5ab6bac7a1d0df6517e3fb806a19b239e9e3dc"

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
