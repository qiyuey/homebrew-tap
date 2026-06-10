cask "bing-wallpaper-now" do
  arch arm: "aarch64", intel: "x64"

  version "1.4.6"
  sha256 arm:   "75544896d191fe2ac1811af042d5c7b8b2482b6678a88bd2829f931d969bf1bb",
         intel: "10e664afc01db6f68cb4bd936fd8a2f13453b31b88394cacdb77f8c3a0f09af5"

  url "https://github.com/qiyuey/bing-wallpaper-now/releases/download/#{version}/Bing.Wallpaper.Now_#{version}_#{arch}.dmg"
  name "Bing Wallpaper Now"
  desc "Automatically fetch and set Bing daily wallpapers"
  homepage "https://github.com/qiyuey/bing-wallpaper-now"

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
