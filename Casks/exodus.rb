cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "24.47.4"
  sha256 arm:   "6f98f6b2e1cb0b593ffc66c7fc442f6c3f981f9da6d397c7dda399e048582e35",
         intel: "b7da84fef5eaf5371762f6cdcb779688feeae5332e6a08cedb93af5eaa92feac"

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
