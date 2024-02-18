cask "exodus" do
  arch arm: "macos-arm64", intel: "macos"

  version "24.2.12"
  sha256 arm:   "5628c095010d0053e9144cdd059df733b408a2c3f335863f334dd43152fce1d3",
         intel: "507abf2a57b91ad1cbf321f26040acd3fd5ea8531bd759a5a7ab1707e96508f0"

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
