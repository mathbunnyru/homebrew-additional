cask "decibel" do
  version "2.0b35"
  sha256 "c9788e547b09ba59bdef8abf4c634f9796823ef7f984691c608f2d37e92433f2"

  # s3.amazonaws.com/feisty-dog/ was verified as official when first introduced to the cask
  url "https://s3.amazonaws.com/feisty-dog/Decibel-#{version}.dmg", verified: "s3.amazonaws.com/feisty-dog/"
  name "Decibel"
  desc "Audio player tailored to the particular needs of audiophiles"
  homepage "https://www.feisty-dog.com/decibel/"

  app "Decibel.app"
end
