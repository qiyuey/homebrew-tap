cask "bing-wallpaper-now" do
  version "1.5.0"
  sha256 "00ad40fee1cc088e2e81e64ab4223c83e061f890e5dfc433e51df0ac94a33da7"

  url "https://github.com/qiyuey/bing-wallpaper-now/releases/download/#{version}/Bing.Wallpaper.Now_#{version}_aarch64.dmg"
  name "Bing Wallpaper Now"
  desc "Automatically fetch and set Bing daily wallpapers"
  homepage "https://github.com/qiyuey/bing-wallpaper-now"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :catalina

  app "Bing Wallpaper Now.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/Bing Wallpaper Now.app"],
                   must_succeed: false
  end

  uninstall launchctl: "top.qiyuey.wallpaper",
            quit:      "top.qiyuey.wallpaper"

  zap trash: [
    "~/Library/Application Support/top.qiyuey.wallpaper",
    "~/Library/Caches/top.qiyuey.wallpaper",
    "~/Library/LaunchAgents/top.qiyuey.wallpaper.plist",
    "~/Library/Saved Application State/top.qiyuey.wallpaper.savedState",
    "~/Library/WebKit/top.qiyuey.wallpaper",
    "~/Pictures/Bing Wallpaper Now",
  ]
end
