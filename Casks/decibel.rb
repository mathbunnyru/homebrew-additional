cask "decibel" do
  version "2.0b34"
  sha256 "56a109c925c66ac0230f989d98364c456236b7faa00312ead189ca737b8e2b1d"

  # s3.amazonaws.com/feisty-dog/ was verified as official when first introduced to the cask
  url "https://s3.amazonaws.com/feisty-dog/Decibel-#{version}.dmg", verified: "s3.amazonaws.com/feisty-dog/"
  name "Decibel"
  desc "Audio player tailored to the particular needs of audiophiles"
  homepage "https://www.feisty-dog.com/decibel/"

  app "Decibel.app"
end
