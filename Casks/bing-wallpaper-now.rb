cask "bing-wallpaper-now" do
  arch arm: "aarch64", intel: "x64"

  version "1.4.1"
  sha256 arm:   "1b644d60f9fcd9488c2358a04a1de6f184ba5a2b1b4bb89771df61907c5029fc",
         intel: "1c5070572433092f402705235fe64c3d4599e0a76c897e1a75139698e3fe879a"

  url "https://github.com/qiyuey/bing-wallpaper-now/releases/download/#{version}/Bing.Wallpaper.Now_#{version}_#{arch}.dmg"
  name "Bing Wallpaper Now"
  desc "Automatically fetch and set Bing daily wallpapers"
  homepage "https://github.com/qiyuey/bing-wallpaper-now"

  depends_on macos: ">= :catalina"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Bing Wallpaper Now.app"

  uninstall quit:      "top.qiyuey.wallpaper",
            launchctl: "top.qiyuey.wallpaper"

  zap trash: [
    "~/Library/Application Support/top.qiyuey.wallpaper",
    "~/Library/Caches/top.qiyuey.wallpaper",
    "~/Library/LaunchAgents/top.qiyuey.wallpaper.plist",
    "~/Library/Saved Application State/top.qiyuey.wallpaper.savedState",
    "~/Library/WebKit/top.qiyuey.wallpaper",
    "~/Pictures/Bing Wallpaper Now",
  ]
end
