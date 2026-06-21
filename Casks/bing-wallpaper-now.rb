cask "bing-wallpaper-now" do
  version "1.4.8"
  sha256 "2249f577e576cb6ce86065fd7a52fdc58a9f86e0d6273e4f1bbfd93a729f9812"

  url "https://github.com/qiyuey/bing-wallpaper-now/releases/download/#{version}/Bing.Wallpaper.Now_#{version}_aarch64.dmg"
  name "Bing Wallpaper Now"
  desc "Automatically fetch and set Bing daily wallpapers"
  homepage "https://github.com/qiyuey/bing-wallpaper-now"

  depends_on arch: :arm64
  depends_on macos: :catalina

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
