cask "bing-wallpaper-now" do
  arch arm: "aarch64", intel: "x64"

  version "1.3.2"
  sha256 arm:   "f4179baafea4e6ed6a6efb0667d3d8ce9054aa35b06a21d33c4621b160c95105",
         intel: "ae0adcaaa54f4e164b2b648294bfd0714a1c052edce225985ede475ea8f7a2ae"

  url "https://github.com/qiyuey/bing-wallpaper-now/releases/download/#{version}/Bing.Wallpaper.Now_#{version}_#{arch}.dmg"
  name "Bing Wallpaper Now"
  desc "Automatically fetch and set Bing daily wallpapers"
  homepage "https://github.com/qiyuey/bing-wallpaper-now"

  depends_on macos: ">= :catalina"

  app "Bing Wallpaper Now.app"

  zap trash: [
    "~/Library/Application Support/top.qiyuey.wallpaper",
  ]
end
