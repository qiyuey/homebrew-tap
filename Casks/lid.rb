cask "lid" do
  version "2026.7.4"
  sha256 "60025ec036f2d2568b51802555c8aa07a75ce489e214f9f087b88b2280628896"

  url "https://github.com/qiyuey/lid/releases/download/v#{version}/Lid-#{version}-self-signed.dmg"
  name "Lid"
  desc "Control MacBook lid-close sleep for long-running work"
  homepage "https://github.com/qiyuey/lid"

  depends_on macos: :tahoe

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Lid.app"

  uninstall quit:      "top.qiyuey.lid",
            launchctl: "top.qiyuey.lid.helper",
            delete:    [
              "/Library/LaunchDaemons/top.qiyuey.lid.helper.plist",
              "/Library/PrivilegedHelperTools/top.qiyuey.lid.helper",
            ]

  zap trash: [
    "~/Library/Application Support/top.qiyuey.lid",
    "~/Library/Caches/top.qiyuey.lid",
    "~/Library/HTTPStorages/top.qiyuey.lid",
    "~/Library/Preferences/top.qiyuey.lid.plist",
    "~/Library/Saved Application State/top.qiyuey.lid.savedState",
    "~/Library/WebKit/top.qiyuey.lid",
  ]
end
