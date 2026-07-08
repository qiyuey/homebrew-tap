cask "lid" do
  version "2026.7.11"
  sha256 "f2e3092838ccd4fda286060061b4cf7753966ec9f122b9e2ace0a85c224e901f"

  url "https://github.com/qiyuey/lid/releases/download/v#{version}/Lid-#{version}-self-signed.dmg"
  name "Lid"
  desc "Lightweight modern menu bar control for MacBook lid-close sleep"
  homepage "https://github.com/qiyuey/lid"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Lid.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/Lid.app"],
                   must_succeed: false
  end

  uninstall quit: "top.qiyuey.lid"

  zap trash: [
    "~/Library/Application Support/top.qiyuey.lid",
    "~/Library/Caches/top.qiyuey.lid",
    "~/Library/HTTPStorages/top.qiyuey.lid",
    "~/Library/Preferences/top.qiyuey.lid.plist",
    "~/Library/Saved Application State/top.qiyuey.lid.savedState",
    "~/Library/WebKit/top.qiyuey.lid",
  ]
end
