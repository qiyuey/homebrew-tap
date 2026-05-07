cask "bing-wallpaper-now" do
  arch arm: "aarch64", intel: "x64"

  version "1.4.4"
  sha256 arm:   "23953316e8e3a8b21b9fc0939313ca2319443f054beb7941374bb7b8abe76918",
         intel: "5a81402b382ba6d544de59a8e3bc1a7e62928c72f376f9aa133ae7bd74527b60"

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
