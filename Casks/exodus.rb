cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "26.1.30"
  sha256 arm:   "e2bd3b2de33c85775e5928e7867b6f0e362762610fa109b341381e5b812000d1",
         intel: "f6e9fa4991fbaa646f9cf4b759cb9e1030d95ba115951445d1467280cf062445"

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
