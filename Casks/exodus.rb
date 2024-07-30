cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "24.31.4"
  sha256 arm:   "d3d7826d156629d52aa1fdc04f325b69e5502cf2400a347e21bf7a3d1901f2b5",
         intel: "71b5a2caea3edd064155daf9790c016d5703fb648089c09efae05eec9c6b2dfa"

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
