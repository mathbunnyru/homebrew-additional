cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "25.9.2"
  sha256 arm:   "c0739bf1982ccf7857d4e5b1088ef797c5e8c3a6dbb9656ca82275eafa62a636",
         intel: "da49417e057b07041fd600f1edc1fd029d99eb8208767bb23ae456cbaea7c988"

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
