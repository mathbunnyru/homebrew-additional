cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "24.33.4"
  sha256 arm:   "3611039fc81a8ee658e19e75f2e24f62623a7e455442cca759347de8166620c3",
         intel: "ed28ccd53d174f626155b866ebc5e0f42493ccc89a12ac01a4fcc3e67e4932be"

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
