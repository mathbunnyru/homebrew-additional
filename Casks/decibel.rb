cask "decibel" do
  version "2.0b36"
  sha256 "86bd338e5d5244b19631771e124733a1927292e9d56d8391093759d810dffe71"

  # s3.amazonaws.com/feisty-dog/ was verified as official when first introduced to the cask
  url "https://s3.amazonaws.com/feisty-dog/Decibel-#{version}.dmg",
      verified: "s3.amazonaws.com/feisty-dog/"
  name "Decibel"
  desc "Audio player tailored to the particular needs of audiophiles"
  homepage "https://www.feisty-dog.com/decibel/"

  app "Decibel.app"
end
