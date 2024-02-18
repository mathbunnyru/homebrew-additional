cask 'boss-tone-studio-rc' do
  version '1.3.0'
  sha256 '005684a9f0048c8357db165a242c14dea2acfda203e8a79f3bfafdc2fe167141'

  # https://static.roland.com/ was verified as official when first introduced to the cask
  url "https://static.roland.com/assets/media/zip/bts_rc_m#{version.no_dots}.zip", verified: "https://static.roland.com/"
  name 'BOSS TONE STUDIO for RC'
  desc 'BOSS TONE STUDIO for RC provides additional functionality for Boss products'
  homepage 'http://bosstonecentral.com'

  pkg 'BOSS TONE STUDIO for RC.pkg'

  uninstall pkgutil: "jp.co.roland.BOSS-TONE-STUDIO-for-RC.pkg"
end
