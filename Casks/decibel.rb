cask "decibel" do
  version "2.0b32"
  sha256 "06132176828ac85a6939460a51a6df4ff6282a14b85165767d93b5994ea40c87"

  # https://s3.amazonaws.com/feisty-dog/ was verified as official when first introduced to the cask
  url "https://s3.amazonaws.com/feisty-dog/Decibel-#{version}.dmg", verified: "https://s3.amazonaws.com/feisty-dog/"
  name "Decibel"
  desc "Decibel is an audio player tailored to the particular needs of audiophiles"
  homepage "https://www.feisty-dog.com/decibel/"

  app "Decibel.app"
end
