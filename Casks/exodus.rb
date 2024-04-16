cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "24.15.5"
  sha256 arm:   "9522ccf3bc9cc440a6a848ae1427fa6cde042de2939d944269ca6c53a0f1c015",
         intel: "710fe940d0a8c8bc2fa4aa29d9f56ba91b7b1de4b6aa41d01d95f52b8df22dbe"

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
