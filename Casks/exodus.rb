cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "25.46.7"
  sha256 arm:   "4cd490382d79f03f3f764b94646e3b9b7b2d2094e124157911808bc5986f35d5",
         intel: "250b1ee58ef5a6093466acb2f749b23476f26a6b4ae6c68fd22b2614840e872a"

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
