cask "bing-wallpaper-now" do
  arch arm: "aarch64", intel: "x64"

  version "1.4.2"
  sha256 arm:   "666490033a9820534e36c6058ddadfc7721c876e067edf128c8ec72ce1e872d3",
         intel: "3d3552926b436b369743a2ac9d0b2e4c507c64f476f2ab63e90819c9d7a3dc24"

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
