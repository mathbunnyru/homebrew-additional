cask "decibel" do
  version "2.0b33"
  sha256 "0a6904a6785eaa6d2dc6f0334de5c3e413edd84db9b95964d3fb5afd108a4218"

  # s3.amazonaws.com/feisty-dog/ was verified as official when first introduced to the cask
  url "https://s3.amazonaws.com/feisty-dog/Decibel-#{version}.dmg", verified: "s3.amazonaws.com/feisty-dog/"
  name "Decibel"
  desc "Audio player tailored to the particular needs of audiophiles"
  homepage "https://www.feisty-dog.com/decibel/"

  app "Decibel.app"
end
